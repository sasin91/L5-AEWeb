<?php

namespace Tests\Unit\Account;

use App\Account;
use App\Enums\AccountFlag;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class AccountFlagTest extends TestCase
{
	public function accountFlagsAndExpansionNamesProvider(): array
	{
		return array_map(function ($flags) {
			return [
				$flags,
				AccountFlag::toExpansionName($flags)
			];
		}, AccountFlag::toArray());
	}

	/**
	 * @test
	 * @dataProvider accountFlagsAndExpansionNamesProvider
	 * @return void 
	 */
	public function testItResolvesTheValuesToTheirCounterParts(int $flags, string $expansion)
	{
		$this->assertEquals(
			$expansion,
			AccountFlag::toExpansionName($flags)
		);

		$this->assertEquals(
			$flags,
			AccountFlag::forExpansion($expansion)
		);
	}

	public function testItResolvesTheAccountFlagsForADefinedConstant()
	{
		$this->assertEquals(
			AccountFlag::CLASSIC_WOW,
			AccountFlag::forExpansion('CLASSIC_WOW')
		);
	}

	public function testAccountExpansionDefaultsToUnknown()
	{
		$this->assertEquals('Unknown', (new Account)->expansion);

		$this->assertEquals('Unknown', (new Account(['flags' => 9999]))->expansion);
	}
}
