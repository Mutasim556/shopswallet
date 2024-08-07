@extends('layouts.admin.app')

@section('title', translate('messages.Add new category'))

@push('css_or_js')
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
                    {{ translate('add_new_category') }}
                </span>
            </h1>
        </div>
        <!-- End Page Header -->

        <div class="card">
            <div class="card-body">
                <form
                    action="{{ isset($category) ? route('admin.category.update', [$category['id']]) : route('admin.category.store') }}"
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


                            @if ($language)
                                <div class="form-group lang_form" id="default-form">
                                    <label class="input-label"
                                        for="exampleFormControlInput1">{{ translate('messages.name') }}
                                        ({{ translate('messages.default') }})</label>
                                    <input type="text" name="name[]" class="form-control"
                                        placeholder="{{ translate('messages.new_category') }}" maxlength="191"
                                        oninvalid="document.getElementById('en-link').click()">
                                    {{-- {{ session()->get('current_module') }} --}}
                                    @php($mod_check = DB::table('modules')->where('id', session()->get('current_module'))->first())
                                    @if ($mod_check && ($mod_check->module_type == 'services' || $mod_check->module_type == 'booking'))
                                        <label class="input-label mt-2"
                                            for="exampleFormControlInput1">{{ translate('messages.category_title') }}
                                            ({{ translate('messages.default') }})</label>
                                        <input type="text" name="category_title[]" class="form-control"
                                            placeholder="{{ translate('messages.new_category_title') }}" maxlength="191"
                                            oninvalid="document.getElementById('en-link').click()">
                                    @endif

                                </div>
                                <input type="hidden" name="lang[]" value="default">
                                @foreach (json_decode($language) as $lang)
                                    <div class="form-group d-none lang_form" id="{{ $lang }}-form">
                                        <label class="input-label"
                                            for="exampleFormControlInput1">{{ translate('messages.name') }}
                                            ({{ strtoupper($lang) }})
                                        </label>
                                        <input type="text" name="name[]" class="form-control"
                                            placeholder="{{ translate('messages.new_category') }}" maxlength="191"
                                            oninvalid="document.getElementById('en-link').click()">

                                        @if ($mod_check && ($mod_check->module_type == 'services' || $mod_check->module_type == 'booking'))
                                            <label class="input-label mt-2"
                                                for="exampleFormControlInput1">{{ translate('messages.category_title') }}
                                                ({{ translate('messages.default') }})</label>
                                            <input type="text" name="category_title[]" class="form-control"
                                                placeholder="{{ translate('messages.new_category_title') }}"
                                                maxlength="191" oninvalid="document.getElementById('en-link').click()">
                                        @endif

                                    </div>
                                    <input type="hidden" name="lang[]" value="{{ $lang }}">
                                @endforeach
                            @else
                                <div class="form-group">
                                    <label class="input-label"
                                        for="exampleFormControlInput1">{{ translate('messages.name') }}</label>
                                    <input type="text" name="name" class="form-control"
                                        placeholder="{{ translate('messages.new_category') }}" value="{{ old('name') }}"
                                        maxlength="191">
                                </div>
                                <input type="hidden" name="lang[]" value="default">
                            @endif
                            {{-- <div class="form-group mb-0 pt-md-4">
                                <label class="input-label">{{translate('messages.module')}}</label>
                                <select name="module_id" id="module_id" required class="form-control js-select2-custom"  data-placeholder="{{translate('messages.select_module')}}">
                                        <option value="" selected disabled>{{translate('messages.select_module')}}</option>
                                    @foreach (\App\Models\Module::notParcel()->get() as $module)
                                        <option value="{{$module->id}}" >{{$module->module_name}}</option>
                                    @endforeach
                                </select>
                                <small class="text-danger">{{translate('messages.module_change_warning')}}</small>
                            </div> --}}
                            <input name="position" value="0" class="initial-hidden">
                        </div>
                        <div class="col-md-12">
                            <div class="h-100 d-flex flex-column">
                                <label class="m-0">{{ translate('messages.image') }} <small class="text-danger">* (
                                        {{ translate('messages.ratio') }} 1:1)</small></label>
                                <center class="py-3 my-auto">
                                    <img class="img--100" id="viewer"
                                        @if (isset($category)) src="{{ asset('storage/app/public/category') }}/{{ $category['image'] }}"
                                        @else
                                        src="{{ asset('public/assets/admin/img/900x400/img1.jpg') }}" @endif
                                        alt="image" />
                                </center>
                                <div class="custom-file">
                                    <input type="file" name="image" id="customFileEg1" class="custom-file-input"
                                        accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" required>
                                    <label class="custom-file-label"
                                        for="customFileEg1">{{ translate('messages.choose_file') }}</label>
                                </div>


                                <small class="text-danger mt-1 d-none d-md-block">&nbsp;</small>

                                @if ($mod_check && ($mod_check->module_type == 'services' || $mod_check->module_type == 'booking'))
                                    <label class="mt-4">{{ translate('messages.video') }} </label>
                                    <div class="custom-file">
                                        <input type="file" name="video" id="customFileEg2" class="custom-file-input"
                                            accept="video/*" >
                                        <label class="custom-file-label"
                                            for="customFileEg2">{{ translate('messages.choose_file') }}</label>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="btn--container justify-content-end mt-3">
                        <button type="reset" id="reset_btn"
                            class="btn btn--reset">{{ translate('messages.reset') }}</button>
                        <button type="submit"
                            class="btn btn--primary">{{ isset($category) ? translate('messages.update') : translate('messages.add') }}</button>
                    </div>

                </form>
            </div>
        </div>

        <div class="card mt-3">
            <div class="card-header py-2 border-0">
                <div class="search--button-wrapper">
                    <h5 class="card-title">{{ translate('messages.category_list') }}<span
                            class="badge badge-soft-dark ml-2" id="itemCount">{{ $categories->total() }}</span></h5>
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
                                placeholder="{{ translate('messages.search_categories') }}"
                                aria-label="{{ translate('messages.ex_:_categories') }}">
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
                            <a id="export-excel" class="dropdown-item"
                                href="{{ route('admin.category.export-categories', ['type' => 'excel', request()->getQueryString()]) }}">
                                <img class="avatar avatar-xss avatar-4by3 mr-2"
                                    src="{{ asset('public/assets/admin') }}/svg/components/excel.svg"
                                    alt="Image Description">
                                {{ translate('messages.excel') }}
                            </a>
                            <a id="export-csv" class="dropdown-item"
                                href="{{ route('admin.category.export-categories', ['type' => 'csv', request()->getQueryString()]) }}">
                                <img class="avatar avatar-xss avatar-4by3 mr-2"
                                    src="{{ asset('public/assets/admin') }}/svg/components/placeholder-csv-format.svg"
                                    alt="Image Description">
                                .{{ translate('messages.csv') }}
                            </a>

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
                                <th class="border-0 text-center">{{ translate('messages.status') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.featured') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.priority') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.action') }}</th>
                            </tr>
                        </thead>

                        <tbody id="table-div">
                            @foreach ($categories as $key => $category)
                                <tr>
                                    <td>{{ $key + $categories->firstItem() }}</td>
                                    <td>{{ $category->id }}</td>
                                    <td>
                                        <span class="d-block font-size-sm text-body">
                                            {{ Str::limit($category['name'], 20, '...') }}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="d-block font-size-sm text-body text-center">
                                            {{ Str::limit($category->module->module_name, 15, '...') }}
                                        </span>
                                    </td>
                                    <td>
                                        <label class="toggle-switch toggle-switch-sm"
                                            for="stocksCheckbox{{ $category->id }}">
                                            <input type="checkbox"
                                                onclick="location.href='{{ route('admin.category.status', [$category['id'], $category->status ? 0 : 1]) }}'"class="toggle-switch-input"
                                                id="stocksCheckbox{{ $category->id }}"
                                                {{ $category->status ? 'checked' : '' }}>
                                            <span class="toggle-switch-label mx-auto">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="toggle-switch toggle-switch-sm"
                                            for="featuredCheckbox{{ $category->id }}">
                                            <input type="checkbox"
                                                onclick="location.href='{{ route('admin.category.featured', [$category['id'], $category->featured ? 0 : 1]) }}'"class="toggle-switch-input"
                                                id="featuredCheckbox{{ $category->id }}"
                                                {{ $category->featured ? 'checked' : '' }}>
                                            <span class="toggle-switch-label mx-auto">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </td>
                                    <td>
                                        <form action="{{ route('admin.category.priority', $category->id) }}">
                                            <select name="priority" id="priority"
                                                class="form-control form--control-select mx-auto {{ $category->priority == 0 ? 'text-title' : '' }} {{ $category->priority == 1 ? 'text-info' : '' }} {{ $category->priority == 2 ? 'text-success' : '' }} "
                                                onchange="this.form.submit()">
                                                <option value="0" class="text--title"
                                                    {{ $category->priority == 0 ? 'selected' : '' }}>
                                                    {{ translate('messages.normal') }}</option>
                                                <option value="1" class="text--title"
                                                    {{ $category->priority == 1 ? 'selected' : '' }}>
                                                    {{ translate('messages.medium') }}</option>
                                                <option value="2" class="text--title"
                                                    {{ $category->priority == 2 ? 'selected' : '' }}>
                                                    {{ translate('messages.high') }}</option>
                                            </select>
                                        </form>
                                    </td>
                                    <td>
                                        <div class="btn--container justify-content-center">
                                            <a class="btn action-btn btn--primary btn-outline-primary"
                                                href="{{ route('admin.category.edit', [$category['id'],'Category']) }}"
                                                title="{{ translate('messages.edit_category') }}"><i
                                                    class="tio-edit"></i>
                                            </a>
                                            <a class="btn action-btn btn--danger btn-outline-danger" href="javascript:"
                                                onclick="form_alert('category-{{ $category['id'] }}','{{ translate('Want to delete this category') }}')"
                                                title="{{ translate('messages.delete_category') }}"><i
                                                    class="tio-delete-outlined"></i>
                                            </a>
                                            <form action="{{ route('admin.category.delete', [$category['id']]) }}"
                                                method="post" id="category-{{ $category['id'] }}">
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
            @if (count($categories) !== 0)
                <hr>
            @endif
            <div class="page-area">
                {!! $categories->appends($_GET)->links() !!}
            </div>
            @if (count($categories) === 0)
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
