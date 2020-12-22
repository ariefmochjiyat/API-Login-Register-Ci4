<?php

namespace App\Validation;

use App\Models\PenggunaModel;
use Exception;

class PenggunaRules
{
    public function validatePengguna(string $str, string $fields, array $data): bool
    {
        try {
            $model = new PenggunaModel();
            $pengguna = $model->findPenggunaByEmailAddress($data['email']);
            return password_verify($data['password'], $pengguna['password']);
        } catch (Exception $e) {
            return false;
        }
    }
}