<?php

namespace App\Enums;

use BenSampo\Enum\Enum;
use Illuminate\Support\Str;

final class AccountFlag extends Enum
{
	const DEFAULT = self::WRATH_OF_THE_LICH_KING_AND_THE_BURNING_CRUSADE;

	const CLASSIC_WOW = 0;
	const THE_BURNING_CRUSADE = 8;
	const WRATH_OF_THE_LICH_KING = 16;
	const WRATH_OF_THE_LICH_KING_AND_THE_BURNING_CRUSADE = 24;
	const CATACLYSM = 32;
	const MISTS_OF_PANDARIA = 64;
	const WARLORDS_OF_DRAENOR = 128;
	const LEGION = 256;
	const BATTLE_FOR_AZEROTH = 512;

	/**
	 * Cast given flag value to an expansion name
	 * 
	 * @param  integer $value 
	 * @return string
	 */
	public static function toExpansionName($value): string
	{
		if (! self::hasValue($value)) {
			return 'Unknown';
		}

		return str_replace('_', ' ', Str::title(
			self::getKey($value)
		));
	}

	/**
	 * get the flags for given expansion
	 * 
	 * @param  string $expansion 
	 * @return integer
	 */
	public static function forExpansion(string $expansion):?int
	{
		if (self::hasKey($expansion)) {
			return self::getValue($expansion);
		}

		return self::getValue(
			Str::upper(
				Str::snake($expansion)
			)
		);
	}
}
