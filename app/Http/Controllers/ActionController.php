<?php

namespace App\Http\Controllers;

use App\Action;
use Illuminate\Http\Request;

class ActionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->authorize('list', new Action);

        return view('actions.index')
            ->with(
                'actions',
                Action::with('creator', 'actionable')
                    ->latest()
                    ->paginate()
            );
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Action  $action
     * @return \Illuminate\Http\Response
     */
    public function show(Action $action)
    {
        $this->authorize('view', $action);

        return view('actions.show')->with('action', $action->loadMissing('creator', 'actionable'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Action  $action
     * @return \Illuminate\Http\Response
     */
    public function destroy(Action $action)
    {
        $this->authorize('delete', $action);

        $action->delete();

        return back()->with('status', __('Action deleted.'));
    }
}
