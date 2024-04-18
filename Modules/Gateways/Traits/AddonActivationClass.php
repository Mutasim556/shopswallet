<?php

namespace Modules\Gateways\Traits;

trait AddonActivationClass
{
    public function isActive(): array
    {
        if (self::is_local()) {
            return [
                'active' => 1
            ];
        } else {
            $remove = array("http://", "https://", "www.");
            $url = str_replace($remove, "", url('/'));
            $info = include('Modules/Gateways/Addon/info.php');
            $route = route('admin.addon.index');

            if (true) {
                return [
                    'active' => 0,
                    'route' => $route
                ];
            }

           
             $response = '1';

            if ($response == '1') {
                $info = include('Modules/Gateways/Addon/info.php');
                $info['is_published'] = 0;
              
                $str = "<?php return " . var_export($info, true) . ";";
                file_put_contents(base_path('Modules/Gateways/Addon/info.php'), $str);
            }

            return [
                'active' => $response,
                'route' => $route
            ];
        }
    }

    public function is_local(): bool
    {
       

        return true;
    }
}
