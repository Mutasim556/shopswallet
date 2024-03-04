<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ServiceCity;
use App\Models\Translation;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Str;

class CityController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $data) : View
    {
        $key = explode(' ', $data['search']);
        $cities = ServiceCity::when(isset($key), function ($q) use ($key) {
                $q->where(function ($q) use ($key) {
                    foreach ($key as $value) {
                        $q->orWhere('name', 'like', "%{$value}%");
                    }
                });
            })
            ->latest()->paginate(config('default_pagination'));
        return view('admin-views.service.city.index',compact('cities'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // dd($request);
        $request->validate([
            'name' => 'required|max:100',
            'name.0' => 'required',
        ], [
            'name.required' => translate('messages.Name is required!'),
            'name.0.required' => translate('default_name_is_required'),
        ]);

        $city = new ServiceCity();
        $city->name = $request->name[array_search('default', $request->lang)];
        $slug = Str::slug($request->name[array_search('default', $request->lang)]);
        $city->slug = $slug;
        $city->save();
        $default_lang = str_replace('_', '-', app()->getLocale());
        $data = [];
        foreach ($request->lang as $index => $key) {
            if ($default_lang == $key && !($request->name[$index])) {
                if ($key != 'default') {
                    array_push($data, array(
                        'translationable_type'  => 'App\Models\ServiceCity',
                        'translationable_id'    => $city->id,
                        'locale'                => $key,
                        'key'                   => 'name',
                        'value'                 => $city->name,
                    ));
                }
            } else {

                if ($request->name[$index] && $key != 'default') {
                    array_push($data, array(
                        'translationable_type'  => 'App\Models\ServiceCity',
                        'translationable_id'    => $city->id,
                        'locale'                => $key,
                        'key'                   => 'name',
                        'value'                 => $request->name[$index],
                    ));
                }
            }

            
        }
        if (count($data)) {
            Translation::insert($data);
        }
        Toastr::success(translate('messages.city_added_successfully'));
        return back();
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $city = ServiceCity::withoutGlobalScope('translate')->findOrFail($id);

        // dd($category);
        $city_title = translate('messages.city');

        return view('admin-views.service.city.edit', compact('city','city_title'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $data, string $id)
    {
        $data->validate([
            'name' => 'required|max:100',
            'name.0' => 'required',
        ], [
            'name.0.required' => translate('default_name_is_required'),
        ]);

        $city = ServiceCity::find($id);
        $slug = Str::slug($data->name[array_search('default', $data->lang)]);
        $city->slug = $city->slug ? $city->slug : "{$slug}{$city->id}";
        $city->name = $data->name[array_search('default', $data->lang)];
        
        $city->save();
        $default_lang = str_replace('_', '-', app()->getLocale());
        foreach ($data->lang as $index => $key) {
            if ($default_lang == $key && !($data->name[$index])) {
                if ($key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\ServiceCity',
                            'translationable_id'    => $city->id,
                            'locale'                => $key,
                            'key'                   => 'name'
                        ],
                        ['value'                 => $city->name]
                    );
                   
                    
                }
            } else {

                if ($data->name[$index] && $key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\ServiceCity',
                            'translationable_id'    => $city->id,
                            'locale'                => $key,
                            'key'                   => 'name'
                        ],
                        ['value'                 => $data->name[$index]]
                    );

                  
                }
            }

            
        }
        Toastr::success(translate('messages.city_updated_successfully'));
        return back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $city = ServiceCity::findOrFail($id);
        $city->translations()->delete();
        $city->delete();
        Toastr::success('City removed!');
       
        return back();
    }

    public function status(Request $request) {
        $city = ServiceCity::find($request->id);
        $city->status = $request->status;
        $city->save();
        Toastr::success(translate('messages.city_status_updated'));
        return back();
    }
}
