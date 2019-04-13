<?php

namespace App\Http\Requests;

use App\GameServer;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateGameServerRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Configure the validator instance.
     *
     * @param  \Illuminate\Validation\Validator  $validator
     * @return void
     */
    public function withValidator($validator)
    {
        $validator->sometimes('address', 'ip', function ($input) {
            return $this->givenAddressIsAnIP($input);
        });

        $validator->sometimes('address', 'url', function ($input) {
            return !$this->givenAddressIsAnIP($input);
        });
    }

    private function givenAddressIsAnIP($input = null): bool
    {
        $address = data_get($input, 'address', $this->input('address'));

        return is_numeric(
            substr($address, -1)
        );
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'realm_id' => 'exists:ascemu_logon.realms,id',
            'name' => 'string|max:255|unique:game_servers,name',
            'description' => 'nullable|max:255',
            'address' => 'max:255',
            'port' => 'numeric|digits_between:1,6',
            'version' => ['required', Rule::in(GameServer::$supportedVersions)]
        ];
    }
}
