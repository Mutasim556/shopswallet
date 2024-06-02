@extends('layouts.vendor.app')

@section('title', request()->product_gellary == 1 ? translate('Add item') : translate('Update_item'))

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link href="{{ asset('public/assets/admin/css/tags-input.min.css') }}" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
@endpush

@section('content')
    @php($module_type = \App\CentralLogics\Helpers::get_store_data()->module->module_type)
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-header-title">
                <span class="page-header-icon">
                    <img src="{{ asset('public/assets/admin/img/edit.png') }}" class="w--22" alt="">
                </span>
                <span>
                    @if (\App\CentralLogics\Helpers::get_vendor_module_id() == 'services')
                        {{ translate('messages.service_update') }}
                    @else
                        {{ request()->product_gellary == 1 ? translate('Add_item') : translate('item_update') }}
                    @endif
                </span>
            </h1>
        </div>

        @if (isset($temp_product) && $temp_product == 1 && $product->note)
            <div class="card-header border-0 align-items-start flex-wrap">
                <div class="order-invoice-left d-flex d-sm-block justify-content-between">
                    <div class="d-flex align-items-center __gap-5px">
                        <h1 class="page-header-title text-danger ">
                            {{ translate('messages.Rejection_Note') }} :
                        </h1>
                        <h3 class="">
                            {{ $product->note }}
                        </h3>
                    </div>
                </div>
            </div>
        @endif
        <!-- End Page Header -->
        @if (\App\CentralLogics\Helpers::get_vendor_module_id() == 'services')
            <form action="javascript:" method="post" id="product_form" enctype="multipart/form-data">
                @csrf
                @php($language = \App\Models\BusinessSetting::where('key', 'language')->first())
                @php($language = $language->value ?? null)
                @php($default_lang = str_replace('_', '-', app()->getLocale()))
                <div class="row g-2">
                    <input type="hidden" class="route_url"
                    value="{{ $route ?? route('vendor.item.update',[$product['id']]) }}">
                    <input type="hidden" value="{{ $product['id'] ?? null }}" name="service_id">
                    <div class="col-md-12">
                        <div class="card"> 
                            <div class="card-header">
                                <h5 class="card-title">
                                    <span class="card-header-icon">
                                        <i class="tio-dollar-outlined"></i>
                                    </span>
                                    <span> {{ translate('service_details') }} </span>
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="row g-2">
                                    <div class="col-lg-6">
                                        <div class="row">
                                            <div class="col-sm-6 col-lg-6">
                                                <div class="form-group mb-0">
                                                    <label class="input-label"
                                                        for="exampleFormControlSelect1">{{ translate('messages.category') }}<span
                                                            class="input-label-secondary">*</span></label>
                                                    <input type="hidden" name="category_id" value="{{ $product_category[0]->id }}">
                                                    <select id="category_id"
                                                        class="form-control  js-select2-custom"  disabled
                                                        onchange="getRequest('{{ url('/') }}/store-panel/item/get-categories?parent_id='+this.value,'sub-categories')" >
                                                        <option value="">---{{ translate('messages.select') }}---
                                                        </option>
                                                        @foreach ($categories as $category)
                                                            <option value="{{ $category['id'] }}"
                                                                {{ $product_category[0]->id == $category['id'] ? 'selected' : '' }}>
                                                                {{ $category['name'] }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 col-lg-6">
                                                <div class="form-group mb-0">
                                                    <label class="input-label"
                                                        for="exampleFormControlSelect1">{{ translate('messages.sub_category') }}<span
                                                            class="input-label-secondary"></span></label>
                                                    <input type="hidden" name="sub_category_id" value="{{ $product_category[1]->id }}">
                                                    <select name="" id="sub-categories"
                                                        class="form-control js-select2-custom" disabled
                                                        onchange="getRequest('{{ url('/') }}/store-panel/item/get-categories?parent_id='+this.value,'sub-sub-categories')" >
                                                        <option value="{{ $product_category[1]->id }}" selected>
                                                            {{ $product_category[1]->category_name }}
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 col-lg-6 my-2">
                                                <div class="form-group mb-0">
                                                    <label class="input-label"
                                                        for="exampleFormControlSelect1">{{ translate('messages.child_category') }}<span
                                                            class="input-label-secondary"></span></label>
                                                    <input type="hidden" name="sub_sub_category_id" value="{{ $product_category[2]->id }}">
                                                    <select name="" id="sub-sub-categories"
                                                        class="form-control js-select2-custom" disabled
                                                        onchange="getItems('{{ url('/') }}/store-panel/item/get-items?parent_id='+this.value,'item_id')" >
                                                        <option value="{{ $product_category[2]->id }}" selected>
                                                            {{ $product_category[2]->category_name }}
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-sm-12 col-lg-12">
                                                <div class="form-group mb-0">
                                                    <label class="input-label"
                                                        for="exampleFormControlSelect1">{{ translate('messages.services') }}<span
                                                            class="input-label-secondary"></span></label>
                                                    <input type="hidden" name="item_id" value="{{ $product->item_id }}">
                                                    <select name="" id="item_id"
                                                        class="form-control js-select2-custom" disabled>
                                                        <option value="{{ $product->item_id }}">{{ $product->name }}</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        @if ($language)
                                            <ul class="nav nav-tabs mb-4">
                                                <li class="nav-item">
                                                    <a class="nav-link lang_link active" href="#"
                                                        id="default-link">{{ translate('messages.default') }}</a>
                                                </li>
                                                @foreach (json_decode($language) as $lang)
                                                    <li class="nav-item">
                                                        <a class="nav-link lang_link" href="#"
                                                            id="{{ $lang }}-link">{{ \App\CentralLogics\Helpers::get_language_name($lang) . '(' . strtoupper($lang) . ')' }}</a>
                                                    </li>
                                                @endforeach
                                            </ul>
                                        @endif
                                        <div class="row"> 
                                            <div class="col-md-12">
                                                @if ($language)
                                                    <div class="form-group lang_form" id="default-form">
                                                        <label class="input-label"
                                                            for="exampleFormControlInput1">{{ translate('messages.service_details') }}
                                                            ({{ translate('messages.default') }})</label>
                                                        <textarea id="summernote" name="service_details[]" class="form-control summernote"
                                                            oninvalid="document.getElementById('en-link').click()">{{ $product?->getRawOriginal('service_details') }}</textarea>
                                                    </div>
                                                    <input type="hidden" name="lang[]" value="default">

                                                    @foreach (json_decode($language) as $lang)
                                                        <?php
                                                            if (count($product['translations'])) {
                                                                $translate = [];
                                                                foreach ($product['translations'] as $t) {
                                                                    if ($t->locale == $lang && $t->key == 'service_details') {
                                                                        $translate[$lang]['service_details'] = $t->value;
                                                                    }
                                                                }
                                                            }
                                                        ?>
                                                        <div class="form-group d-none lang_form"
                                                            id="{{ $lang }}-form">
                                                            <label class="input-label"
                                                                for="exampleFormControlInput1">{{ translate('messages.service_details') }}
                                                                ({{ strtoupper($lang) }})
                                                            </label>
                                                            <textarea id="summernote" name="service_details[]" class="form-control summernote"
                                                                oninvalid="document.getElementById('en-link').click()">{{ $translate[$lang]['service_details'] ?? '' }}</textarea>
                                                        </div>
                                                        <input type="hidden" name="lang[]"
                                                            value="{{ $lang }}">
                                                    @endforeach
                                                @else
                                                    <div class="form-group lang_form" id="default-form">
                                                        <label class="input-label"
                                                            for="exampleFormControlInput1">{{ translate('messages.service_details') }}</label>
                                                        <textarea id="summernote" name="service_details[]" class="form-control summernote"
                                                            oninvalid="document.getElementById('en-link').click()"></textarea>
                                                    </div>
                                                    <input type="hidden" name="lang[]" value="default">
                                                @endif

                                            </div>
                                        </div>
                                    </div>



                                    @if ($module_data['unit'])
                                        <div class="col-sm-6 col-lg-3">
                                            <div class="form-group mb-0">
                                                <label class="input-label text-capitalize"
                                                    for="unit">{{ translate('messages.unit') }}</label>
                                                <select name="unit" id="unit"
                                                    class="form-control js-select2-custom">
                                                    <option value="">{{ translate('select_please') }}</option>
                                                    @foreach (\App\Models\Unit::all() as $unit)
                                                        <option value="{{ $unit->id }}" {{ $product->unit_id==$unit->id?'selected':'' }}>{{ $unit->unit }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    @endif

                                    <div class="col-sm-6 col-lg-3">
                                        <div class="form-group mb-0">
                                            <label class="input-label"
                                                for="exampleFormControlInput1">{{ translate('messages.price') }}</label>
                                            <input type="number" min="0" max="100000" step="0.01"
                                                value="{{ $product->price }}" name="price" class="form-control"
                                                placeholder="{{ translate('messages.Ex:') }} 100">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-3">
                                        <div class="form-group mb-0">
                                            <label class="input-label"
                                                for="exampleFormControlInput1">{{ translate('messages.discount_type') }}</label>
                                            <select name="discount_type" id="discount_type"
                                                class="form-control js-select2-custom">
                                                <option value="percent" {{ $product->discount_type=='percent'?'selected':'' }}>{{ translate('messages.percent') }}</option>
                                                <option value="amount" {{ $product->discount_type=='amount'?'selected':'' }}>{{ translate('messages.amount') }}</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-3">
                                        <div class="form-group mb-0">
                                            <label class="input-label"
                                                for="exampleFormControlInput1">{{ translate('messages.discount') }}</label>
                                            <input type="number" min="0" max="100000" value="{{ $product->discount }}"
                                                name="discount" class="form-control"
                                                placeholder="{{ translate('messages.Ex:') }} 100">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    @php($available_for = explode(',',$product->available_for))
                                    <div class="col-md-8 mt-3">
                                        <label class="input-label"
                                            for="{{ translate('message.timeslot_list') }}">{{ translate('messages.service_available_for') }}</label>
                                        <input type="checkbox" name="service_available_for[]" value="daily" {{ in_array('daily',$available_for)?'checked':'' }}>
                                        &nbsp;{{ translate('messages.daily') }} &nbsp;&nbsp;<span class="mr-2"></span>
                                        <input type="checkbox" name="service_available_for[]" value="monthly" {{ in_array('monthly',$available_for)?'checked':'' }}>
                                        &nbsp;{{ translate('messages.monthly') }}&nbsp;&nbsp;<span class="mr-2"></span>
                                        <input type="checkbox" name="service_available_for[]" value="yearly" {{ in_array('yearly',$available_for)?'checked':'' }}>
                                        &nbsp;{{ translate('messages.yearly') }} &nbsp;&nbsp;
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 mt-3">
                                        <label class="input-label"
                                            for="{{ translate('message.timeslot_list') }}">{{ translate('messages.timeslot_list') }}</label>
                                        <button id="plus_timeslot" type="button"
                                            class="btn btn-primary">+{{ translate('messages.add_new') }}</button>
                                    </div>
                                </div>
                                <div id="append_timeslot" class="row">
                                    @php($time_slot_list = explode(',',$product->timeslot_list))
                                    <div class="col-md-3 mt-3">
                                        <input type="time" class="form-control" name="timeslot_list[]"
                                            value="{{ isset($product) ? date('H:i', strtotime($time_slot_list[0])) : '08:00' }}">
                                        <span class="text-danger">
                                            @error('timeslot_list')
                                                {{ $message }}
                                            @enderror
                                        </span>
                                    </div>
                                    @foreach ($time_slot_list as $key=>$value)
                                    @if($key==0)
                                    <?php
                                        continue;
                                    ?>
                                    @endif

                                    <div class="col-md-3 mt-3" id="new_append">
                                        <div class="row">
                                            <div class="col-md-9">
                                                <input type="time" class="form-control" name="timeslot_list[]" value="{{ date('H:i',strtotime($value)) }}">
                                            </div>
                                            <div class="col-md-3">
                                                <button type="button" id="del_timeslot" class="btn btn-danger" style="padding-bottom:10px; padding-top:10px;"><i class="tio-delete-outlined"></i></button>
                                            </div>    
                                        </div>
                                    </div>
                                    @endforeach
                                </div>
                                <div class="row">
                                    <div class="col-md-4 mt-3">
                                        <label class="input-label"
                                            for="{{ translate('message.timeslot_list') }}">{{ translate('messages.assign_staff') }}</label>
                                        <input type="radio" name="staff" value="new_staff"
                                            onchange="changeStaffDiv($(this).val(),'old_staff')" {{ $product->new_staff?'checked':'' }}>
                                        &nbsp;{{ translate('messages.new_staff') }} &nbsp;&nbsp;<span
                                            class="mr-2"></span>
                                        <input type="radio" name="staff" value="old_staff"
                                            onchange="changeStaffDiv($(this).val(),'new_staff')" {{ $product->old_staff?'checked':'' }}>
                                        &nbsp;{{ translate('messages.old_staff') }}&nbsp;&nbsp;<span
                                            class="mr-2"></span>
                                    </div>

                                    <div class="col-md-6 mt-3" id="new_staff_div">
                                        <label class="input-label"
                                            for="{{ translate('message.timeslot_list') }}">{{ translate('messages.new_staff') }}</label>
                                        <input type="text" class="form-control" name="new_staff" value="{{ $product->new_staff? $product->new_staff:'' }}">
                                    </div>

                                    <div class="col-md-6 mt-3 d-none" id="old_staff_div">
                                        <label class="input-label"
                                            for="{{ translate('message.timeslot_list') }}">{{ translate('messages.old_staff') }}</label>
                                        <select name="old_staff" id="old_staff" class="form-control js-select2-custom">
                                            {{-- <option value="">Select Please</option> --}}
                                            @foreach (DB::table('vendor_employees')->where('vendor_id', auth('vendor')->id())->select('id', 'f_name', 'l_name')->get() as $staff)
                                                <option value="{{ $staff->id }}">
                                                    {{ $staff->f_name . ' ' . $staff->fl_name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>


                    <div class="col-12">
                        <div class="btn--container justify-content-end">
                            <button type="reset" id="reset_btn"
                                class="btn btn--reset">{{ translate('messages.reset') }}</button>
                            <button type="submit" class="btn btn--primary">{{ translate('messages.update') }}</button>
                        </div>
                    </div>
                </div>
            </form>
        @else
            <form action="javascript:" method="post" id="product_form" enctype="multipart/form-data">
                @csrf


                @if (request()->product_gellary == 1)
                    @php($route = route('vendor.item.store', ['product_gellary' => request()->product_gellary]))
                    @php($product->price = 0)
                @else
                    @php($route = route('vendor.item.update', [isset($temp_product) && $temp_product == 1 ? $product['item_id'] : $product['id']]))
                @endif

                <input type="hidden" class="route_url"
                    value="{{ $route ?? route('vendor.item.update', [isset($temp_product) && $temp_product == 1 ? $product['item_id'] : $product['id']]) }}">
                <input type="hidden" value="{{ $temp_product ?? 0 }}" name="temp_product">
                <input type="hidden" value="{{ $product['id'] ?? null }}" name="item_id">

                @php($language = \App\Models\BusinessSetting::where('key', 'language')->first())
                @php($language = $language->value ?? null)
                @php($default_lang = str_replace('_', '-', app()->getLocale()))
                <div class="row g-2">
                    @if ($language)
                        <div class="col-12">
                            <ul class="nav nav-tabs mb-3 border-0">
                                <li class="nav-item">
                                    <a class="nav-link lang_link active" href="#"
                                        id="default-link">{{ translate('messages.default') }}</a>
                                </li>
                                @foreach (json_decode($language) as $lang)
                                    <li class="nav-item">
                                        <a class="nav-link lang_link" href="#"
                                            id="{{ $lang }}-link">{{ \App\CentralLogics\Helpers::get_language_name($lang) . '(' . strtoupper($lang) . ')' }}</a>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                    <div class="col-md-6">
                        <div class="card h-100">
                            <div class="card-header">
                                <h5 class="card-title">
                                    <span class="card-header-icon">
                                        <i class="tio-dashboard-outlined"></i>
                                    </span>
                                    <span>{{ translate('item_info') }}</span>
                                </h5>
                            </div>
                            <div class="card-body">
                                @if ($language)
                                    <div class="lang_form" id="default-form">
                                        <div class="form-group">
                                            <label class="input-label"
                                                for="default_name">{{ translate('messages.name') }}
                                                ({{ translate('messages.default') }})</label>
                                            <input type="text" name="name[]" id="default_name" class="form-control"
                                                placeholder="{{ translate('messages.new_food') }}"
                                                value="{{ $product->getRawOriginal('name') }}"
                                                oninvalid="document.getElementById('en-link').click()">
                                        </div>
                                        <input type="hidden" name="lang[]" value="default">
                                        <div class="form-group pt-2 mb-0">
                                            <label class="input-label"
                                                for="exampleFormControlInput1">{{ translate('messages.short_description') }}
                                                ({{ translate('messages.default') }})</label>
                                            <textarea type="text" name="description[]" class="form-control summernote min--height-200">{!! $product->getRawOriginal('description') !!}</textarea>
                                        </div>
                                        <label class="input-label mt-2" for="exampleFormControlInput1">{{ translate('messages.disclaimer') }}
                                            ({{ translate('messages.default') }})</label>
                                        <textarea id="summernote" name="disclaimer[]" class="form-control summernote">{!! $product?->getRawOriginal('disclaimer') !!}</textarea>
                                    </div>
                                    @foreach (json_decode($language) as $lang)
                                        <?php
                                        if (count($product['translations'])) {
                                            $translate = [];
                                            foreach ($product['translations'] as $t) {
                                                if ($t->locale == $lang && $t->key == 'name') {
                                                    $translate[$lang]['name'] = $t->value;
                                                }
                                                if ($t->locale == $lang && $t->key == 'description') {
                                                    $translate[$lang]['description'] = $t->value;
                                                }
                                            }
                                        }
                                        ?>
                                        <div class="d-none lang_form" id="{{ $lang }}-form">
                                            <div class="form-group">
                                                <label class="input-label"
                                                    for="{{ $lang }}_name">{{ translate('messages.name') }}
                                                    ({{ strtoupper($lang) }})</label>
                                                <input type="text" name="name[]" id="{{ $lang }}_name"
                                                    class="form-control"
                                                    placeholder="{{ translate('messages.new_food') }}"
                                                    value="{{ $translate[$lang]['name'] ?? '' }}"
                                                    oninvalid="document.getElementById('en-link').click()">
                                            </div>
                                            <input type="hidden" name="lang[]" value="{{ $lang }}">
                                            <div class="form-group pt-2 mb-0">
                                                <label class="input-label"
                                                    for="exampleFormControlInput1">{{ translate('messages.short_description') }}
                                                    ({{ strtoupper($lang) }})</label>
                                                <textarea type="text" name="description[]" class="form-control summernote min--height-200">{!! $translate[$lang]['description'] ?? '' !!}</textarea>
                                            </div>
                                            <div class="form-group mb-0">
                                                <label class="input-label mt-2" for="exampleFormControlInput1">{{ translate('messages.disclaimer') }}
                                                    ({{ strtoupper($lang) }})</label>
                                                <textarea id="summernote" name="disclaimer[]" class="form-control summernote">{!! $translate[$lang]['disclaimer'] ?? '' !!}</textarea>
                                            </div>
                                        </div>
                                    @endforeach
                                @else
                                    <div id="default-form">
                                        <div class="form-group">
                                            <label class="input-label"
                                                for="exampleFormControlInput1">{{ translate('messages.name') }}
                                                ({{ translate('messages.default') }})</label>
                                            <input type="text" name="name[]" class="form-control"
                                                placeholder="{{ translate('messages.new_food') }}"
                                                value="{{ $product['name'] }}" required>
                                        </div>
                                        <input type="hidden" name="lang[]" value="default">
                                        <div class="form-group pt-2 mb-0">
                                            <label class="input-label"
                                                for="exampleFormControlInput1">{{ translate('messages.short_description') }}</label>
                                            <textarea type="text" name="description[]" class="form-control summernote min--height-200">{!! $product['description'] !!}</textarea>
                                        </div>
                                        <div class="form-group mb-0">
                                            <label class="input-label mt-2" for="exampleFormControlInput1">{{ translate('messages.disclaimer') }}</label>
                                            <textarea id="summernote" name="disclaimer[]" class="form-control summernote">{!! $product['disclaimer'] !!}</textarea>
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card h-100">
                            <div class="card-header">
                                <h5 class="card-title">
                                    <span class="card-header-icon">
                                        <i class="tio-image"></i>
                                    </span>
                                    <span>{{ translate('item_image') }}</span>
                                </h5>
                            </div>
                            <div class="card-body d-flex flex-column">
                                <div class="mb-auto">
                                    <input type="hidden" id="removedImageKeysInput" name="removedImageKeys"
                                        value="">

                                    <label class="input-label"
                                        for="exampleFormControlInput1">{{ translate('messages.item_images') }}</label>
                                    <div class="row" id="coba">
                                        @foreach ($product->images as $key => $photo)
                                            <div class="col-xl-2 col-lg-3 col-md-4 col-sm-4 col-6 spartan_item_wrapper"
                                                id="product_images_{{ $key }}">
                                                <img class="img--square"
                                                    src="{{ asset("storage/app/public/product/$photo") }}"
                                                    alt="Product image">


                                                @if (request()->product_gellary == 1)
                                                    <a href="#"
                                                        onclick="function_remove_img({{ $key }},'{{ $photo }}')"
                                                        class="spartan_remove_row"><i class="tio-add-to-trash"></i></a>
                                                @else
                                                    <a href="{{ route('vendor.item.remove-image', ['id' => $product['id'], 'name' => $photo, 'temp_product' => $temp_product]) }}"
                                                        class="spartan_remove_row"><i class="tio-add-to-trash"></i></a>
                                                @endif
                                            </div>
                                        @endforeach

                                    </div>
                                </div>
                                <div class="mt-3">
                                    <label class="text-dark">{{ translate('messages.item_thumbnail') }} <small
                                            class="text-danger">* ( {{ translate('messages.ratio') }} 1:1
                                            )</small></label>
                                    <center class="d-block" id="image-viewer-section" class="pt-2">
                                        <img class="img--100" id="viewer"
                                            src="{{ asset('storage/app/public/product') }}/{{ $product['image'] }}"
                                            onerror='this.
                                            src="{{ asset('/public/assets/admin/img/400x400/img2.jpg') }}"'
                                            alt="product image" />
                                    </center>
                                    <div class="custom-file mt-3">
                                        <input type="file" name="image" id="customFileEg1"
                                            class="custom-file-input"
                                            accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                        <label class="custom-file-label"
                                            for="customFileEg1">{{ translate('messages.choose_file') }}</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">
                                    <span class="card-header-icon">
                                        <i class="tio-dashboard-outlined"></i>
                                    </span>
                                    <span> {{ translate('item_details') }} </span>
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="row g-2">
                                    <div class="col-sm-6 col-lg-4">
                                        <div class="form-group mb-0">
                                            <label class="input-label"
                                                for="exampleFormControlSelect1">{{ translate('messages.category') }}<span
                                                    class="input-label-secondary">*</span></label>
                                            <select name="category_id" id="category-id"
                                                class="form-control js-select2-custom"
                                                onchange="getRequest('{{ url('/') }}/store-panel/item/get-categories?parent_id='+this.value,'sub-categories')">
                                                @foreach ($categories as $category)
                                                    <option value="{{ $category['id'] }}"
                                                        {{ $category->id == $product_category[0]->id ? 'selected' : '' }}>
                                                        {{ $category['name'] }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-4">
                                        <div class="form-group mb-0">
                                            <label class="input-label"
                                                for="exampleFormControlSelect1">{{ translate('messages.sub_category') }}<span
                                                    class="input-label-secondary"></span></label>
                                            <select name="sub_category_id" id="sub-categories"
                                                data-id="{{ count($product_category) >= 2 ? $product_category[1]->id : '' }}"
                                                class="form-control js-select2-custom"
                                                onchange="getRequest('{{ url('/') }}/store-panel/item/get-categories?parent_id='+this.value,'sub-sub-categories')">
                                                @if ($product_category[1]->id)
                                                    <?php 
                                                        $category = \App\Models\Category::where(['parent_id' => 1])->where('id',$product_category[1]->id)->module(\App\CentralLogics\Helpers::get_store_data()->module_id)->first();
                                                    ?>
                                                    <option value="{{ $product_category[1]->id }}" >
                                                        {{ $category->name}}</option>
                                                @endif
                                                
                                            </select>
                                        </div>
                                    </div>


                                    <div class="col-sm-6 col-lg-4">
                                        <div class="form-group mb-0">
                                            <label class="input-label"
                                                for="exampleFormControlSelect1">{{ translate('messages.sub_sub_category') }}<span
                                                    class="input-label-secondary"></span></label>
                                            <select name="sub_sub_category_id" id="sub-sub-categories"
                                                data-id="{{ count($product_category) >= 2 ? $product_category[1]->id : '' }}"
                                                class="form-control js-select2-custom"
                                                onchange="getRequest('{{ url('/') }}/store-panel/item/get-categories?parent_id='+this.value,'sub-sub-sub-categories')">
                                                @if ($product_category[2]->id)
                                                    <?php 
                                                        $category = \App\Models\Category::where(['parent_id' => 2])->where('id',$product_category[2]->id)->module(\App\CentralLogics\Helpers::get_store_data()->module_id)->first();
                                                    ?>
                                                    <option value="{{ $product_category[2]->id }}" >
                                                        {{ $category->name}}</option>
                                                @endif
                                            </select>
                                        </div>
                                    </div>


                                    @if(\App\CentralLogics\Helpers::get_vendor_module_id()=='grocery') 
                                    <div class="col-sm-6 col-lg-4">
                                        <div class="form-group mb-0">
                                            <label class="input-label"
                                                for="exampleFormControlSelect1">{{ translate('messages.brnads') }}<span
                                                    class="input-label-secondary"></span></label>
                                            <select name="brand_id" id="brand_id"
                                                class="form-control js-select2-custom"
                                                required>
                                                <?php
                                                    $brands = DB::table('brands')->where('module_id',\App\CentralLogics\Helpers::get_store_data()->module_id)->get();
                                                ?>

                                                @foreach($brands as $brand)
                                                    <option value="{{ $brand->id }}" {{ $product['brand_id']?($product['brand_id']==$brand->id?'selected':''):'' }}>{{ $brand->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    @else
                                    @endif

                                    @if ($module_data['common_condition'])
                                        <div class="col-sm-6 col-lg-4">
                                            <div class="form-group mb-0">
                                                <label class="input-label"
                                                    for="condition_id">{{ translate('messages.Suitable_For') }}<span
                                                        class="input-label-secondary"></span></label>
                                                <select name="condition_id" id="condition_id"
                                                    data-placeholder="{{ translate('messages.Select_Condition') }}"
                                                    id="condition_id" class="js-select2-custom form-control"
                                                    oninvalid="this.setCustomValidity('{{ translate('messages.Select_Condition') }}')">
                                                    <option value="">---{{ translate('messages.select') }}---
                                                    </option>
                                                    @foreach ($conditions as $condition)
                                                        <option value="{{ $condition['id'] }}"
                                                            {{ $product->pharmacy_item_details?->common_condition_id == $condition['id'] ? 'selected' : '' }}>
                                                            {{ $condition['name'] }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    @endif
                                    @if ($module_data['unit'])
                                        <div class="col-sm-6 col-lg-4" id="unit_input">
                                            <div class="form-group mb-0">
                                                <label class="input-label text-capitalize"
                                                    for="unit">{{ translate('messages.unit') }}</label>
                                                <select name="unit" class="form-control js-select2-custom">
                                                    @foreach (\App\Models\Unit::all() as $unit)
                                                        <option value="{{ $unit->id }}"
                                                            {{ $unit->id == $product->unit_id ? 'selected' : '' }}>
                                                            {{ $unit->unit }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    @endif
                                    @if ($module_data['veg_non_veg'])
                                        <div class="col-sm-6 col-lg-4">
                                            <div class="form-group mb-0">
                                                <label class="input-label"
                                                    for="exampleFormControlInput1">{{ translate('messages.item_type') }}</label>
                                                <select name="veg" class="form-control js-select2-custom">
                                                    <option value="0" {{ $product['veg'] == 0 ? 'selected' : '' }}>
                                                        {{ translate('messages.non_veg') }}</option>
                                                    <option value="1" {{ $product['veg'] == 1 ? 'selected' : '' }}>
                                                        {{ translate('messages.veg') }}</option>
                                                </select>
                                            </div>
                                        </div>
                                    @endif
                                    <div class="col-sm-6 col-lg-4">
                                        <div class="form-group mb-0">
                                            <label class="input-label"
                                                for="exampleFormControlInput1">{{ translate('messages.price') }}</label>
                                            <input type="number" value="{{ $product->price }}" min="0"
                                                max="100000" name="price" class="form-control" step="0.01"
                                                placeholder="{{ translate('messages.Ex:') }} 100" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-4">
                                        <div class="form-group mb-0">
                                            <label class="input-label"
                                                for="exampleFormControlInput1">{{ translate('messages.discount') }}</label>
                                            <input type="number" min="0" value="{{ $product['discount'] }}"
                                                max="100000" name="discount" class="form-control"
                                                placeholder="{{ translate('messages.Ex:') }} 100">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-lg-4">
                                        <div class="form-group mb-0">
                                            <label class="input-label"
                                                for="exampleFormControlInput1">{{ translate('messages.discount_type') }}</label>
                                            <select name="discount_type" class="form-control js-select2-custom">
                                                <option value="percent"
                                                    {{ $product['discount_type'] == 'percent' ? 'selected' : '' }}>
                                                    {{ translate('messages.percent') }}
                                                </option>
                                                <option value="amount"
                                                    {{ $product['discount_type'] == 'amount' ? 'selected' : '' }}>
                                                    {{ translate('messages.amount') }}
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    @if ($module_data['stock'])
                                        <div class="col-sm-6 col-lg-4">
                                            <div class="form-group mb-0">
                                                <label class="input-label"
                                                    for="total_stock">{{ translate('messages.total_stock') }}</label>
                                                <input type="number" class="form-control" name="current_stock"
                                                    min="0" value="{{ $product->stock }}" id="quantity">
                                            </div>
                                        </div>
                                    @endif
                                    <div class="col-sm-6 col-lg-4" id="maximum_cart_quantity">
                                        <div class="form-group mb-0">
                                            <label class="input-label"
                                                for="maximum_cart_quantity">{{ translate('messages.Maximum_Purchase_Quantity_Limit') }}
                                                <span class="input-label-secondary text--title" data-toggle="tooltip"
                                                    data-placement="right"
                                                    data-original-title="{{ translate('If_this_limit_is_exceeded,_customers_can_not_buy_the_item_in_a_single_purchase.') }}">
                                                    <i class="tio-info-outined"></i>
                                                </span>
                                            </label>
                                            <input type="number" placeholder="{{ translate('messages.Ex:_10') }}"
                                                class="form-control" name="maximum_cart_quantity" min="0"
                                                value="{{ $product->maximum_cart_quantity }}" id="cart_quantity">
                                        </div>
                                    </div>
                                    @if (\App\CentralLogics\Helpers::get_vendor_module_id()=='grocery')
                                        <div class="col-sm-6 col-lg-3" id="origin">
                                            <div class="form-group mb-0">
                                                <label class="input-label text-capitalize" for="origin">{{ translate('messages.country_of_origin')
                                                    }}</label>
                                                <select name="country_of_origin" id="country_of_origin" data-placeholder="{{ translate('messages.Select_country_of_origin') }}" class="form-control js-select2-custom" required>
                                                    <option value="">{{ translate('select origin') }}</option>
                                                    @foreach (\App\Models\Origin::where([['module_id',\App\CentralLogics\Helpers::get_store_data()->module->id],['status',1]])->orderBy('name')->get() as $origin)
                                                    <option value="{{ $origin->id }}" {{ $product->origin_id==$origin->id?'selected':'' }}>{{ $origin->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    @endif
                                    <div class="col-sm-6 col-lg-4" id="organic">
                                        <div class="form-check mb-0 p-6">
                                            <input class="form-check-input" name="organic" type="checkbox"
                                                value="1" id="flexCheckDefault"
                                                {{ $product->organic == 1 ? 'checked' : '' }}>
                                            <label class="form-check-label" for="flexCheckDefault">
                                                {{ translate('messages.is_organic') }}
                                            </label>
                                        </div>
                                    </div>

                                    @if (\App\CentralLogics\Helpers::get_vendor_module_id()=='grocery')
                                    <div class="col-sm-6 col-lg-3" id="special">
                                        <div class="form-check mb-0 p-6">
                                            <input class="form-check-input" id="is_special" name="special" type="checkbox" value="1"
                                                id="flexCheckDefault" {{ $product->special==1?'checked':'' }}>
                                            <label class="form-check-label" for="flexCheckDefault">
                                                {{ translate('messages.is_special') }}
                                            </label>
                                        </div>
                                    </div>
                                    @endif
                                    @if ($module_data['basic'])
                                        <div class="col-sm-6 col-lg-4" id="basic">
                                            <div class="form-check mb-0 p-6">
                                                <input class="form-check-input" name="basic" type="checkbox"
                                                    value="1" id="flexCheckDefaultbasic"
                                                    {{ $product->pharmacy_item_details?->is_basic == 1 ? 'checked' : '' }}>
                                                <label class="form-check-label" for="flexCheckDefaultbasic">
                                                    {{ translate('messages.is_basic') }}
                                                </label>
                                            </div>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" id="food_variation_section">
                        <div class="card">
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
                                <div id="add_new_option">
                                    @if (isset($product->food_variations) && count(json_decode($product->food_variations, true)) > 0)
                                        @foreach (json_decode($product->food_variations, true) as $key_choice_options => $item)
                                            @if (isset($item['price']))
                                            @break

                                        @else
                                            @include('admin-views.product.partials._new_variations', [
                                                'item' => $item,
                                                'key' => $key_choice_options + 1,
                                            ])
                                        @endif
                                    @endforeach
                                @endif
                            </div>

                            <!-- Empty Variation -->
                            @if (!isset($product->food_variations) || count(json_decode($product->food_variations, true)) < 1)
                                <div id="empty-variation">
                                    <div class="text-center">
                                        <img src="{{ asset('/public/assets/admin/img/variation.png') }}"
                                            alt="">
                                        <div>{{ translate('No variation added') }}</div>
                                    </div>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
                @if (\App\CentralLogics\Helpers::get_vendor_module_id()=='grocery')     
                    <div class="col-md-12" id="special_div" style="display:{{ $product->special==1?'block':'none' }};">
                        <div class="card shadow--card-2 border-0">
                            <div class="card-header">
                                <h5 class="card-title">
                                    <span class="card-header-icon"><i class="tio-dollar-outlined"></i></span>
                                    <span>{{ translate('Specialities') }}</span>
                                </h5>
                            </div>
                            <?php 
                                $speciality = null;
                                if( $product->special==1){
                                    $speciality = \App\Models\Speciality::where('item_id',$product['id'])->first();
                                    $sparr = explode(',',$speciality->speciality);
                                }
                            ?>
                            <div class="card-body">
                                <div class="row g-2">
                                    <div class="col-sm-12 col-12">
                                        <div class="form-group mb-0">
                                            <label class="input-label" for="exampleFormControlInput1">{{
                                                translate('messages.select_speciality') }}</label>
                                            <select name="speciality[]" id="speciality"
                                            class="form-control js-select2-custom" multiple="multiple">
                                                <option value="Organic" {{ $speciality!=null?(in_array('Organic',$sparr)?'selected':''):'' }}>{{ translate('Organic') }}</option>
                                                <option value="Gluten Free" {{ $speciality!=null?(in_array('Gluten Free',$sparr)?'selected':''):'' }}>{{ translate('Gluten Free') }}</option>
                                                <option value="Sugar Free" {{ $speciality!=null?(in_array('Sugar Free',$sparr)?'selected':''):'' }}>{{ translate('Sugar Free') }}</option>
                                                <option value="Vegan" {{ $speciality!=null?(in_array('Vegan',$sparr)?'selected':''):'' }}>{{ translate('Vegan') }}</option>
                                                <option value="Lactose Free" {{ $speciality!=null?(in_array('Lactose Free',$sparr)?'selected':''):'' }}>{{ translate('Lactose Free') }}</option>
                                                <option value="Plant Based" {{ $speciality!=null?(in_array('Plant Based',$sparr)?'selected':''):'' }}>{{ translate('Plant Based') }}</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
                <div class="col-md-12" id="attribute_section">
                    <div class="card">
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
                                        <label class="input-label"
                                            for="exampleFormControlSelect1">{{ translate('messages.attribute') }}<span
                                                class="input-label-secondary"></span></label>
                                        <select name="attribute_id[]" id="choice_attributes"
                                            class="form-control js-select2-custom" multiple="multiple">
                                            @foreach (\App\Models\Attribute::orderBy('name')->get() as $attribute)
                                                <option value="{{ $attribute['id'] }}"
                                                    {{ in_array($attribute->id, json_decode($product['attributes'], true)) ? 'selected' : '' }}>
                                                    {{ $attribute['name'] }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="customer_choice_options" id="customer_choice_options">
                                        @include('vendor-views.product.partials._choices', [
                                            'choice_no' => json_decode($product['attributes']),
                                            'choice_options' => json_decode($product['choice_options'], true),
                                        ])
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="variant_combination" id="variant_combination">
                                        @include('vendor-views.product.partials._edit-combinations', [
                                            'combinations' => json_decode($product['variations'], true),
                                            'stock' => $module_data['stock'],
                                        ])
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @if ($module_data['add_on'])
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">
                                    <span class="card-header-icon"><i class="tio-puzzle"></i></span>
                                    <span>{{ translate('addon') }}</span>
                                </h5>
                            </div>
                            <div class="card-body pb-0">
                                <div class="row g-2">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label class="input-label"
                                                for="exampleFormControlSelect1">{{ translate('messages.addon') }}<span
                                                    class="input-label-secondary"></span></label>
                                            <select name="addon_ids[]" class="form-control js-select2-custom"
                                                multiple="multiple">
                                                @foreach (\App\Models\AddOn::where('store_id', \App\CentralLogics\Helpers::get_store_id())->orderBy('name')->get() as $addon)
                                                    <option value="{{ $addon['id'] }}"
                                                        {{ in_array($addon->id, json_decode($product['add_ons'], true)) ? 'selected' : '' }}>
                                                        {{ $addon['name'] }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">
                                <span class="card-header-icon"><i class="tio-label"></i></span>
                                <span>{{ translate('tags') }}</span>
                            </h5>
                        </div>
                        <div class="card-body pb-0">
                            <div class="row g-2">
                                <div class="col-12">

                                    @if (isset($temp_product) && $temp_product == 1)
                                        <div class="form-group">
                                            @php($tagids = json_decode($product?->tag_ids) ?? [])
                                            @php($tags = \App\Models\Tag::whereIn('id', $tagids)->get('tag'))
                                            <input type="text" class="form-control" name="tags"
                                                placeholder="Enter tags"
                                                value="@foreach ($tags as $c) {{ $c->tag . ',' }} @endforeach"
                                                data-role="tagsinput">
                                        </div>
                                    @else
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="tags"
                                                placeholder="Enter tags"
                                                value="@foreach ($product->tags as $c) {{ $c->tag . ',' }} @endforeach"
                                                data-role="tagsinput">
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @if ($module_data['item_available_time'])
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">
                                    <span class="card-header-icon"><i class="tio-date-range"></i></span>
                                    <span>{{ translate('available_time_schedule') }}</span>
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="row -2">
                                    <div class="col-sm-6">
                                        <div class="form-group mb-0">
                                            <label class="input-label"
                                                for="exampleFormControlInput1">{{ translate('messages.available_time_starts') }}</label>
                                            <input type="time" value="{{ $product['available_time_starts'] }}"
                                                name="available_time_starts" class="form-control"
                                                placeholder="{{ translate('messages.Ex:') }} 10:30 am" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group mb-0">
                                            <label class="input-label"
                                                for="exampleFormControlInput1">{{ translate('messages.available_time_ends') }}</label>
                                            <input type="time" value="{{ $product['available_time_ends'] }}"
                                                name="available_time_ends" class="form-control" placeholder="5:45 pm"
                                                required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
                <div class="col-12">
                    <div class="btn--container justify-content-end">
                        <button type="reset" id="reset_btn"
                            class="btn btn--reset">{{ translate('messages.reset') }}</button>
                        <button type="submit" class="btn btn--primary">{{ request()->product_gellary == 1?translate('messages.submit'):translate('messages.update') }}</button>
                    </div>
                </div>
            </div>
        </form>
    @endif
</div>

@endsection

@push('script')
@endpush

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
                placeholder: '{{ translate('messages.service_details') }}'
            });
        });
    });
</script>
<script>
    var count = 0;
    var mod_type = "{{ $module_type }}";
    var removedImageKeys = [];

    function function_remove_img(key, photo) {
        $('#product_images_' + key).addClass('d-none');
        removedImageKeys.push(photo);
        $('#removedImageKeysInput').val(removedImageKeys.join(','));
    }

    $(document).ready(function() {
        $('#organic').hide();
        if (mod_type == 'grocery') {
            $('#organic').show();
        }
        if (mod_type == 'food') {
            $('#food_variation_section').show();
            $('#attribute_section').hide();
        } else {
            $('#food_variation_section').hide();
            $('#attribute_section').show();
        }
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
<script>
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
        $('#image-viewer-section').show(1000)
    });
</script>
@if (!\App\CentralLogics\Helpers::get_vendor_module_id() == 'services')
    <script>
        $(document).ready(function() {
            setTimeout(function() {
                let category = $("#category-id").val();
                let sub_category = '{{ count($product_category) >= 2 ? $product_category[1]->id : '' }}';
                let sub_sub_category = '{{ count($product_category) >= 3 ? $product_category[2]->id : '' }}';
                getRequest('{{ url('/') }}/store-panel/item/get-categories?parent_id=' + category +
                    '&&sub_category=' + sub_category, 'sub-categories');
                getRequest('{{ url('/') }}/store-panel/item/get-categories?parent_id=' +
                    sub_category + '&&sub_category=' + sub_sub_category, 'sub-sub-categories');
            }, 1000)
        });
    </script>
@endif
<script>
    $(document).on('ready', function() {
        $('.js-select2-custom').each(function() {
            var select2 = $.HSCore.components.HSSelect2.init($(this));
        });
    });
</script>


<script src="{{ asset('public/assets/admin') }}/js/tags-input.min.js"></script>

<script>
    $('#choice_attributes').on('change', function() {
        combination_update();
        $('#customer_choice_options').html(null);
        $.each($("#choice_attributes option:selected"), function() {
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

    setTimeout(function() {
        $('.call-update-sku').on('change', function() {
            combination_update();
        });
    }, 2000)

    $('#colors-selector').on('change', function() {
        combination_update();
    });

    $('input[name="unit_price"]').on('keyup', function() {
        combination_update();
    });

    function combination_update() {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $.ajax({
            type: "POST",
            url: '{{ route('vendor.item.variant-combination') }}',
            data: $('#product_form').serialize() + '&stock={{ $module_data['stock'] }}',
            beforeSend: function() {
                $('#loading').show();
            },
            success: function(data) {
                $('#loading').hide();
                $('#variant_combination').html(data.view);
                if (data.length > 1) {
                    $('#quantity').hide();
                } else {
                    $('#quantity').show();
                }
            }
        });
    }
</script>

<script>
    $('#product_form').on('submit', function() {
        var formData = new FormData(this);
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.post({
            url: $('.route_url').val(),
            data: $('#product_form').serialize(),
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
                }
                if (data.product_approval) {
                    toastr.success(data.product_approval, {
                        CloseButton: true,
                        ProgressBar: true
                    });
                    setTimeout(function() {
                        location.href = '{{ route('vendor.item.pending_item_list') }}';
                    }, 2000);
                }
               
                if (data.success) {
                    toastr.success(data.success, {
                        CloseButton: true,
                        ProgressBar: true
                    });
                    setTimeout(function() {
                        if (data.is_approved==0) {
                            location.href = '{{ route('vendor.item.pending_list') }}';
                        }else{
                            location.href = '{{ route('vendor.item.list') }}';
                        }
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
        if (lang == 'en') {
            $("#from_part_2").removeClass('d-none');
        } else {
            $("#from_part_2").addClass('d-none');
        }
    })
    $('#reset_btn').click(function() {
        location.reload(true);
    })
</script>

<script src="{{ asset('public/assets/admin/js/spartan-multi-image-picker.js') }}"></script>
<script type="text/javascript">
    $(function() {
        $("#coba").spartanMultiImagePicker({
            fieldName: 'item_images[]',
            maxCount: 6,
            rowHeight: '120px',
            groupClassName: 'col-lg-2 col-md-4 col-sm-4 col-6',
            maxFileSize: '',
            placeholderImage: {
                image: "{{ asset('public/assets/admin/img/400x400/img2.jpg') }}",
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
    });
</script>
<script>
    $('#plus_timeslot').on('click', function() {
        $('#append_timeslot').append(`
        <div class="col-md-3 mt-3" id="new_append">
            <div class="row">
                <div class="col-md-9">
                    <input type="time" class="form-control" name="timeslot_list[]">
                </div>
                <div class="col-md-3">
                    <button type="button" id="del_timeslot" class="btn btn-danger" style="padding-bottom:10px; padding-top:10px;"><i class="tio-delete-outlined"></i></button>
                </div>    
            </div>
        </div>
    `);
    });

    $(document).on('click', '#del_timeslot', function() {
        $(this).closest('#new_append').remove();
    });

    function changeStaffDiv(x, y) {
        $('#' + x + "_div").removeClass('d-none');
        $('#' + y + "_div").addClass('d-none');
    }

    $(document).on('change','#is_special',function(){
            if($(this).is(":checked")){
                $('#special_div').slideDown(500);
            }else{
                $('#special_div').slideUp(500);
            }
        })
</script>
@endpush
