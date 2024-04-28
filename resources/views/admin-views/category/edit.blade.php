@extends('layouts.admin.app')

@section('title',translate('messages.Update category'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-header-title">
                <span class="page-header-icon">
                    <img src="{{asset('public/assets/admin/img/edit.png')}}" class="w--20" alt="">
                </span>
                <span>
                    {{$cat_title?$cat_title.' ':''}}{{translate('messages.update')}}
                </span>
            </h1>
        </div>
        <!-- End Page Header -->
        <div class="card">
            <div class="card-body">
                <form action="{{route('admin.category.update',[$category['id']])}}" method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        @php($language=\App\Models\BusinessSetting::where('key','language')->first())
                        @php($language = $language->value ?? null)
                        @php($default_lang = str_replace('_', '-', app()->getLocale()))
                        <div class="col-md-12">
                            @if($language)
                                <ul class="nav nav-tabs mb-4">
                                    <li class="nav-item">
                                        <a class="nav-link lang_link active"
                                        href="#"
                                        id="default-link">{{translate('messages.default')}}</a>
                                    </li>
                                    @foreach (json_decode($language) as $lang)
                                        <li class="nav-item">
                                            <a class="nav-link lang_link"
                                                href="#"
                                                id="{{ $lang }}-link">{{ \App\CentralLogics\Helpers::get_language_name($lang) . '(' . strtoupper($lang) . ')' }}</a>
                                        </li>
                                    @endforeach
                                </ul>
                            @endif
                        </div>
                        <div class="col-md-6">
                            @if($language) 
                                <div class="form-group lang_form" id="default-form">
                                    <label class="input-label" for="exampleFormControlInput1">{{translate('messages.name')}} ({{ translate('messages.default') }})</label>
                                    <input type="text" name="name[]" class="form-control" placeholder="{{translate('messages.new_category')}}" maxlength="191" value="{{$category?->getRawOriginal('name')}}" oninvalid="document.getElementById('en-link').click()">
                                    @php($mod_check = DB::table('modules')->where('id', session()->get('current_module'))->first())
                                    @if (($mod_check->module_type == 'services' && $category->position==0) || ($mod_check->module_type == 'booking' && $category->position==0))
                                        <label class="input-label mt-3" for="exampleFormControlInput1">{{translate('messages.category_title')}} ({{ translate('messages.default') }})</label>
                                        <input type="text" name="category_title[]" class="form-control" placeholder="{{translate('messages.category_title')}}" maxlength="191" value="{{$category?->getRawOriginal('title')}}" oninvalid="document.getElementById('en-link').click()">
                                    @elseif(($mod_check->module_type == 'services' && $category->position==3)||($mod_check->module_type == 'booking' && $category->position==3))
                                        <label class="input-label mt-2"
                                        for="exampleFormControlInput1">{{ translate('messages.Add_on_title') }}
                                        ({{ translate('messages.default') }})</label>
                                        <input type="text" name="category_title[]" class="form-control" placeholder="{{translate('messages.Add_on_title')}}" maxlength="191" value="{{$category?->getRawOriginal('title')}}" oninvalid="document.getElementById('en-link').click()">
                                    @endif
                                </div>
                                <input type="hidden" name="lang[]" value="default">
                                @foreach(json_decode($language) as $lang)

                                    <?php
                                        if(count($category['translations'])){
                                            $translate = [];
                                            foreach($category['translations'] as $t)
                                            {
                                                if($t->locale == $lang && $t->key=="name"){
                                                    $translate[$lang]['name'] = $t->value;
                                                }
                                                if($t->locale == $lang && $t->key=="category_title"){
                                                    $translate[$lang]['category_title'] = $t->value;
                                                }
                                            }
                                        }
                                    ?>
                                    <div class="form-group d-none lang_form" id="{{$lang}}-form">
                                        <label class="input-label" for="exampleFormControlInput1">{{translate('messages.name')}} ({{strtoupper($lang)}})</label>
                                        <input type="text" name="name[]" class="form-control" placeholder="{{translate('messages.new_category')}}" maxlength="191" value="{{$translate[$lang]['name']??''}}" oninvalid="document.getElementById('en-link').click()">

                                        @if (($mod_check->module_type == 'services'  && $category->position==0)||($mod_check->module_type == 'booking' && $category->position==3))
                                        <label class="input-label mt-3" for="exampleFormControlInput1">{{translate('messages.category_title')}} ({{ translate('messages.default') }})</label>
                                        <input type="text" name="category_title[]" class="form-control" placeholder="{{translate('messages.category_title')}}" maxlength="191" value="{{$translate[$lang]['category_title']??''}}" oninvalid="document.getElementById('en-link').click()">

                                    
                                    @elseif(($mod_check->module_type == 'services' && $category->position==3)||($mod_check->module_type == 'booking' && $category->position==3))
                                        <label class="input-label mt-2"
                                        for="exampleFormControlInput1">{{ translate('messages.Add_on_title') }}
                                        ({{ translate('messages.default') }})</label>
                                        <input type="text" name="category_title[]" class="form-control" placeholder="{{translate('messages.Add_on_title')}}" maxlength="191" value="{{$translate[$lang]['category_title']??''}}" oninvalid="document.getElementById('en-link').click()">
                                    @endif
                                    </div>
                                    <input type="hidden" name="lang[]" value="{{$lang}}">
                                @endforeach
                            @else
                                <div class="form-group">
                                    <label class="input-label" for="exampleFormControlInput1">{{translate('messages.name')}}</label>
                                    <input type="text" name="name" class="form-control" placeholder="{{translate('messages.new_category')}}" value="{{$category['name']}}" maxlength="191">

                                    <label class="input-label mt-2"
                                        for="exampleFormControlInput1">{{ translate('messages.Add_on_title') }}
                                        ({{ translate('messages.default') }})</label>
                                    <input type="text" name="category_title[]" class="form-control"
                                        placeholder="{{ translate('messages.new_category_title') }}" value="{{$category?->getRawOriginal('title')}}" maxlength="191"
                                        oninvalid="document.getElementById('en-link').click()">
                                </div>
                                <input type="hidden" name="lang[]" value="{{$lang}}">
                            @endif
                            {{-- @if ($category->position == 2 && $mod_check->module_type == 'services')
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlSelect1">Categories
                                    <span class="input-label-secondary">*</span></label>
                                <select id="selectCategory" name="category_id" class="form-control" required>
                                    <option value="">Please Select</option>
                                    @foreach (\App\Models\Category::where(['position' => 0])->where('module_id', session()->get('current_module'))->get() as $cat)
                                        <option value="{{ $cat['id'] }}" {{ $cat->id==$category->parent_id?'selected':'' }}>{{ $cat['name'] }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlSelect1">Sub Categories
                                    <span class="input-label-secondary">*</span></label>
                                <select id="selectCategory2" name="parent_id" class="form-control" required>
                                    <option value="">Please Select</option>
    
                                </select>
                            </div>
                            @endif --}}
                            @if($category->position == 0)
                            <div class="form-group mb-0 pt-md-4">
                                <label class="input-label">{{translate('messages.module')}}</label>
                                <select name="module_id" id="module_id" required class="form-control js-select2-custom"  data-placeholder="{{translate('messages.select_module')}}" disabled>
                                        <option value="" selected disabled>{{translate('messages.select_module')}}</option>
                                    @foreach(\App\Models\Module::notParcel()->get() as $module)
                                        <option value="{{$module->id}}" {{$category->module_id==$module->id?'selected':''}}>{{$module->module_name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            @elseif (($category->position == 3 && $mod_check->module_type == 'services')||($category->position == 3 && $mod_check->module_type == 'booking'))
                            <div class="form-group">
                                <label class="input-label"
                                    for="exampleFormControlInput1">{{ translate('messages.add_on_price') }}</label>
                                <input type="text" name="price" class="form-control"
                                    placeholder="{{ translate('messages.add_on_price') }}" value="{{$category?->getRawOriginal('price')}}"
                                    maxlength="191">
                            </div>
                            @endif
                        </div>
                        <div class="col-md-6">
                            @if ($category->position == 0)
                            <div class="h-100 d-flex flex-column">
                                <label class="mb-0">{{translate('messages.image')}}
                                    <small class="text-danger">* ( {{translate('messages.ratio')}} 1:1 )</small>
                                </label>
                                <center class="py-3 my-auto">
                                    <img class="img--100" id="viewer"
                                        src="{{asset('storage/app/public/category')}}/{{$category['image']}}"
                                        onerror='this.src="{{asset('public/assets/admin/img/900x400/img1.jpg')}}"'
                                        alt=""/>
                                </center>
                                <div class="custom-file">
                                    <input type="file" name="image" id="customFileEg1" class="custom-file-input"
                                            accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                    <label class="custom-file-label mb-0" for="customFileEg1">{{translate('messages.choose_file')}}</label>
                                </div>
                            </div>
                            @elseif (($category->position == 1 && $mod_check->module_type == 'services')||($category->position == 1 && $mod_check->module_type == 'booking'))
                            <div class="col-md-12">
                                <div class="h-100 d-flex flex-column">
                                    <label class="m-0">{{ translate('messages.image') }} <small class="text-danger">* (
                                            {{ translate('messages.ratio') }} 1:1)</small></label>
                                    <center class="py-3 my-auto">
                                        <img class="img--100" id="viewer"
                                            @if (isset($category)) src="{{ asset('storage/app/public/category') }}/{{ $category['image'] }}"
                                        @else
                                        src="{{asset('storage/app/public/category')}}/{{$category['image']}}"
                                        onerror='this.src="{{asset('public/assets/admin/img/900x400/img1.jpg')}}"' @endif
                                            alt="image" />
                                    </center>
                                    <div class="custom-file">
                                        <input type="file" name="image" id="customFileEg1" class="custom-file-input"
                                            accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" >
                                        <label class="custom-file-label"
                                            for="customFileEg1">{{ translate('messages.choose_file') }}</label>
                                    </div>


                                    <small class="text-danger mt-1 d-none d-md-block">&nbsp;</small>
                                        <label class="mt-4">{{ translate('messages.video') }} *</label>
                                        <div class="custom-file">
                                            <input type="file" name="video" id="customFileEg2" class="custom-file-input"
                                                accept="video/*" >
                                            <label class="custom-file-label"
                                                for="customFileEg2">{{ translate('messages.choose_file') }}</label>
                                        </div>
                                </div>
                            </div>
                            @endif
                            @if (($category->position == 2 && $mod_check->module_type == 'services') ||$category->position == 2 && $mod_check->module_type == 'booking')
                            <div class="col-md-12">
                                <div class="h-100 d-flex flex-column">
                                    <label class="m-0">{{ translate('messages.image') }} <small class="text-danger">* (
                                            {{ translate('messages.ratio') }} 1:1)</small></label>
                                    <center class="py-3 my-auto">
                                        <img class="img--100" id="viewer"
                                            @if (isset($category)) src="{{ asset('storage/app/public/category') }}/{{ $category['image'] }}"
                                        @else
                                        src="{{asset('storage/app/public/category')}}/{{$category['image']}}"
                                        onerror='this.src="{{asset('public/assets/admin/img/900x400/img1.jpg')}}"' @endif
                                            alt="image" />
                                    </center>
                                    <div class="custom-file">
                                        <input type="file" name="image" id="customFileEg1" class="custom-file-input"
                                            accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" >
                                        <label class="custom-file-label"
                                            for="customFileEg1">{{ translate('messages.choose_file') }}</label>
                                    </div>


                                    <small class="text-danger mt-1 d-none d-md-block">&nbsp;</small>
                                        <label class="mt-4">{{ translate('messages.video') }} </label>
                                        <div class="custom-file">
                                            <input type="file" name="video" id="customFileEg2" class="custom-file-input"
                                                accept="video/*" >
                                            <label class="custom-file-label"
                                                for="customFileEg2">{{ translate('messages.choose_file') }}</label>
                                        </div>
                                </div>
                            </div>
                            @endif

                            @if (($category->position == 3 && $mod_check->module_type == 'services')||($category->position == 3 && $mod_check->module_type == 'booking'))
                            <div class="col-md-12">
                                <div class="h-100 d-flex flex-column">
                                    <label class="m-0">{{ translate('messages.image') }} <small class="text-danger">* (
                                            {{ translate('messages.ratio') }} 1:1)</small></label>
                                    <center class="py-3 my-auto">
                                        <img class="img--100" id="viewer"
                                            @if (isset($category)) src="{{ asset('storage/app/public/category') }}/{{ $category['image'] }}"
                                        @else
                                        src="{{asset('storage/app/public/category')}}/{{$category['image']}}"
                                        onerror='this.src="{{asset('public/assets/admin/img/900x400/img1.jpg')}}"' @endif
                                            alt="image" />
                                    </center>
                                    <div class="custom-file">
                                        <input type="file" name="image" id="customFileEg1" class="custom-file-input"
                                            accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" >
                                        <label class="custom-file-label"
                                            for="customFileEg1">{{ translate('messages.choose_file') }}</label>
                                    </div>
                                </div>
                            </div>
                            @endif
                        </div>
                    </div>
                    <div class="btn--container justify-content-end mt-3">
                        <button type="reset" id="reset_btn" class="btn btn--reset">{{translate('messages.reset')}}</button>
                        <button type="submit" class="btn btn--primary">{{translate('messages.update')}}</button>
                    </div>
                </form>
            </div>
            <!-- End Table -->
        </div>
    </div>

@endsection

@push('script_2')
    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#viewer').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileEg1").change(function () {
            readURL(this);
        });
        $('#selectCategory').each(function() {
            var select2 = $.HSCore.components.HSSelect2.init($(this));
        });
        $('#selectCategory2').each(function() {
            var select2 = $.HSCore.components.HSSelect2.init($(this));
        });
    </script>
    <script>
        $(".lang_link").click(function(e){
            e.preventDefault();
            $(".lang_link").removeClass('active');
            $(".lang_form").addClass('d-none');
            $(this).addClass('active');

            let form_id = this.id;
            let lang = form_id.substring(0, form_id.length - 5);
            console.log(lang);
            $("#"+lang+"-form").removeClass('d-none');
            if(lang == '{{$default_lang}}')
            {
                $(".from_part_2").removeClass('d-none');
            }
            else
            {
                $(".from_part_2").addClass('d-none');
            }
        });
    </script>
    <script>
        $('#reset_btn').click(function(){
            $('#module_id').val("{{ $category->module_id }}").trigger('change');
            $('#viewer').attr('src', "{{asset('storage/app/public/category')}}/{{$category['image']}}");
        })
    </script>
@endpush
