<?php

namespace App\Contracts;

interface Action 
{
	/**
	 * Execute the command
	 * 
	 * @return void             
	 */
	public function run();
}