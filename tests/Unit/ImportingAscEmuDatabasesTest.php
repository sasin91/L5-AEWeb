<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Support\Facades\DB;
use Tests\ImportsAscEmuDatabases;
use Tests\TestCase;

class ImportingAscEmuDatabasesTest extends TestCase
{
	use RefreshDatabase, ImportsAscEmuDatabases;

	public function testItImportsTheDatabases()
	{
		$this->ImportsAscEmuDatabases();

		$logonTables = $this->ascEmuConnection('logon')->getDoctrineSchemaManager()->listTableNames();

		$this->assertNotEmpty($logonTables);

		$characterTables = $this->ascEmuConnection('characters')->getDoctrineSchemaManager()->listTableNames();

		$this->assertNotEmpty($characterTables);

		$worldTables = $this->ascEmuConnection('world')->getDoctrineSchemaManager()->listTableNames();

		$this->assertNotEmpty($worldTables);
	}
}
