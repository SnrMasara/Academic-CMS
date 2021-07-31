<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class IsUserMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if (auth()->user()->is_admin) {
            return redirect()->route('admin.home');
        }

        return $next($request);
    }
    }

