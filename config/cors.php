<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Allowed Origins
    |--------------------------------------------------------------------------
    |
    | The allowed origins for CORS requests. Use "*" to allow all origins.
    |
    */

    'allowed_origins' => ['*'], // Atur domain yang diizinkan, bisa juga menggunakan * untuk semua

    /*
    |--------------------------------------------------------------------------
    | Allowed Methods
    |--------------------------------------------------------------------------
    |
    | The allowed HTTP methods for CORS requests.
    |
    */

    'allowed_methods' => ['*'], // Mengizinkan semua metode (GET, POST, PUT, DELETE)

    /*
    |--------------------------------------------------------------------------
    | Allowed Headers
    |--------------------------------------------------------------------------
    |
    | The allowed headers for CORS requests.
    |
    */

    'allowed_headers' => ['*'], // Mengizinkan semua header

    /*
    |--------------------------------------------------------------------------
    | Exposed Headers
    |--------------------------------------------------------------------------
    |
    | The headers that should be exposed to the browser.
    |
    */

    'exposed_headers' => [],

    /*
    |--------------------------------------------------------------------------
    | Max Age
    |--------------------------------------------------------------------------
    |
    | The maximum age (in seconds) of the preflight response.
    |
    */

    'max_age' => 0,

    /*
    |--------------------------------------------------------------------------
    | Supports Credentials
    |--------------------------------------------------------------------------
    |
    | Whether or not to allow credentials in CORS requests.
    |
    */

    'supports_credentials' => false,
];
