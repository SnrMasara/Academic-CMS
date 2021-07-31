<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use \DateTimeInterface;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Project extends Model
{
    use SoftDeletes, HasFactory;

    public $table = 'projects';

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $fillable = [
        'name',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format('Y-m-d H:i:s');
    }

    public function users()
    {
        return $this->belongsToMany(User::class);
    }
    public function folders(){
        return$this->hasMany(Folder::class);
    }
    public function getFilesAttribute()
    {
        if ($this->parentDirectory) {
            return $this->parentDirectory->files;
        }

        return collect();
    }

    public function getImagesAttribute()
    {
        if ($this->parentDirectory) {
            return $this->parentDirectory->images;
        }

        return collect();
    }

    public function getThumbnailAttribute()
    {
        if ($this->thumbnail_id) {
            $image = Media::firstWhere('id', $this->thumbnail_id);
            $image->thumbnail = substr($image->mime_type, 0, 5) == 'image' ? $image->getUrl('thumb') : null;
        } else {
            $image = $this->images->first();
        }

        return $image;
    }

}
