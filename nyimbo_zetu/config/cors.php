<?php

return [
    'paths' => ['api/*', 'graphql'], // Add 'graphql'
    'allowed_methods' => ['*'],
    'allowed_origins' => ['http://localhost:5173'], // Vue dev server
    'allowed_origins_patterns' => [],
    'allowed_headers' => ['*'],
    'exposed_headers' => [],
    'max_age' => 0,
    'supports_credentials' => true,
];
