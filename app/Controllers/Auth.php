<?php

namespace App\Controllers;

use App\Models\PenggunaModel;
use CodeIgniter\HTTP\Response;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;
use ReflectionException;
use \Firebase\JWT\JWT;

class Auth extends BaseController
{
    /**
     * Register a new user
     * @return Response
     * @throws ReflectionException
     */
    public function register()
    {
        $rules = [
            'username' => 'required',
            'email' => 'required|min_length[6]|max_length[50]|valid_email|is_unique[pengguna.email]',
            'password' => 'required|min_length[8]|max_length[255]'
        ];

 $input = $this->getRequestInput($this->request);
        if (!$this->validateRequest($input, $rules)) {
            return $this
                ->getResponse(
                    $this->validator->getErrors(),
                    ResponseInterface::HTTP_BAD_REQUEST
                );
        }

        $penggunaModel = new PenggunaModel();
       $penggunaModel->save($input);
     

       

return $this
            ->getJWTForPengguna(
                $input['email'],
                ResponseInterface::HTTP_CREATED
            );

    }

    /**
     * Authenticate Existing User
     * @return Response
     */
    public function login()
    {
        $rules = [
            'email' => 'required|min_length[6]|max_length[50]|valid_email',
            'password' => 'required|min_length[8]|max_length[255]|validatePengguna[email, password]'
        ];

        $errors = [
            'password' => [
                'validatePengguna' => 'Invalid login credentials provided'
            ]
        ];

$input = $this->getRequestInput($this->request);


        if (!$this->validateRequest($input, $rules, $errors)) {
            return $this
                ->getResponse(
                    $this->validator->getErrors(),
                    ResponseInterface::HTTP_BAD_REQUEST
                );
        }
       return $this->getJWTForPengguna($input['email']);

       
    }

    private function getJWTForPengguna(
        string $emailAddress,
        int $responseCode = ResponseInterface::HTTP_OK
    )
    {
        try {
            $model = new PenggunaModel();
            $pengguna = $model->findPenggunaByEmailAddress($emailAddress);
            unset($pengguna['password']);

            helper('jwt');

            return $this
                ->getResponse(
                    [
                        'message' => 'User authenticated successfully',
                        'pengguna' => $pengguna,
                        'access_token' => getSignedJWTForPengguna($emailAddress)
                    ]
                );
        } catch (Exception $exception) {
            return $this
                ->getResponse(
                    [
                        'error' => $exception->getMessage(),
                    ],
                    $responseCode
                );
        }
    }
}