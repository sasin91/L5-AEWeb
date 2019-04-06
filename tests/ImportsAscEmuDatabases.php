<?php

namespace Tests;

use Illuminate\Support\Facades\DB;

trait ImportsAscEmuDatabases
{
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
        $path = $path ?? base_path('/tests/__Fixtures__/sql/ascemu_logon.sql');

        $this->ascEmuConnection('logon')->unprepared(
            file_get_contents($path)
        );
    }

    public function importAscEmuCharactersDatabase(string $path = null)
    {
        $path = $path ?? base_path('/tests/__Fixtures__/sql/ascemu_characters.sql');

        $this->ascEmuConnection('characters')->unprepared(
            file_get_contents($path)
        );
    }

    public function importAscEmuWorldDatabase(string $path = null)
    {
        $path = $path ?? base_path('/tests/__Fixtures__/sql/ascemu_world.sql');

        $this->ascEmuConnection('world')->unprepared(
            file_get_contents($path)
        );
    }
}
