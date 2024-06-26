@extends('layouts.admin.app')

@section('title',   Config::get('module.current_module_type') == 'services'? translate('messages.add_new_service'):translate('messages.add_new_item'))

@push('css_or_js')
<meta name="csrf-token" content="{{ csrf_token() }}">
<link href="{{ asset('public/assets/admin/css/tags-input.min.css') }}" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
@endpush

@section('content')
<div class="content container-fluid">
    <!-- Page Header -->
    <div class="page-header d-flex flex-wrap __gap-15px justify-content-between align-items-center">
        <h1 class="page-header-title">
            <span class="page-header-icon">
                <img src="{{ asset('public/assets/admin/img/items.png') }}" class="w--22" alt="">
            </span>
            <span>
                @if(Config::get('module.current_module_type') == 'services')
                    {{ translate('messages.add_new_service') }}
                @elseif(Config::get('module.current_module_type') == 'booking')
                    {{ translate('messages.add_new_booking_service') }}
                @else
                    {{ translate('messages.add_new_item') }}
                @endif
                
            </span>
        </h1>
        <div class="d-flex align-items-end">
            
            @if(Config::get('module.current_module_type') != 'services' && Config::get('module.current_module_type') != 'booking')
            <div class="text--primary-2 d-flex flex-wrap align-items-center mr-2">
                <a href="{{ route('admin.item.product_gallery') }}"
                    class="btn btn--primary font-regular">{{translate('messages.Add_From_Product_Gallery')}}</a>
            </div>
            @endif

            @if(Config::get('module.current_module_type') == 'food')
            <div class="text--primary-2 py-1 d-flex flex-wrap align-items-center " type="button"
                onclick="foodModalShow()">
                <strong class="mr-2">{{translate('See_how_it_works!')}}</strong>
                <div>
                    <i class="tio-info-outined"></i>
                </div>
            </div>
            @elseif(Config::get('module.current_module_type') == 'services')
            @elseif(Config::get('module.current_module_type') == 'booking')
            @else
            <div class="text--primary-2 py-1 d-flex flex-wrap align-items-center mb-3 " type="button"
                onclick="attributeModalShow()">
                <strong class="mr-2">{{translate('See_how_it_works!')}}</strong>
                <div>
                    <i class="tio-info-outined"></i>
                </div>
            </div>
            @endif
        </div>
    </div>
    <!-- End Page Header -->
    <form action="javascript:" method="post" id="item_form" enctype="multipart/form-data">
        @csrf
        @php($language = \App\Models\BusinessSetting::where('key', 'language')->first())
        @php($language = $language->value ?? null)
        @php($default_lang = str_replace('_', '-', app()->getLocale()))
        <div class="row g-2">
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-body">
                        @if ($language)
                        <ul class="nav nav-tabs border-0 mb-3">
                            <li class="nav-item">
                                <a class="nav-link lang_link active" href="#"
                                    id="default-link">{{translate('messages.default')}}</a>
                            </li>
                            @foreach (json_decode($language) as $lang)
                            <li class="nav-item">
                                <a class="nav-link lang_link" href="#" id="{{ $lang }}-link">{{
                                    \App\CentralLogics\Helpers::get_language_name($lang) . '(' . strtoupper($lang) . ')'
                                    }}</a>
                            </li>
                            @endforeach
                        </ul>
                        @endif
                        @if ($language)
                        <div class="lang_form" id="default-form">
                            <div class="form-group">
                                <label class="input-label" for="default_name">{{ translate('messages.name') }}
                                    (Default)
                                </label>
                                <input type="text" name="name[]" id="default_name" class="form-control"
                                    placeholder="{{ translate('messages.new_item') }}" required
                                    oninvalid="document.getElementById('en-link').click()">
                            </div>
                            <input type="hidden" name="lang[]" value="default">
                            <div class="form-group mb-0">
                                <label class="input-label" for="exampleFormControlInput1">{{
                                    translate('messages.short_description') }} ({{ translate('messages.default')
                                    }})</label>
                                <textarea type="text" name="description[]"
                                    class="form-control min-h-90px summernote"></textarea>
                            </div>

                            <label class="input-label mt-2" for="exampleFormControlInput1">{{ translate('messages.disclaimer') }}
                                ({{ translate('messages.default') }})</label>
                            <textarea id="summernote" name="disclaimer[]" class="form-control summernote"></textarea>
                        </div>
                        @foreach (json_decode($language) as $lang)
                        <div class="d-none lang_form" id="{{ $lang }}-form">
                            <div class="form-group">
                                <label class="input-label" for="{{ $lang }}_name">{{ translate('messages.name') }}
                                    ({{ strtoupper($lang) }})
                                </label>
                                <input type="text" name="name[]" id="{{ $lang }}_name" class="form-control"
                                    placeholder="{{ translate('messages.new_item') }}"
                                    oninvalid="document.getElementById('en-link').click()">
                            </div>
                            <input type="hidden" name="lang[]" value="{{ $lang }}">
                            <div class="form-group mb-0">
                                <label class="input-label" for="exampleFormControlInput1">{{
                                    translate('messages.short_description') }} ({{ strtoupper($lang) }})</label>
                                <textarea  type="text" name="description[]"
                                    class="form-control min-h-90px summernote"></textarea>
                            </div>
                            <div class="form-group mb-0">
                                <label class="input-label mt-2" for="exampleFormControlInput1">{{ translate('messages.disclaimer') }}
                                    ({{ strtoupper($lang) }})</label>
                                <textarea id="summernote" name="disclaimer[]" class="form-control summernote"></textarea>
                            </div>
                        </div>
                        @endforeach
                        @else
                        <div id="default-form">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{ translate('messages.name')
                                    }} ({{ translate('messages.default') }})</label>
                                <input type="text" name="name[]" class="form-control"
                                    placeholder="{{ translate('messages.new_item') }}" required>
                            </div>
                            <input type="hidden" name="lang[]" value="default">
                            <div class="form-group mb-0">
                                <label class="input-label" for="exampleFormControlInput1">{{
                                    translate('messages.short_description') }}</label>
                                <textarea type="text" name="description[]"
                                    class="form-control min-h-90px summernote"></textarea>
                            </div>
                            <div class="form-group mb-0">
                                <label class="input-label mt-2" for="exampleFormControlInput1">{{ translate('messages.disclaimer') }}</label>
                                <textarea id="summernote" name="disclaimer[]" class="form-control summernote"></textarea>
                            </div>
                        </div>
                        @endif
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-body d-flex flex-wrap align-items-center">
                        <div class="w-100 d-flex flex-wrap __gap-15px">
                            <div class="flex-grow-1 mx-auto">
                                <label class="text-dark d-block">
                                    {{ translate('messages.item_image') }}
                                    <small class="text-danger">* ( {{ translate('messages.ratio') }} 1:1 )</small>
                                </label>
                                <div class="d-flex flex-wrap __gap-12px __new-coba" id="coba"></div>
                            </div>
                            <div class="flex-grow-1 mx-auto">
                                <label class="text-dark d-block">
                                    {{ translate('messages.item_thumbnail') }}
                                    <small class="text-danger">* ( {{ translate('messages.ratio') }} 1:1 )</small>
                                </label>
                                <label class="d-inline-block m-0">
                                    <img class="img--100" id="viewer"
                                        src="{{ asset('public/assets/admin/img/upload.png') }}" alt="thumbnail" />
                                    <input type="file" name="image" id="customFileEg1" class="custom-file-input d-none"
                                        accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card shadow--card-2 border-0">
                    <div class="card-header">
                        <h5 class="card-title">
                            <span class="card-header-icon mr-2">
                                <i class="tio-dashboard-outlined"></i>
                            </span>
                            <span> {{ Config::get('module.current_module_type')=='services'?translate('service_details'):(Config::get('module.current_module_type')=='booking'?translate('booking_details'):translate('item_details')) }} </span>
                            {{-- <span> {{ Config::get('module.current_module_type')=='services'?translate('service_details'):translate('item_details') }} </span> --}}
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="row g-2">
                            @if(Config::get('module.current_module_type')!='services' && Config::get('module.current_module_type')!='booking')
                            <div class="col-sm-6 col-lg-3">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="store_id">{{ translate('messages.store') }}<span
                                            class="input-label-secondary"></span></label>
                                    <select name="store_id" id="store_id"
                                        data-placeholder="{{ translate('messages.select_store') }}" 
                                        class="js-data-example-ajax form-control"
                                        onchange="getRestaurantData('{{ url('/') }}/admin/store/get-addons?data[]=0&store_id=',this.value,'add_on')"
                                        >
                                    </select>
                                </div>
                            </div>
                            @endif
                            <div class="col-sm-6 col-lg-3">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="category_id">{{ translate('messages.category')
                                        }}<span class="input-label-secondary">*</span></label>
                                    <select name="category_id" id="category_id"
                                        data-placeholder="{{ translate('messages.select_category') }}"
                                        class="js-data-example-ajax form-control" id="category_id"
                                        onchange="categoryChange(this.value)">
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="sub-categories">{{
                                        translate('messages.sub_category') }}<span class="input-label-secondary"
                                            title="{{ translate('messages.category_required_warning') }}"><img
                                                src="{{ asset('/public/assets/admin/img/info-circle.svg') }}"
                                                alt="{{ translate('messages.category_required_warning') }}"></span></label>
                                    <select name="sub_category_id" class="js-data-example-ajax form-control"
                                        data-placeholder="{{ translate('messages.select_sub_category') }}"
                                        id="sub-categories" onchange="SubcategoryChange(this.value)">

                                    </select>
                                </div>
                            </div>
                            @if (Config::get('module.current_module_type')!='services' && Config::get('module.current_module_type')!='booking')
                            <div class="col-sm-6 col-lg-3">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="sub_sub_categories">{{
                                        translate('messages.sub_sub_category') }}<span class="input-label-secondary"
                                            title="{{ translate('messages.category_required_warning') }}"><img
                                                src="{{ asset('/public/assets/admin/img/info-circle.svg') }}"
                                                alt="{{ translate('messages.category_required_warning') }}"></span></label>
                                    <select name="sub_sub_category_id" class="js-data-example-ajax form-control"
                                        data-placeholder="{{ translate('messages.select_sub_sub_category') }}"
                                        id="sub_sub_categories" onchange="SubsubcategoryChange(this.value)">
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="brand">{{
                                        translate('messages.brand') }}<span class="input-label-secondary"
                                            title="{{ translate('messages.brand') }}"><img
                                                src="{{ asset('/public/assets/admin/img/info-circle.svg') }}"
                                                alt="{{ translate('messages.category_required_warning') }}"></span></label>
                                    <select name="brand" class="js-data-example-ajax form-control"
                                        data-placeholder="{{ translate('messages.select_brand') }}"
                                        id="brand">
                                    </select>
                                </div>
                            </div>
                            @endif
                            @if (Config::get('module.current_module_type')=='services' || Config::get('module.current_module_type')=='booking')
                            <input type="hidden" name="store_id" value="0">
                            <input type="hidden" name="price" value="1">
                            <input type="hidden" name="discount_type" value="amount">
                            <input type="hidden" name="discount" value="0">
                            <div class="col-sm-6 col-lg-3">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="child_categories">{{
                                        translate('messages.child_category') }}<span class="input-label-secondary"
                                            title="{{ translate('messages.category_required_warning') }}"><img
                                                src="{{ asset('/public/assets/admin/img/info-circle.svg') }}"
                                                alt="{{ translate('messages.category_required_warning') }}"></span></label>
                                    <select name="sub_sub_category_id" class="js-data-example-ajax form-control"
                                        data-placeholder="{{ translate('messages.select_childcategory') }}"
                                        id="sub_sub_categories">
                                    </select>
                                </div>
                            </div>
                            @endif
                            












                            <div class="col-sm-6 col-lg-3" id="condition_input">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="condition_id">{{ translate('messages.Suitable_For')
                                        }}<span class="input-label-secondary"></span></label>
                                    <select name="condition_id" id="condition_id"
                                        data-placeholder="{{ translate('messages.Select_Condition') }}"
                                        id="condition_id" class="js-data-example-ajax form-control"
                                        oninvalid="this.setCustomValidity('{{ translate('messages.Select_Condition') }}')">

                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3" id="unit_input">
                                <div class="form-group mb-0">
                                    <label class="input-label text-capitalize" for="unit">{{ translate('messages.unit')
                                        }}</label>
                                    <select name="unit" id="unit" class="form-control js-select2-custom">
                                        @foreach (\App\Models\Unit::all() as $unit)
                                        <option value="{{ $unit->id }}">{{ $unit->unit }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3" id="veg_input">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="exampleFormControlInput1">{{
                                        translate('messages.item_type') }}</label>
                                    <select name="veg" id="veg" class="form-control js-select2-custom" required>
                                        <option value="0">{{ translate('messages.non_veg') }}</option>
                                        <option value="1">{{ translate('messages.veg') }}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3" id="stock_input">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="total_stock">{{ translate('messages.total_stock')
                                        }}</label>
                                    <input type="number" placeholder="{{ translate('messages.Ex:_10') }}"
                                        class="form-control" name="current_stock" min="0" id="quantity">
                                </div>
                            </div>
                            @if (Config::get('module.current_module_type')!='services' && Config::get('module.current_module_type')!='booking')
                            <div class="col-sm-6 col-lg-3" id="maximum_cart_quantity">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="maximum_cart_quantity">{{
                                        translate('messages.Maximum_Purchase_Quantity_Limit') }}
                                        <span class="input-label-secondary text--title" data-toggle="tooltip"
                                            data-placement="right"
                                            data-original-title="{{ translate('If_this_limit_is_exceeded,_customers_can_not_buy_the_item_in_a_single_purchase.') }}">
                                            <i class="tio-info-outined"></i>
                                        </span>
                                    </label>
                                    <input type="number" placeholder="{{ translate('messages.Ex:_10') }}"
                                        class="form-control" name="maximum_cart_quantity" min="0" id="cart_quantity">
                                </div>
                            </div>
                            @endif
                            @if (Config::get('module.current_module_type')=='grocery')
                            <div class="col-sm-6 col-lg-3" id="origin">
                                <div class="form-group mb-0">
                                    <label class="input-label text-capitalize" for="origin">{{ translate('messages.country_of_origin')
                                        }}</label>
                                    <select name="country_of_origin" id="country_of_origin" data-placeholder="{{ translate('messages.Select_country_of_origin') }}" class="form-control js-select2-custom" required>
                                        @foreach (\App\Models\Origin::where([['module_id',Config::get('module.current_module_id')],['status',1]])->orderBy('name')->get() as $origin)
                                        <option value="{{ $origin->id }}">{{ $origin->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            @endif
                            <div class="col-sm-6 col-lg-3" id="organic">
                                <div class="form-check mb-0 p-6">
                                    <input class="form-check-input" name="organic" type="checkbox" value="1"
                                        id="flexCheckDefault" checked>
                                    <label class="form-check-label" for="flexCheckDefault">
                                        {{ translate('messages.is_organic') }}
                                    </label>
                                </div>
                            </div>
                            @if (Config::get('module.current_module_type')=='grocery')
                            <div class="col-sm-6 col-lg-3" id="special">
                                <div class="form-check mb-0 p-6">
                                    <input class="form-check-input" id="is_special" name="special" type="checkbox" value="1"
                                        id="flexCheckDefault" >
                                    <label class="form-check-label" for="flexCheckDefault">
                                        {{ translate('messages.is_special') }}
                                    </label>
                                </div>
                            </div>
                            @endif
                            <div class="col-sm-6 col-lg-3" id="basic">
                                <div class="form-check mb-0 p-6">
                                    <input class="form-check-input" name="basic" type="checkbox" value="1"
                                        id="flexCheckDefault" checked>
                                    <label class="form-check-label" for="flexCheckDefault">
                                        {{ translate('messages.Is_Basic_Medicine') }}
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6" id="addon_input">
                <div class="card shadow--card-2 border-0">
                    <div class="card-header">
                        <h5 class="card-title">
                            <span class="card-header-icon"><i class="tio-dashboard-outlined"></i></span>
                            <span>{{ translate('messages.addon') }}</span>
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group mb-0">
                            <label class="input-label" for="exampleFormControlSelect1">{{ translate('messages.addon')
                                }}<span class="input-label-secondary" title="{{ translate('messages.addon') }}"><img
                                        src="{{ asset('/public/assets/admin/img/info-circle.svg') }}"
                                        alt="{{ translate('messages.store_required_warning') }}"></span></label>
                            <select name="addon_ids[]" class="form-control js-select2-custom" multiple="multiple"
                                id="add_on">

                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6" id="time_input">
                <div class="card shadow--card-2 border-0">
                    <div class="card-header">
                        <h5 class="card-title">
                            <span class="card-header-icon"><i class="tio-date-range"></i></span>
                            <span>{{ translate('time_schedule') }}</span>
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="row g-2">
                            <div class="col-sm-6">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="exampleFormControlInput1">{{
                                        translate('messages.available_time_starts') }}</label>
                                    <input type="time" name="available_time_starts" class="form-control"
                                        id="available_time_starts"
                                        placeholder="{{ translate('messages.Ex:') }} 10:30 am">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="exampleFormControlInput1">{{
                                        translate('messages.available_time_ends') }}</label>
                                    <input type="time" name="available_time_ends" class="form-control"
                                        id="available_time_ends" placeholder="5:45 pm">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @if (Config::get('module.current_module_type')=='grocery')     
            <div class="col-md-12" id="special_div" style="display:none;">
                <div class="card shadow--card-2 border-0">
                    <div class="card-header">
                        <h5 class="card-title">
                            <span class="card-header-icon"><i class="tio-dollar-outlined"></i></span>
                            <span>{{ translate('Specialities') }}</span>
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="row g-2">
                            <div class="col-sm-12 col-12">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="exampleFormControlInput1">{{
                                        translate('messages.select_speciality') }}</label>
                                    <select name="speciality[]" id="speciality"
                                    class="form-control js-select2-custom" multiple="multiple">
                                        <option value="Organic">{{ translate('Organic') }}</option>
                                        <option value="Gluten Free">{{ translate('Gluten Free') }}</option>
                                        <option value="Sugar Free">{{ translate('Sugar Free') }}</option>
                                        <option value="Vegan">{{ translate('Vegan') }}</option>
                                        <option value="Lactose Free">{{ translate('Lactose Free') }}</option>
                                        <option value="Plant Based">{{ translate('Plant Based') }}</option>
                                    </select>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
            @endif
            @if (Config::get('module.current_module_type')!='services' && Config::get('module.current_module_type')!='booking')     
            <div class="col-md-12">
                <div class="card shadow--card-2 border-0">
                    <div class="card-header">
                        <h5 class="card-title">
                            <span class="card-header-icon"><i class="tio-dollar-outlined"></i></span>
                            <span>{{ translate('amount') }}</span>
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="row g-2">
                            <div class="col-sm-4 col-6">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="exampleFormControlInput1">{{
                                        translate('messages.price') }}</label>
                                    <input type="number" min="0" max="999999999999.99" step="0.01" value="1"
                                        name="price" class="form-control"
                                        placeholder="{{ translate('messages.Ex:') }} 100" required>
                                </div>
                            </div>
                            <div class="col-sm-4 col-6">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="exampleFormControlInput1">{{
                                        translate('messages.discount_type') }}<span
                                            class="input-label-secondary text--title" data-toggle="tooltip"
                                            data-placement="right"
                                            data-original-title="{{ translate('Admin_shares_the_same_percentage/amount_on_discount_as_he_takes_commissions_from_stores') }}">
                                            <i class="tio-info-outined"></i>
                                        </span>
                                    </label>
                                    <select name="discount_type" id="discount_type"
                                        class="form-control js-select2-custom">
                                        <option value="percent">{{ translate('messages.percent') }}</option>
                                        <option value="amount">{{ translate('messages.amount') }}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4 col-6">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="exampleFormControlInput1">{{
                                        translate('messages.discount') }}</label>
                                    <input type="number" min="0" max="9999999999999999999999" value="0" name="discount"
                                        class="form-control" placeholder="{{ translate('messages.Ex:') }} 100">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @endif
            
            <div class="col-lg-12" id="food_variation_section">
                <div class="card shadow--card-2 border-0">
                    <div class="card-header flex-wrap">
                        <h5 class="card-title">
                            <span class="card-header-icon mr-2">
                                <i class="tio-canvas-text"></i>
                            </span>
                            <span>{{ translate('messages.food_variations') }}</span>
                        </h5>
                        <a class="btn text--primary-2" id="add_new_option_button">
                            {{ translate('add_new_variation') }}
                            <i class="tio-add"></i>
                        </a>
                    </div>
                    <div class="card-body">
                        <!-- Empty Variation -->
                        <div id="empty-variation">
                            <div class="text-center">
                                <img src="{{asset('/public/assets/admin/img/variation.png')}}" alt="">
                                <div>{{translate('No variation added')}}</div>
                            </div>
                        </div>
                        <div id="add_new_option">
                        </div>
                    </div>
                </div>
            </div>
            @if (Config::get('module.current_module_type')!='services' && Config::get('module.current_module_type')!='booking')     
            <div class="col-md-12" id="attribute_section">
                <div class="card shadow--card-2 border-0">
                    <div class="card-header">
                        <h5 class="card-title">
                            <span class="card-header-icon"><i class="tio-canvas-text"></i></span>
                            <span>{{ translate('attribute') }}</span>
                        </h5>
                    </div>
                    <div class="card-body pb-0">
                        <div class="row g-2">
                            <div class="col-12">
                                <div class="form-group mb-0">
                                    <label class="input-label" for="exampleFormControlSelect1">{{
                                        translate('messages.attribute') }}<span
                                            class="input-label-secondary"></span></label>
                                    <select name="attribute_id[]" id="choice_attributes"
                                        class="form-control js-select2-custom" multiple="multiple">
                                        @foreach (\App\Models\Attribute::orderBy('name')->get() as $attribute)
                                        <option value="{{ $attribute['id'] }}">{{ $attribute['name'] }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <div class="customer_choice_options d-flex __gap-24px" id="customer_choice_options">

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="variant_combination" id="variant_combination">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            @endif
            <div class="col-md-12">
                <div class="card shadow--card-2 border-0">
                    <div class="card-header">
                        <h5 class="card-title">
                            <span class="card-header-icon"><i class="tio-label"></i></span>
                            <span>{{ translate('tags') }}</span>
                        </h5>
                    </div>
                    <div class="card-body pb-0">
                        <div class="row g-2">
                            <div class="col-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="tags"
                                        placeholder="{{translate('messages.search_tags')}}" data-role="tagsinput">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="btn--container justify-content-end">
                    <button type="reset" id="reset_btn" class="btn btn--reset">{{ translate('messages.reset')
                        }}</button>
                    <button type="submit" class="btn btn--primary">{{ translate('messages.submit') }}</button>
                </div>
            </div>
        </div>
    </form>
</div>

<div class="modal" id="food-modal">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" onclick="foodModalClose()" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/IkoF9gPH6zs"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                        allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="attribute-modal">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" onclick="attributeModalClose()"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/xG8fO7TXPbk"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                        allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection


@push('script_2')
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
    $(document).ready(function() {
        $('.summernote').each(function(e) {
            $(this).summernote({
                tabsize: 2,
                height: 200,
                toolbar: [
                    ['style', ['style']],
                    ['font', ['bold', 'underline', 'italic', 'clear']],
                    ['fontname', ['fontname']],
                    ['color', ['color']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['table', ['table']],
                    // ['insert', ['link']],
                    ['view', ['fullscreen', 'codeview', 'help']]
                ],
                placeholder: '{{ translate("messages.package_details") }}'
            });
        });
    });
</script>
<script>
    var count = 0;
        $(document).ready(function() {
            $("#add_new_option_button").click(function(e) {
                $('#empty-variation').hide();
                count++;
                var add_option_view = `
                    <div class="__bg-F8F9FC-card view_new_option mb-2">
                        <div>
                            <div class="d-flex align-items-center justify-content-between mb-3">
                                <label class="form-check form--check">
                                    <input id="options[` + count + `][required]" name="options[` + count + `][required]" class="form-check-input" type="checkbox">
                                    <span class="form-check-label">{{ translate('Required') }}</span>
                                </label>
                                <div>
                                    <button type="button" class="btn btn-danger btn-sm delete_input_button" onclick="removeOption(this)"
                                        title="{{ translate('Delete') }}">
                                        <i class="tio-add-to-trash"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="col-xl-4 col-lg-6">
                                    <label for="">{{ translate('name') }}</label>
                                    <input required name=options[` + count +
                    `][name] class="form-control" type="text" onkeyup="new_option_name(this.value,` +
                    count + `)">
                                </div>

                                <div class="col-xl-4 col-lg-6">
                                    <div>
                                        <label class="input-label text-capitalize d-flex align-items-center"><span class="line--limit-1">{{ translate('messages.selcetion_type') }} </span>
                                        </label>
                                        <div class="resturant-type-group px-0">
                                            <label class="form-check form--check mr-2 mr-md-4">
                                                <input class="form-check-input" type="radio" value="multi"
                                                name="options[` + count + `][type]" id="type` + count +
                    `" checked onchange="show_min_max(` + count + `)"
                                                >
                                                <span class="form-check-label">
                                                    {{ translate('Multiple Selection') }}
                                                </span>
                                            </label>

                                            <label class="form-check form--check mr-2 mr-md-4">
                                                <input class="form-check-input" type="radio" value="single"
                                                name="options[` + count + `][type]" id="type` + count +
                    `" onchange="hide_min_max(` + count + `)"
                                                >
                                                <span class="form-check-label">
                                                    {{ translate('Single Selection') }}
                                                </span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-6">
                                    <div class="row g-2">
                                        <div class="col-6">
                                            <label for="">{{ translate('Min') }}</label>
                                            <input id="min_max1_` + count + `" required  name="options[` + count + `][min]" class="form-control" type="number" min="1">
                                        </div>
                                        <div class="col-6">
                                            <label for="">{{ translate('Max') }}</label>
                                            <input id="min_max2_` + count + `"   required name="options[` + count + `][max]" class="form-control" type="number" min="1">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="option_price_` + count + `" >
                                <div class="bg-white border rounded p-3 pb-0 mt-3">
                                    <div  id="option_price_view_` + count + `">
                                        <div class="row g-3 add_new_view_row_class mb-3">
                                            <div class="col-md-4 col-sm-6">
                                                <label for="">{{ translate('Option_name') }}</label>
                                                <input class="form-control" required type="text" name="options[` +
                    count +
                    `][values][0][label]" id="">
                                            </div>
                                            <div class="col-md-4 col-sm-6">
                                                <label for="">{{ translate('Additional_price') }}</label>
                                                <input class="form-control" required type="number" min="0" step="0.01" name="options[` +
                    count + `][values][0][optionPrice]" id="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-3 p-3 mr-1 d-flex "  id="add_new_button_` + count +
                    `">
                                        <button type="button" class="btn btn--primary btn-outline-primary" onclick="add_new_row_button(` +
                    count + `)" >{{ translate('Add_New_Option') }}</button>
                                    </div>
                                </div> 
                            </div>
                        </div>
                    </div>`;

                $("#add_new_option").append(add_option_view);
            });
        });

        function show_min_max(data) {
            $('#min_max1_' + data).removeAttr("readonly");
            $('#min_max2_' + data).removeAttr("readonly");
            $('#min_max1_' + data).attr("required", "true");
            $('#min_max2_' + data).attr("required", "true");
        }

        function hide_min_max(data) {
            $('#min_max1_' + data).val(null).trigger('change');
            $('#min_max2_' + data).val(null).trigger('change');
            $('#min_max1_' + data).attr("readonly", "true");
            $('#min_max2_' + data).attr("readonly", "true");
            $('#min_max1_' + data).attr("required", "false");
            $('#min_max2_' + data).attr("required", "false");
        }




        function new_option_name(value, data) {
            $("#new_option_name_" + data).empty();
            $("#new_option_name_" + data).text(value)
            console.log(value);
        }

        function removeOption(e) {
            element = $(e);
            element.parents('.view_new_option').remove();
        }

        function deleteRow(e) {
            element = $(e);
            element.parents('.add_new_view_row_class').remove();
        }


        function add_new_row_button(data) {
            count = data;
            countRow = 1 + $('#option_price_view_' + data).children('.add_new_view_row_class').length;
            var add_new_row_view = `
            <div class="row add_new_view_row_class mb-3 position-relative pt-3 pt-sm-0">
                <div class="col-md-4 col-sm-5">
                        <label for="">{{ translate('Option_name') }}</label>
                        <input class="form-control" required type="text" name="options[` + count + `][values][` +
                countRow + `][label]" id="">
                    </div>
                    <div class="col-md-4 col-sm-5">
                        <label for="">{{ translate('Additional_price') }}</label>
                        <input class="form-control"  required type="number" min="0" step="0.01" name="options[` +
                count +
                `][values][` + countRow + `][optionPrice]" id="">
                    </div>
                    <div class="col-sm-2 max-sm-absolute">
                        <label class="d-none d-sm-block">&nbsp;</label>
                        <div class="mt-1">
                            <button type="button" class="btn btn-danger btn-sm" onclick="deleteRow(this)"
                                title="{{ translate('Delete') }}">
                                <i class="tio-add-to-trash"></i>
                            </button>
                        </div>
                </div>
            </div>`;
            $('#option_price_view_' + data).append(add_new_row_view);

        }
</script>
<script src="{{ asset('public/assets/admin') }}/js/tags-input.min.js"></script>
<script>
    function foodModalClose() {
        $('#food-modal').hide();

    }
    function foodModalShow() {
        $('#food-modal').show();
    }
    function attributeModalClose() {
        $('#attribute-modal').hide();

    }
    function attributeModalShow() {
        $('#attribute-modal').show();
    }
        function getRestaurantData(route, store_id, id) {
            $.get({
                url: route + store_id,
                dataType: 'json',
                success: function(data) {
                    $('#' + id).empty().append(data.options);
                },
            });
        }

        function getRequest(route, id) {
            $.get({
                url: route,
                dataType: 'json',
                success: function(data) {
                    $('#' + id).empty().append(data.options);
                },
            });
        }

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#viewer').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileEg1").change(function() {
            readURL(this);
        });
</script>

<script>
    var module_id = {{Config::get('module.current_module_id')}};
        var parent_category_id = 0;
        var selected_sub_category_id = 0;
        var brand_category_id = 0;
        var module_data = null;
        var stock = true;

        function modulChange(id) {
            $.get({
                url: "{{ url('/') }}/admin/module/" + id,
                dataType: 'json',
                success: function(data) {
                    module_data = data.data;
                    stock = module_data.stock;
                    module_type = data.type;
                    if (stock) {
                        $('#stock_input').show();
                    } else {
                        $('#stock_input').hide();
                    }
                    if (module_data.add_on) {
                        $('#addon_input').show();
                    } else {
                        $('#addon_input').hide();
                    }

                    if (module_data.item_available_time) {
                        $('#time_input').show();
                    } else {
                        $('#time_input').hide();
                    }

                    if (module_data.veg_non_veg) {
                        $('#veg_input').show();
                    } else {
                        $('#veg_input').hide();
                    }
                    if (module_data.unit) {
                        $('#unit_input').show();
                    } else {
                        $('#unit_input').hide();
                    }
                    if (module_data.common_condition) {
                        $('#condition_input').show();
                    } else {
                        $('#condition_input').hide();
                    }
                    combination_update();
                    if (module_type == 'food') {
                        $('#food_variation_section').show();
                        $('#attribute_section').hide();
                    } else {
                        $('#food_variation_section').hide();
                        $('#attribute_section').show();
                    }
                    if (module_data.organic) {
                        $('#organic').show();
                    } else {
                        $('#organic').hide();
                    }
                    if (module_data.basic) {
                        $('#basic').show();
                    } else {
                        $('#basic').hide();
                    }
                },
            });
            module_id = id;
        }
        modulChange({{Config::get('module.current_module_id')}});
        function categoryChange(id) {
            parent_category_id = id;            
            brand_category_id = id;            
            console.log(parent_category_id);
            
        }
        function SubcategoryChange(id) {
            selected_sub_category_id = id;    
            // brand_category_id = id;        
            console.log(selected_sub_category_id);
            
        }

        function SubsubcategoryChange(id) {
            // brand_category_id = id;    
        }

        $(document).on('ready', function() {
            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function() {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
        });
        $('#condition_id').select2({
            ajax: {
                url: '{{ url('/') }}/admin/common-condition/get-all',
                data: function(params) {
                    return {
                        q: params.term, // search term
                        page: params.page,
                    };
                },
                processResults: function(data) {
                    return {
                        results: data
                    };
                },
                __port: function(params, success, failure) {
                    var $request = $.ajax(params);

                    $request.then(success);
                    $request.fail(failure);

                    return $request;
                }
            }
        });
        $('#store_id').select2({
            ajax: {
                url: '{{ url('/') }}/admin/store/get-stores',
                data: function(params) {
                    return {
                        q: params.term, // search term
                        page: params.page,
                        module_id:{{Config::get('module.current_module_id')}},
                    };
                },
                processResults: function(data) {
                    return {
                        results: data
                    };
                },
                __port: function(params, success, failure) {
                    var $request = $.ajax(params);

                    $request.then(success);
                    $request.fail(failure);

                    return $request;
                }
            }
        });

        // $('#category_id').select2({
        //     ajax: {
        //         url: '{{ url('/') }}/admin/item/get-categories?parent_id=0',
        //         data: function(params) {
        //             return {
        //                 q: params.term, // search term
        //                 page: params.page,
        //                 module_id:{{Config::get('module.current_module_id')}},
        //             };
        //         },
        //         processResults: function(data) {
        //             return {
        //                 results: data
        //             };
        //         },
        //         __port: function(params, success, failure) {
        //             var $request = $.ajax(params);

        //             $request.then(success);
        //             $request.fail(failure);

        //             return $request;
        //         }
        //     }
        // });

        // $('#sub-categories').select2({
        //     ajax: {
        //         url: '{{ url('/') }}/admin/item/get-categories',
        //         data: function(params) {
        //             return {
        //                 q: params.term, // search term
        //                 page: params.page,
        //                 module_id:{{Config::get('module.current_module_id')}},
        //                 parent_id: parent_category_id,
        //                 sub_category: true
        //             };
        //         },
        //         processResults: function(data) {
        //             return {
        //                 results: data
        //             };
        //         },
        //         __port: function(params, success, failure) {
        //             var $request = $.ajax(params);

        //             $request.then(success);
        //             $request.fail(failure);

        //             return $request;
        //         }
        //     }
        // });

        $('#category_id').select2({
        ajax: {
            url: '{{ url('/') }}/admin/item/get-categories?parent_id=0',
            data: function(params) {
                return {
                    q: params.term,
                    page: params.page,
                    module_id:{{Config::get('module.current_module_id')}},
                };
            },
            processResults: function(data) {
                return {
                    results: data
                };
            },
            __port: function(params, success, failure) {
                var $request = $.ajax(params);
                $request.then(success);
                $request.fail(failure);
                return $request;
            }
        }
    });

    // Initialize Select2 for sub-category dropdown
    $('#sub-categories').select2({
        ajax: {
            url: '{{ url('/') }}/admin/item/get-categories',
            data: function(params) {
                return {
                    q: params.term,
                    page: params.page,
                    module_id:{{Config::get('module.current_module_id')}},
                    parent_id: parent_category_id,
                    sub_category: true
                };
            },
            processResults: function(data) {
                return {
                    results: data
                };
            },
            __port: function(params, success, failure) {
                var $request = $.ajax(params);
                $request.then(success);
                $request.fail(failure);
                return $request;
            }
        }
    });
   
    // Initialize Select2 for sub-sub-category dropdown
    $('#sub_sub_categories').select2({
        ajax: {
            url: '{{ url('/') }}/admin/item/get-categories',
            data: function(params) {
                return {
                    q: params.term,
                    page: params.page,
                    module_id:{{Config::get('module.current_module_id')}},
                    parent_id: selected_sub_category_id,
                    sub_sub_category: true
                };
          },
            processResults: function(data) {
                console.log(data)
                return {
                    results: data                    
                };
            },
            __port: function(params, success, failure) {
                var $request = $.ajax(params);
                $request.then(success);
                $request.fail(failure);
                return $request;
            }
        }
    });

     // Initialize Select2 for brand dropdown
    $('#brand').select2({
        ajax: {
            url: '{{ url('/') }}/admin/item/get-brands',
            data: function(params) {
                return {
                    module_id:{{Config::get('module.current_module_id')}},
                    category_id: $('#category_id').val(),
                };
          },
            processResults: function(data) {
                console.log(data)
                return {
                    results: data                    
                };
            },
            __port: function(params, success, failure) {
                var $request = $.ajax(params);
                $request.then(success);
                $request.fail(failure);
                return $request;
            }
        }
    });





        

        $('#choice_attributes').on('change', function() {
            if (module_id == 0) {
                toastr.error('{{ translate('messages.select_a_module') }}', {
                    CloseButton: true,
                    ProgressBar: true
                });
                $(this).val("");
                return false;
            }
            $('#customer_choice_options').html(null);
            $.each($("#choice_attributes option:selected"), function() {
                if ($(this).val().length > 50) {
                    toastr.error(
                        '{{ translate('validation.max.string', ['attribute' => translate('messages.variation'), 'max' => '50']) }}', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                    return false;
                }
                add_more_customer_choice_option($(this).val(), $(this).text());
            });
        });

        function add_more_customer_choice_option(i, name) {
            let n = name;

            $('#customer_choice_options').append(
                `<div class="__choos-item"><div><input type="hidden" name="choice_no[]" value="${i}"><input type="text" class="form-control d-none" name="choice[]" value="${n}" placeholder="{{ translate('messages.choice_title') }}" readonly> <label class="form-label">${n}</label> </div><div><input type="text" class="form-control" name="choice_options_${i}[]" placeholder="{{ translate('messages.enter_choice_values') }}" data-role="tagsinput" onchange="combination_update()"></div></div>`
            );
            $("input[data-role=tagsinput], select[multiple][data-role=tagsinput]").tagsinput();
        }

        function combination_update() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $.ajax({
                type: "POST",
                url: "{{ route('admin.item.variant-combination') }}",
                data: $('#item_form').serialize() + '&stock=' + stock,
                beforeSend: function() {
                    $('#loading').show();
                },
                success: function(data) {
                    $('#loading').hide();
                    $('#variant_combination').html(data.view);
                    if (data.length < 1) {
                        $('input[name="current_stock"]').attr("readonly", false);
                    }
                }
            });
        }
</script>

<script>
    $('#item_form').on('submit', function(e) {
            e.preventDefault();
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{ route('admin.item.store') }}',
                data: $('#item_form').serialize(),
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function() {
                    $('#loading').show();
                },
                success: function(data) {
                    $('#loading').hide();
                    if (data.errors) {
                        for (var i = 0; i < data.errors.length; i++) {
                            toastr.error(data.errors[i].message, {
                                CloseButton: true,
                                ProgressBar: true
                            });
                        }
                    } else {
                        toastr.success("{{ translate('messages.product_added_successfully') }}", {
                            CloseButton: true,
                            ProgressBar: true
                        });
                        setTimeout(function() {
                            location.href =
                                "{{ route('admin.item.list') }}";
                        }, 2000);
                    }
                }
            });
        });
</script>
<script>
    $(".lang_link").click(function(e) {
            e.preventDefault();
            $(".lang_link").removeClass('active');
            $(".lang_form").addClass('d-none');
            $(this).addClass('active');

            let form_id = this.id;
            let lang = form_id.substring(0, form_id.length - 5);
            console.log(lang);
            $("#" + lang + "-form").removeClass('d-none');
            if (lang == '{{ $default_lang }}') {
                $("#from_part_2").removeClass('d-none');
            } else {
                $("#from_part_2").addClass('d-none');
            }
        })
</script>
<script src="{{ asset('public/assets/admin/js/spartan-multi-image-picker.js') }}"></script>
<script type="text/javascript">
    $(function() {
            $("#coba").spartanMultiImagePicker({
                fieldName: 'item_images[]',
                maxCount: 5,
                rowHeight: '100px !important',
                groupClassName: 'spartan_item_wrapper min-w-100px max-w-100px',
                maxFileSize: '',
                placeholderImage: {
                    image: "{{ asset('public/assets/admin/img/upload.png') }}",
                    width: '100px'
                },
                dropFileLabel: "Drop Here",
                onAddRow: function(index, file) {

                },
                onRenderedPreview: function(index) {

                },
                onRemoveRow: function(index) {

                },
                onExtensionErr: function(index, file) {
                    toastr.error(
                        "{{ translate('messages.please_only_input_png_or_jpg_type_file') }}", {
                            CloseButton: true,
                            ProgressBar: true
                        });
                },
                onSizeErr: function(index, file) {
                    toastr.error("{{ translate('messages.file_size_too_big') }}", {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
        });
</script>
<script>
    $('#reset_btn').click(function() {
            $('#module_id').val(null).trigger('change');
            $('#store_id').val(null).trigger('change');
            $('#category_id').val(null).trigger('change');
            $('#sub-categories').val(null).trigger('change');
            $('#unit').val(null).trigger('change');
            $('#veg').val(0).trigger('change');
            $('#add_on').val(null).trigger('change');
            $('#discount_type').val(null).trigger('change');
            $('#choice_attributes').val(null).trigger('change');
            $('#customer_choice_options').empty().trigger('change');
            $('#variant_combination').empty().trigger('change');
            $('#viewer').attr('src', "{{ asset('public/assets/admin/img/upload.png') }}");
            $('#customFileEg1').val(null).trigger('change');
            $("#coba").empty().spartanMultiImagePicker({
                fieldName: 'item_images[]',
                maxCount: 6,
                rowHeight: '100px !important',
                groupClassName: 'spartan_item_wrapper min-w-100px max-w-100px',
                maxFileSize: '',
                placeholderImage: {
                    image: "{{ asset('public/assets/admin/img/upload.png') }}",
                    width: '100%'
                },
                dropFileLabel: "Drop Here",
                onAddRow: function(index, file) {

                },
                onRenderedPreview: function(index) {

                },
                onRemoveRow: function(index) {

                },
                onExtensionErr: function(index, file) {
                    toastr.error(
                        "{{ translate('messages.please_only_input_png_or_jpg_type_file') }}", {
                            CloseButton: true,
                            ProgressBar: true
                        });
                },
                onSizeErr: function(index, file) {
                    toastr.error("{{ translate('messages.file_size_too_big') }}", {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
        })

        $(document).on('change','#is_special',function(){
            if($(this).is(":checked")){
                $('#special_div').slideDown(500);
            }else{
                $('#special_div').slideUp(500);
            }
        })
</script>
@endpush