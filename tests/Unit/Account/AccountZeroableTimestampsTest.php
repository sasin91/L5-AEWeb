<?php

namespace Tests\Unit\Account;

use App\Account;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class AccountZeroableTimestampsTest extends TestCase
{
    public function zeroableTimestampAttributesProvider(): array
    {
        return [
            ['banned'],
            ['muted'],
        ];
    }

    /**
     * @test
     * @dataProvider zeroableTimestampAttributesProvider
     */
    public function testItCastsTheAttributeToADateTimeWhenGreaterThanZero($attribute)
    {
        $this->assertInstanceOf(
            \DateTimeInterface::class,
            (new Account([$attribute => 1000]))->$attribute
        );
    }

    /**
     * @test
     * @dataProvider zeroableTimestampAttributesProvider
     */
    public function testItDoesNotCastAZeroToADateTimeInstance($attribute)
    {
        $this->assertEquals(
            0,
            (new Account([$attribute => 0]))->$attribute
        );
    }
}
