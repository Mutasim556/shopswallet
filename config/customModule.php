<?php


return [
        'subscription'=>[
            'status'=>true,
            'prefix'=>'admin/subscription',
            'route'=>'routes/customModules/subscription.php',
            'routes'=>[
                [
                    'menu_name'=>'Packages',
                    'route_name'=>"subscription.packages.index",
                ],
            ]
        ]
];