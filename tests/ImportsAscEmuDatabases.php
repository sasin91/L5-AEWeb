<?php

namespace Tests;

use Illuminate\Support\Facades\DB;

trait ImportsAscEmuDatabases
{
    private $hasImportedLogon = false;
    private $hasImportedCharacters = false;
    private $hasImportedWorld = false;

    public function importsAscEmuDatabases()
    {
        $this->importAscEmuLogonDatabase();
        $this->importAscEmuCharactersDatabase();
        $this->importAscEmuWorldDatabase();
    }


    public function ascEmuConnection(string $segment)
    {
        return DB::connection("ascemu_{$segment}");
    }

    public function importAscEmuLogonDatabase(string $path = null)
    {
        if ($this->hasImportedLogon) {
            return;
        }

        $path = $path ?? base_path('/tests/__Fixtures__/sql/ascemu_logon.sql');

        $this->ascEmuConnection('logon')->unprepared(
            file_get_contents($path)
        );

        $this->hasImportedLogon = true;
    }

    public function importAscEmuCharactersDatabase(string $path = null)
    {
        if ($this->hasImportedCharacters) {
            return;
        }

        $path = $path ?? base_path('/tests/__Fixtures__/sql/ascemu_characters.sql');

        $this->ascEmuConnection('characters')->unprepared(
            file_get_contents($path)
        );

        $this->hasImportedCharacters = true;
    }

    public function importAscEmuWorldDatabase(string $path = null)
    {
        if ($this->hasImportedWorld) {
            return;
        }

        $path = $path ?? base_path('/tests/__Fixtures__/sql/ascemu_world.sql');

        $this->ascEmuConnection('world')->unprepared(
            file_get_contents($path)
        );

        $this->hasImportedWorld = true;
    }
}
