<?php

namespace App\Http\Controllers\Admin;

use App\Models\Category;
use App\Models\Translation;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use App\Exports\CategoryExport;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Maatwebsite\Excel\Facades\Excel;
use Rap2hpoutre\FastExcel\FastExcel;
use Illuminate\Support\Facades\Config;

class CategoryController extends Controller
{
    function index(Request $request)
    {
        $key = explode(' ', $request['search']);
        $categories = Category::with('module')->where(['position' => 0])->module(Config::get('module.current_module_id'))
            ->when(isset($key), function ($q) use ($key) {
                $q->where(function ($q) use ($key) {
                    foreach ($key as $value) {
                        $q->orWhere('name', 'like', "%{$value}%");
                    }
                });
            })
            ->latest()->paginate(config('default_pagination'));
        return view('admin-views.category.index', compact('categories'));
    }

    function sub_index(Request $request)
    {
        $key = explode(' ', $request['search']);
        $categories = Category::with(['parent'])->where(['position' => 1])->module(Config::get('module.current_module_id'))
            ->when(isset($key), function ($q) use ($key) {
                $q->where(function ($q) use ($key) {
                    foreach ($key as $value) {
                        $q->orWhere('name', 'like', "%{$value}%");
                    }
                });
            })
            ->latest()->paginate(config('default_pagination'));
        return view('admin-views.category.sub-index', compact('categories'));
    }

    function sub_sub_index()
    {
        return view('admin-views.category.sub-sub-index');
    }

    function sub_category_index()
    {
        return view('admin-views.category.index');
    }

    function sub_sub_category_index()
    {
        return view('admin-views.category.index');
    }

    function addon_index(Request $request){
        $key = explode(' ', $request['search']);
        $categories = Category::with(['parent'])->where(['position' => 3])->module(Config::get('module.current_module_id'))
            ->when(isset($key), function ($q) use ($key) {
                $q->where(function ($q) use ($key) {
                    foreach ($key as $value) {
                        $q->orWhere('name', 'like', "%{$value}%");
                    }
                });
            })
            ->latest()->paginate(config('default_pagination'));
        return view('admin-views.category.addon-index',compact('categories'));
    }

    function store(Request $request)
    {


        $request->validate([
            'name' => 'required|max:100',
            'name.0' => 'required',
        ], [
            'name.required' => translate('messages.Name is required!'),
            'name.0.required' => translate('default_name_is_required'),
        ]);

        $category = new Category();
        $category->name = $request->name[array_search('default', $request->lang)];
        $category->image = Helpers::upload('category/', 'png', $request->file('image'));
        $category->video =  $request->file('video') ? Helpers::upload('category/', 'mp4', $request->file('video')) : '';
        $category->parent_id = $request->parent_id == null ? 0 : $request->parent_id;
        $category->position = $request->position;
        $category->price = $request->price?$request->price:0;
        $category->title = $request->category_title ? $request->category_title[array_search('default', $request->lang)]:'';
        $category->module_id = isset($request->parent_id) ? Category::where('id', $request->parent_id)->first('module_id')->module_id : Config::get('module.current_module_id');
        $category->save();
        $default_lang = str_replace('_', '-', app()->getLocale());
        $data = [];
        foreach ($request->lang as $index => $key) {
            if ($default_lang == $key && !($request->name[$index])) {
                if ($key != 'default') {
                    array_push($data, array(
                        'translationable_type'  => 'App\Models\Category',
                        'translationable_id'    => $category->id,
                        'locale'                => $key,
                        'key'                   => 'name',
                        'value'                 => $category->name,
                    ));
                }
            } else {

                if ($request->name[$index] && $key != 'default') {
                    array_push($data, array(
                        'translationable_type'  => 'App\Models\Category',
                        'translationable_id'    => $category->id,
                        'locale'                => $key,
                        'key'                   => 'name',
                        'value'                 => $request->name[$index],
                    ));
                }
            }

            if ($request->category_title) {
                if ($default_lang == $key && !($request->category_title[$index])) {
                    if ($key != 'default') {
                        array_push($data, array(
                            'translationable_type'  => 'App\Models\Category',
                            'translationable_id'    => $category->id,
                            'locale'                => $key,
                            'key'                   => 'category_title',
                            'value'                 => $category->title,
                        ));
                    }
                } else {

                    if ($request->category_title[$index] && $key != 'default') {
                        array_push($data, array(
                            'translationable_type'  => 'App\Models\Category',
                            'translationable_id'    => $category->id,
                            'locale'                => $key,
                            'key'                   => 'category_title',
                            'value'                 => $request->category_title[$index],
                        ));
                    }
                }
            }
        }
        if (count($data)) {
            Translation::insert($data);
        }
        Toastr::success(translate('messages.category_added_successfully'));
        return back();
    }

    public function edit($id,$cat_title)
    {
        $category = Category::withoutGlobalScope('translate')->findOrFail($id);

        // dd($category);

        return view('admin-views.category.edit', compact('category','cat_title'));
    }

    public function status(Request $request)
    {
        $category = Category::find($request->id);
        $category->status = $request->status;
        $category->save();
        Toastr::success(translate('messages.category_status_updated'));
        return back();
    }

    public function featured(Request $request)
    {
        $category = Category::find($request->id);
        $category->featured = $request->featured;
        $category->save();
        Toastr::success(translate('messages.category_featured_updated'));
        return back();
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|max:100',
            'name.0' => 'required',
        ], [
            'name.0.required' => translate('default_name_is_required'),
        ]);

        $category = Category::find($id);
        $slug = Str::slug($request->name[array_search('default', $request->lang)]);
        $category->slug = $category->slug ? $category->slug : "{$slug}{$category->id}";
        $category->name = $request->name[array_search('default', $request->lang)];
        $category->image = $request->has('image') ? Helpers::update('category/', $category->image, 'png', $request->file('image')) : $category->image;
        $category->video = $request->has('video') ? Helpers::update('category/', $category->video, 'mp4', $request->file('video')) : $category->video;
        $category->title = $request->category_title ? $request->category_title[array_search('default', $request->lang)]:'';
        $category->price = $request->price?$request->price:0;
        $category->save();
        $default_lang = str_replace('_', '-', app()->getLocale());
        foreach ($request->lang as $index => $key) {
            if ($default_lang == $key && !($request->name[$index])) {
                if ($key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\Category',
                            'translationable_id'    => $category->id,
                            'locale'                => $key,
                            'key'                   => 'name'
                        ],
                        ['value'                 => $category->name]
                    );
                    if ($request->category_title) {
                        Translation::updateOrInsert(
                            [
                                'translationable_type'  => 'App\Models\Category',
                                'translationable_id'    => $category->id,
                                'locale'                => $key,
                                'key'                   => 'category_title'
                            ],
                            ['value'                 => $category->title]
                        );
                    }
                    
                }
            } else {

                if ($request->name[$index] && $key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\Category',
                            'translationable_id'    => $category->id,
                            'locale'                => $key,
                            'key'                   => 'name'
                        ],
                        ['value'                 => $request->name[$index]]
                    );

                    if ($request->category_title) {
                        Translation::updateOrInsert(
                            [
                                'translationable_type'  => 'App\Models\Category',
                                'translationable_id'    => $category->id,
                                'locale'                => $key,
                                'key'                   => 'category_title'
                            ],
                            ['value'                 => $request->category_title[$index]]
                        );
                    }
                }
            }

            
        }
        Toastr::success(translate('messages.category_updated_successfully'));
        return back();
    }

    public function delete(Request $request)
    {
        $category = Category::findOrFail($request->id);
        if ($category->childes->count() == 0) {
            $category->translations()->delete();
            $category->delete();
            Toastr::success('Category removed!');
        } else {
            Toastr::warning(translate('messages.remove_sub_categories_first'));
        }
        return back();
    }

    public function get_all(Request $request)
    {
        $data = Category::where('name', 'like', '%' . $request->q . '%')
            ->when($request->module_id, function ($query) use ($request) {
                $query->where('module_id', $request->module_id);
            })->limit(8)->get()

            ->map(function ($category) {
                $data = $category->position == 0 ? translate('messages.main') : translate('messages.sub');
                return [
                    'id' => $category->id,
                    'text' => $category->name . ' (' .  $data   . ')',
                ];
            });


        $data[] = (object)['id' => 'all', 'text' => 'All'];
        return response()->json($data);
    }

    public function update_priority(Category $category, Request $request)
    {
        $priority = $request->priority ?? 0;
        $category->priority = $priority;
        $category->save();
        Toastr::success(translate('messages.category_priority_updated successfully'));
        return back();
    }

    public function bulk_import_index()
    {
        return view('admin-views.category.bulk-import');
    }

    public function bulk_import_data(Request $request)
    {
        $request->validate([
            'products_file' => 'required|max:2048'
        ]);
        try {
            $collections = (new FastExcel)->import($request->file('products_file'));
        } catch (\Exception $exception) {
            Toastr::error(translate('messages.you_have_uploaded_a_wrong_format_file'));
            return back();
        }
        $module_id = Config::get('module.current_module_id');

        if ($request->button == 'import') {
            $data = [];
            foreach ($collections as $collection) {
                if ($collection['Name'] === "") {

                    Toastr::error(translate('messages.please_fill_all_required_fields'));
                    return back();
                }
                $parent_id = is_numeric($collection['ParentId']) ? $collection['ParentId'] : 0;
                array_push($data, [
                    'name' => $collection['Name'],
                    'image' => $collection['Image'],
                    'parent_id' => $parent_id,
                    'module_id' => $module_id,
                    'position' => $collection['Position'],
                    'priority' => is_numeric($collection['Priority']) ? $collection['Priority'] : 0,
                    'status' => $collection['Status'] == 'active' ? 1 : 0,
                    'created_at' => now(),
                    'updated_at' => now()
                ]);
            }
            try {
                DB::beginTransaction();

                $chunkSize = 100;
                $chunk_categories = array_chunk($data, $chunkSize);

                foreach ($chunk_categories as $key => $chunk_category) {
                    DB::table('categories')->insert($chunk_category);
                }
                DB::commit();
            } catch (\Exception $e) {
                DB::rollBack();
                info(["line___{$e->getLine()}", $e->getMessage()]);
                Toastr::error(translate('messages.failed_to_import_data'));
                return back();
            }
            Toastr::success(translate('messages.category_imported_successfully', ['count' => count($data)]));
            return back();
        }

        $data = [];
        foreach ($collections as $collection) {
            if ($collection['Name'] === "") {

                Toastr::error(translate('messages.please_fill_all_required_fields'));
                return back();
            }
            $parent_id = is_numeric($collection['ParentId']) ? $collection['ParentId'] : 0;
            array_push($data, [
                'id' => $collection['Id'],
                'name' => $collection['Name'],
                'image' => $collection['Image'],
                'parent_id' => $parent_id,
                'module_id' => $module_id,
                'position' => $collection['Position'],
                'priority' => is_numeric($collection['Priority']) ? $collection['Priority'] : 0,
                'status' => $collection['Status'] == 'active' ? 1 : 0,
                'updated_at' => now()
            ]);
        }
        try {
            DB::beginTransaction();

            $chunkSize = 100;
            $chunk_categories = array_chunk($data, $chunkSize);

            foreach ($chunk_categories as $key => $chunk_category) {
                DB::table('categories')->upsert($chunk_category, ['id', 'module_id'], ['name', 'image', 'parent_id', 'position', 'priority', 'status']);
            }
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            info(["line___{$e->getLine()}", $e->getMessage()]);
            Toastr::error(translate('messages.failed_to_import_data'));
            return back();
        }
        Toastr::success(translate('messages.category_imported_successfully', ['count' => count($data)]));
        return back();
    }

    public function bulk_export_index()
    {
        return view('admin-views.category.bulk-export');
    }

    public function bulk_export_data(Request $request)
    {
        $request->validate([
            'type' => 'required',
            'start_id' => 'required_if:type,id_wise',
            'end_id' => 'required_if:type,id_wise',
            'from_date' => 'required_if:type,date_wise',
            'to_date' => 'required_if:type,date_wise'
        ]);
        $categories = Category::when($request['type'] == 'date_wise', function ($query) use ($request) {
            $query->whereBetween('created_at', [$request['from_date'] . ' 00:00:00', $request['to_date'] . ' 23:59:59']);
        })
            ->when($request['type'] == 'id_wise', function ($query) use ($request) {
                $query->whereBetween('id', [$request['start_id'], $request['end_id']]);
            })->module(Config::get('module.current_module_id'))
            ->get();
        return (new FastExcel(Helpers::export_categories(Helpers::Export_generator($categories))))->download('Categories.xlsx');
    }

    // public function search(Request $request){
    //     $key = explode(' ', $request['search']);
    //     $categories=Category::when($request->sub_category, function($query){
    //         return $query->where('position','1');
    //     })->module(Config::get('module.current_module_id'))
    //     ->where(function ($q) use ($key) {
    //         foreach ($key as $value) {
    //             $q->orWhere('name', 'like', "%{$value}%");
    //         }
    //     })->limit(50)->get();

    //     if($request->sub_category)
    //     {
    //         return response()->json([
    //             'view'=>view('admin-views.category.partials._sub_category_table',compact('categories'))->render(),
    //             'count'=>$categories->count()
    //         ]);
    //     }
    //     return response()->json([
    //         'view'=>view('admin-views.category.partials._table',compact('categories'))->render(),
    //         'count'=>$categories->count()
    //     ]);
    // }

    public function export_categories(Request $request)
    {
        $key = explode(' ', $request['search']);
        $categories = Category::with('module')->where(['position' => 0])->module(Config::get('module.current_module_id'))
            ->when(isset($key), function ($q) use ($key) {
                $q->where(function ($q) use ($key) {
                    foreach ($key as $value) {
                        $q->orWhere('name', 'like', "%{$value}%");
                    }
                });
            })
            ->latest()
            ->get();

        $data = [
            'data' => $categories,
            'search' => $request['search'] ?? null,
        ];
        if ($request->type == 'csv') {
            return Excel::download(new CategoryExport($data), 'Categories.csv');
        }
        return Excel::download(new CategoryExport($data), 'Categories.xlsx');
    }

    public function show(string $id){
        $categories = Category::where('parent_id',$id)->select('id','name')->get();
        return $categories;
    }
}
