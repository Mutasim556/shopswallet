@extends('layouts.admin.app')

@section('title', translate('messages.Packages'))

@push('css_or_js')
    <link href="{{ asset('public/assets/admin/css/tags-input.min.css') }}" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-header-title">
                <span class="page-header-icon">
                    <img src="{{ asset('public/assets/admin/img/category.png') }}" class="w--20" alt="">
                </span>
                <span>
                    {{ isset($package)?translate('update_package'):translate('add_new_package') }}
                </span>
            </h1>
        </div>
        <!-- End Page Header -->

        <div class="card">
            <div class="card-body">
                <form
                    action="{{ isset($package) ? route('subscription.packages.update', [$package['id']]) : route('subscription.packages.store') }}"
                    method="post" enctype="multipart/form-data">
                    @csrf
                    @php($language = \App\Models\BusinessSetting::where('key', 'language')->first())
                    @php($language = $language->value ?? null)
                    @php($default_lang = str_replace('_', '-', app()->getLocale()))
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

                            @if (isset($package))
                                @method('PUT')
                            @endif
                            @if ($language)
                                <div class="form-group lang_form" id="default-form">
                                    <label class="input-label"
                                        for="exampleFormControlInput1">{{ translate('messages.name') }}
                                        ({{ translate('messages.default') }})</label>
                                    <input type="text" name="name[]" class="form-control"
                                        placeholder="{{ translate('messages.new_package') }}" maxlength="191"
                                        oninvalid="document.getElementById('en-link').click()" value="{{isset($package)?$package->getRawOriginal('name'):''}}">
                                    {{-- {{ session()->get('current_module') }} --}}
                                    
                                    <label class="input-label mt-2" for="exampleFormControlInput1">{{ translate('messages.package_details') }}
                                        ({{ translate('messages.default') }})</label>
                                    <textarea id="summernote" name="package_details[]" class="form-control summernote"
                                        oninvalid="document.getElementById('en-link').click()">{{isset($package)?$package->getRawOriginal('details'):''}}</textarea>
                                </div>
                                <input type="hidden" name="lang[]" value="default">
                                @foreach (json_decode($language) as $lang)

                                <?php
                                    if (isset($package)) {
                                        if(count($package['translations'])){
                                            $translate = [];
                                            foreach($package['translations'] as $t)
                                            {
                                                if($t->locale == $lang && $t->key=="name"){
                                                    $translate[$lang]['name'] = $t->value;
                                                }
                                                if($t->locale == $lang && $t->key=="package_details"){
                                                    $translate[$lang]['package_details'] = $t->value;
                                                }
                                            }
                                        }
                                    }
                                ?>
                                    <div class="form-group d-none lang_form" id="{{ $lang }}-form">
                                        <label class="input-label"
                                            for="exampleFormControlInput1">{{ translate('messages.name') }}
                                            ({{ strtoupper($lang) }})
                                        </label>
                                        <input type="text" name="name[]" class="form-control"
                                            placeholder="{{ translate('messages.new_package') }}" maxlength="191"
                                            oninvalid="document.getElementById('en-link').click()" value="{{ isset($package)? $translate[$lang]['name']:'' }}">

                                        <label class="input-label mt-2" for="exampleFormControlInput1">{{ translate('messages.package_details') }}
                                            ({{ strtoupper($lang) }})
                                        </label>
                                        <textarea id="summernote" name="package_details[]" class="form-control summernote"
                                            oninvalid="document.getElementById('en-link').click()">{{ isset($package)? $translate[$lang]['package_details']:'' }}</textarea>
                                    </div>
                                    <input type="hidden" name="lang[]" value="{{ $lang }}">
                                @endforeach
                            @else
                                <div class="form-group">
                                    <label class="input-label"
                                        for="exampleFormControlInput1">{{ translate('messages.name') }}</label>
                                    <input type="text" name="name" class="form-control"
                                        placeholder="{{ translate('messages.new_package') }}" value="{{isset($package)?$package->getRawOriginal('name'):''}}"
                                        maxlength="191">
                                </div>

                                <div class="form-group lang_form" id="default-form">
                                    <label class="input-label"
                                        for="exampleFormControlInput1">{{ translate('messages.package_details') }}</label>
                                    <textarea id="summernote" name="package_details[]" class="form-control summernote"
                                        oninvalid="document.getElementById('en-link').click()">{{isset($package)?$package->getRawOriginal('details'):''}}</textarea>
                                </div>
                                <input type="hidden" name="lang[]" value="default">
                            @endif
                            <div class="row">
                                <div class="form-group col-md-3 col-lg-3 mb-0 pt-md-4">
                                    <label class="input-label">{{translate('messages.module')}}</label>
                                    <select name="module" id="module_id" required class="form-control js-select2-custom"  data-placeholder="{{translate('messages.select_module')}}">
                                            <option value="" selected disabled>{{translate('messages.select_module')}}</option>
                                        @foreach (\App\Models\Module::notParcel()->get() as $module)
                                            <option value="{{$module->id}}" {{ isset($package)?($package->module->id==$module->id?'selected':''):'' }}>{{$module->module_name}}</option>
                                        @endforeach
                                    </select>
                                    {{-- <small class="text-danger">{{translate('messages.module_change_warning')}}</small> --}}
                                </div>
                                <div class="form-group col-md-3 col-lg-3 mb-0 pt-md-4">
                                    <label class="input-label">{{translate('messages.price')}}</label>
                                    <input type="text" name="price" id="price" required class="form-control" placeholder="{{translate('messages.package_price')}}" value="{{  isset($package)?$package->price:'' }}">
                                </div>
                                <div class="form-group col-md-3 col-lg-3 mb-0 pt-md-4">
                                    <label class="input-label">{{translate('messages.currency')}}</label>
                                    <select name="currency" id="currency" required class="form-control js-select2-custom"  data-placeholder="{{translate('messages.select_currency')}}">
                                        <option value="" selected disabled>{{translate('messages.select_currency')}}</option>
                                        <option value="BDT" {{  isset($package)?($package->currency=='BDT'?'selected':''):'' }}>BDT</option>
                                        <option value="USD" {{  isset($package)?($package->currency=='USD'?'selected':''):'' }}>USD</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3 col-lg-3 mb-0 pt-md-4">
                                    <label class="input-label">{{translate('messages.package_type')}}</label>
                                    <select name="package_type" id="package_type" required class="form-control js-select2-custom"  data-placeholder="{{translate('messages.select_package_type')}}">
                                        <option value="" selected disabled>{{translate('messages.select_package_type')}}</option>
                                        <option value="1" {{  isset($package)?($package->package_type=='1'?'selected':''):'' }}>Top Sell</option>
                                        <option value="2" {{  isset($package)?($package->package_type=='2'?'selected':''):'' }}>Recomended</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3 col-lg-3 mb-0 pt-md-4">
                                    <label class="input-label">{{translate('messages.purchase_type')}}</label>
                                    <select name="purchase_type" id="purchase_type" required class="form-control js-select2-custom"  data-placeholder="{{translate('messages.select_purchase_type')}}">
                                        <option value="" selected disabled>{{translate('messages.select_purchase_type')}}</option>
                                        <option value="Free" {{  isset($package)?($package->purchase_type=='Free'?'selected':''):'' }}>Free</option>
                                        <option value="Paid" {{  isset($package)?($package->purchase_type=='Paid'?'selected':''):'' }}>Paid</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3 col-lg-3 mb-0 pt-md-4">
                                    <label class="input-label">{{translate('messages.discount')}}</label>
                                    <input type="text" name="discount" id="discount" class="form-control" placeholder="{{translate('messages.discount')}}" value="{{  isset($package)?$package->discount:'' }}">
                                    {{-- <small class="text-danger">{{translate('messages.module_change_warning')}}</small> --}}
                                </div>
                                <div class="form-group col-md-3 col-lg-3 mb-0 pt-md-4">
                                    <label class="input-label">{{translate('messages.discount_type')}}</label>
                                    <select name="discount_type" id="discount_type" class="form-control js-select2-custom"  data-placeholder="{{translate('messages.discount_type')}}">
                                        <option value="" selected disabled>{{translate('messages.select_discount_type')}}</option>
                                        <option value="Flat" {{  isset($package)?($package->discount_type=='Flat'?'selected':''):'' }}>Flat</option>
                                        <option value="Percent" {{  isset($package)?($package->discount_type=='Percent'?'selected':''):'' }}>Percent</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3 col-lg-3 mb-0 pt-md-4">
                                    <label class="input-label">{{translate('messages.validity')}}</label>
                                    <input type="text" name="validity" id="validity" required class="form-control" placeholder="{{translate('messages.123')}}" value="{{  isset($package)?$package->validity:'' }}">
                                </div>
                                <div class="form-group col-md-3 col-lg-3 mb-0 pt-md-4">
                                    <label class="input-label">{{translate('messages.purchase_limit')}}</label>
                                    <input type="text" name="purchase_limit" id="purchase_limit" required class="form-control" placeholder="{{translate('messages.12')}}" value="{{  isset($package)?$package->purchase_limit:'' }}">
                                </div>
                                <div class="form-group col-md-3 col-lg-3 mb-0 pt-md-4">
                                    <label class="input-label">{{translate('messages.purchase_limit_time')}}</label>
                                    <input type="text" name="purchase_limit_time" id="purchase_limit_time" required class="form-control" placeholder="{{translate('messages.example-30')}}" value="{{  isset($package)?$package->purchase_limit_time:'' }}">
                                    <small class="text-danger">{{translate('messages.type 0 for no limit and type -1 for only once ')}}</small>
                                </div>
                                <div class="form-group col-md-3 col-lg-3 mb-0 pt-md-4" >
                                    <input type="checkbox" name="purchase_with_point" style="margin-top: 10%" id="purchase_with_point" {{  isset($package)?($package->purchase_with_point==1?'checked':''):'' }}> &nbsp; {{ translate('messages.Can purchase with point ?') }}
                                </div>
                                <div class="form-group col-md-3 col-lg-3 mb-0 pt-md-4" >
                                    <input type="checkbox" name="gift_it" id="gift_it" style="margin-top: 10%" {{  isset($package)?($package->gift_it==1?'checked':''):'' }}> &nbsp; {{ translate('messages.Can gift it ?') }}
                                </div>
                                <div class="form-group col-md-3 col-lg-3 mb-0 pt-md-4">
                                    <label class="input-label">{{translate('messages.maximum_order_limit')}}</label>
                                    <input type="text" name="maximum_order_limit" id="maximum_order_limit" required class="form-control" placeholder="{{translate('messages.example-30')}}" value="{{  isset($package)?$package->maximum_order_limit:'' }}">
                                </div>
                            </div>
                            
                            {{-- <input name="position" value="0" class="initial-hidden"> --}}
                        </div>
                        
                    </div>
                    <div class="btn--container justify-content-end mt-3">
                        <button type="reset" id="reset_btn"
                            class="btn btn--reset">{{ translate('messages.reset') }}</button>
                        <button type="submit"
                            class="btn btn--primary">{{ isset($package) ? translate('messages.update') : translate('messages.add') }}</button>
                    </div>

                </form>
            </div>
        </div>

        <div class="card mt-3">
            <div class="card-header py-2 border-0">
                <div class="search--button-wrapper">
                    <h5 class="card-title">{{ translate('messages.package_list') }}<span
                            class="badge badge-soft-dark ml-2" id="itemCount">{{ $packages->total() }}</span></h5>
                    {{-- <div class="min--240">
                        <select name="module_id" class="form-control js-select2-custom" onchange="set_filter('{{url()->full()}}',this.value,'module_id')" title="{{translate('messages.select_modules')}}">
                            <option value="" {{!request('module_id') ? 'selected':''}}>{{translate('messages.all_modules')}}</option>
                            @foreach (\App\Models\Module::notParcel()->get() as $module)
                                <option
                                    value="{{$module->id}}" {{request('module_id') == $module->id?'selected':''}}>
                                    {{$module['module_name']}}
                                </option>
                            @endforeach
                        </select>
                    </div> --}}

                    <form class="search-form">

                        <!-- Search -->
                        <div class="input-group input--group">
                            <input type="search" name="search" value="{{ request()?->search ?? null }}"
                                class="form-control min-height-45"
                                placeholder="{{ translate('messages.search_packages') }}"
                                aria-label="{{ translate('messages.ex_:_packages') }}">
                            <button type="submit" class="btn btn--secondary min-height-45"><i
                                    class="tio-search"></i></button>
                        </div>
                        <!-- End Search -->
                    </form>
                    <!-- Unfold -->
                    <div class="hs-unfold mr-2">
                        <a class="js-hs-unfold-invoker btn btn-sm btn-white dropdown-toggle min-height-40"
                            href="javascript:;"
                            data-hs-unfold-options='{
                                    "target": "#usersExportDropdown",
                                    "type": "css-animation"
                                }'>
                            <i class="tio-download-to mr-1"></i> {{ translate('messages.export') }}
                        </a>

                        <div id="usersExportDropdown"
                            class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-sm-right">

                            <span class="dropdown-header">{{ translate('messages.download_options') }}</span>
                            {{-- <a id="export-excel" class="dropdown-item"
                                href="{{ route('admin.category.export-packages', ['type' => 'excel', request()->getQueryString()]) }}">
                                <img class="avatar avatar-xss avatar-4by3 mr-2"
                                    src="{{ asset('public/assets/admin') }}/svg/components/excel.svg"
                                    alt="Image Description">
                                {{ translate('messages.excel') }}
                            </a>
                            <a id="export-csv" class="dropdown-item"
                                href="{{ route('admin.category.export-packages', ['type' => 'csv', request()->getQueryString()]) }}">
                                <img class="avatar avatar-xss avatar-4by3 mr-2"
                                    src="{{ asset('public/assets/admin') }}/svg/components/placeholder-csv-format.svg"
                                    alt="Image Description">
                                .{{ translate('messages.csv') }}
                            </a> --}}

                        </div>
                    </div>
                    <!-- End Unfold -->
                </div>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive datatable-custom">
                    <table id="columnSearchDatatable"
                        class="table table-borderless table-thead-bordered table-align-middle"
                        data-hs-datatables-options='{
                            "isResponsive": false,
                            "isShowPaging": false,
                            "paging":false,
                        }'>
                        <thead class="thead-light">
                            <tr>
                                <th class="border-0">{{ translate('sl') }}</th>
                                <th class="border-0">{{ translate('messages.id') }}</th>
                                <th class="border-0 w--1">{{ translate('messages.name') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.module') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.price') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.discount') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.purchase_type') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.validity') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.details') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.status') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.action') }}</th>
                            </tr>
                        </thead>

                        <tbody id="table-div">
                            @foreach ($packages as $key => $package)
                                <tr>
                                    <td>{{ $key + $packages->firstItem() }}</td>
                                    <td>{{ $package->id }}</td>
                                    <td>
                                        <span class="d-block font-size-sm text-body">
                                            {{ Str::limit($package['name'], 20, '...') }}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="d-block font-size-sm text-body text-center">
                                            {{ Str::limit($package->module->module_name, 15, '...') }}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="d-block font-size-sm text-body text-center">
                                            {{ $package->price." ".$package->currency }}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="d-block font-size-sm text-body text-center">
                                            {{ $package->discount_type=='Percent'?$package->discount." %":$package->discount }}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="d-block font-size-sm text-light badge badge-{{ $package->purchase_type=='Free'?'success':'danger' }} text-center">
                                            {{ $package->purchase_type }}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="d-block font-size-sm text-body text-center">
                                            {{ $package->validity.' '.translate('messages.days') }}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="d-block font-size-sm text-body text-center">
                                            {!! $package->details !!}
                                        </span>
                                    </td>
                                    <td>
                                        <label class="toggle-switch toggle-switch-sm"
                                            for="stocksCheckbox{{ $package->id }}">
                                            <input type="checkbox"
                                                onclick="location.href='{{ route('subscription.packages.status', [$package->status==1 ? 0 : 1, $package['id']]) }}'"class="toggle-switch-input"
                                                id="stocksCheckbox{{ $package->id }}"
                                                {{ $package->status==1 ? 'checked' : '' }}>
                                            <span class="toggle-switch-label mx-auto">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </td>
                                    
                                    
                                    <td>
                                        <div class="btn--container justify-content-center">
                                            <a class="btn action-btn btn--primary btn-outline-primary"
                                                href="{{ route('subscription.packages.index', [$package['id']]) }}"
                                                title="{{ translate('messages.edit_package') }}"><i
                                                    class="tio-edit"></i>
                                            </a>
                                            <a class="btn action-btn btn--danger btn-outline-danger" href="javascript:"
                                                onclick="form_alert('category-{{ $package['id'] }}','{{ translate('Want to delete this package ?') }}')"
                                                title="{{ translate('messages.delete_category') }}"><i
                                                    class="tio-delete-outlined"></i>
                                            </a>
                                            <form action="{{ route('subscription.packages.delete', [$package['id']]) }}"
                                                method="post" id="category-{{ $package['id'] }}">
                                                @csrf @method('delete')
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            @if (count($packages) !== 0)
                <hr>
            @endif
            <div class="page-area">
                {!! $packages->appends($_GET)->links() !!}
            </div>
            @if (count($packages) === 0)
                <div class="empty--data">
                    <img src="{{ asset('/public/assets/admin/svg/illustrations/sorry.svg') }}" alt="public">
                    <h5>
                        {{ translate('no_data_found') }}
                    </h5>
                </div>
            @endif
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
        $(document).on('ready', function() {
            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function() {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
        });
    </script>

    <script>
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
        $("#customFileEg2").change(function() {
            // readURL(this);
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
                $(".from_part_2").removeClass('d-none');
            } else {
                $(".from_part_2").addClass('d-none');
            }
        });
    </script>
    <script>
        $('#reset_btn').click(function() {
            $('#module_id').val(null).trigger('change');
            $('#viewer').attr('src', "{{ asset('public/assets/admin/img/900x400/img1.jpg') }}");
        })

    </script>
@endpush
