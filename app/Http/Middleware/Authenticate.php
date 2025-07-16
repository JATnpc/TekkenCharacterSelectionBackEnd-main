<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Closure;

class Authenticate extends Middleware
{
    public function handle($request, Closure $next, ...$guards)
    {
        return parent::handle($request, $next, ...$guards);
    }

    protected function redirectTo($request)
    {
        // For API requests, do not redirect, just return null (causes 401 JSON response)
        if ($request->expectsJson()) {
            return null;
        }
        // For web requests, you could return a route name if needed, e.g.:
        // return route('login');
    }
}
