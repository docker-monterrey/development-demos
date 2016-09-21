<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Vote;
use App\Http\Requests;

class VotesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index(){
      $votes = Vote::all();
      return response()->json($votes);
    }

    /**
    * Show the given vote.
    *
    * @param  int  $id
    * @return Response
    */
    public function show($id)
    {
      $vote = Vote::find($id);
      return response()->json($vote);
    }

    /**
  	 * Store a newly created resource in storage.
  	 *
  	 * @return Response
  	 */
  	public function store(Request $request)
    {
  		$vote = new Vote;
      $vote->vote_id = $request->input('vote_id');
      $vote->option  = $request->input('option');
  		if ($vote->save()) { http_response_code(201); return response()->json($vote); }
  	}
}
