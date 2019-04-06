<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeActionsController extends Controller
{
    public function index()
    {
        return view('home')->with(
            'actions',
            Auth::user()->actions()->latest()->paginate()
        );
    }
}
