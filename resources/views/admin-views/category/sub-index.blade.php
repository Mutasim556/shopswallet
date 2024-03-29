@extends('layouts.admin.app')

@section('title', translate('messages.Add new sub category'))

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-header-title">
                <span class="page-header-icon">
                    <img src="{{ asset('public/assets/admin/img/edit.png') }}" class="w--20" alt="">
                </span>
                <span>
                    {{ translate('messages.add_new_sub_category') }}
                </span>
            </h1>
        </div>
        <!-- End Page Header --> 
        <div class="card">
            <div class="card-body">
                <form
                    action="{{ isset($category) ? route('admin.category.update', [$category['id']]) : route('admin.category.store') }}"
                    method="post"  enctype="multipart/form-data">
                    @csrf
                    @php($language = \App\Models\BusinessSetting::where('key', 'language')->first())
                    @php($language = $language->value ?? null)
                    @php($default_lang = str_replace('_', '-', app()->getLocale()))
                    @if ($language)
                        @php($default_lang = json_decode($language)[0])
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
                        <div class="form-group lang_form" id="default-form">
                            <label class="input-label" for="exampleFormControlInput1">{{ translate('messages.name') }}
                                ({{ translate('messages.default') }})</label>
                            <input type="text" name="name[]" class="form-control"
                                placeholder="{{ translate('messages.new_sub_category') }}" maxlength="191"
                                oninvalid="document.getElementById('en-link').click()">
                        </div>
                        <input type="hidden" name="lang[]" value="default">
                        @foreach (json_decode($language) as $lang)
                            <div class="form-group d-none lang_form" id="{{ $lang }}-form">
                                <label class="input-label" for="exampleFormControlInput1">{{ translate('messages.name') }}
                                    ({{ strtoupper($lang) }})</label>
                                <input type="text" name="name[]" class="form-control"
                                    placeholder="{{ translate('messages.new_sub_category') }}" maxlength="191"
                                    oninvalid="document.getElementById('en-link').click()">
                            </div>
                            <input type="hidden" name="lang[]" value="{{ $lang }}">
                        @endforeach
                    @else
                        <div class="form-group">
                            <label class="input-label"
                                for="exampleFormControlInput1">{{ translate('messages.name') }}</label>
                            <input type="text" name="name" class="form-control"
                                placeholder="{{ translate('messages.new_sub_category') }}" value="{{ old('name') }}"
                                maxlength="191">
                        </div>
                        <input type="hidden" name="lang[]" value="default">
                    @endif
                    <div class="form-group">
                        <label class="input-label"
                            for="exampleFormControlSelect1">{{ translate('messages.main_category') }}
                            <span class="input-label-secondary">*</span></label>
                        <select id="exampleFormControlSelect1" name="parent_id" class="form-control js-select2-custom"
                            required>
                            <option value="" selected disabled>{{ translate('Select Main Category') }}</option>
                            @foreach (\App\Models\Category::with('module')->where(['position' => 0])->module(Config::get('module.current_module_id'))->get() as $cat)
                                <option value="{{ $cat['id'] }}"
                                    {{ isset($category) ? ($category['parent_id'] == $cat['id'] ? 'selected' : '') : '' }}>
                                    {{ $cat['name'] }} ({{ Str::limit($cat->module->module_name, 15, '...') }})</option>
                            @endforeach
                        </select>
                    </div>
                    @php($mod_check = DB::table('modules')->where('id', session()->get('current_module'))->first())
                    @if ($mod_check->module_type == 'services' || $mod_check->module_type == 'booking')
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
                                    <label class="mt-4">{{ translate('messages.video') }} </label>
                                    <div class="custom-file">
                                        <input type="file" name="video" id="customFileEg2" class="custom-file-input"
                                            accept="video/*">
                                        <label class="custom-file-label"
                                            for="customFileEg2">{{ translate('messages.choose_file') }}</label>
                                    </div>
                            </div>
                        </div>
                    @endif
                    <input name="position" value="1" hidden>


                    <div class="btn--container justify-content-end mt-3">
                        <button type="reset" id="reset_btn"
                            class="btn btn--reset">{{ translate('messages.reset') }}</button>
                        <button type="submit"
                            class="btn btn--primary">{{ isset($category) ? translate('messages.update') : translate('messages.add') }}</button>
                    </div>

                </form>
            </div>
        </div>
        <div class="card mt-2">
            <div class="card-header py-2 border-0">
                <div class="search--button-wrapper">
                    <h5 class="card-title">{{ translate('messages.sub_category_list') }}<span
                            class="badge badge-soft-dark ml-2" id="itemCount">{{ $categories->total() }}</span></h5>
                    <form class="search-form">
                        <!-- Search -->
                        <div class="input-group input--group">
                            <input id="datatableSearch" name="search" value="{{ request()?->search ?? null }}"
                                type="search" class="form-control"
                                placeholder="{{ translate('messages.ex_:_search_sub_categories') }}"
                                aria-label="{{ translate('messages.ex_:_sub_categories') }}">
                            <input type="hidden" name="sub_category" value="1">
                            <button type="submit" class="btn btn--secondary"><i class="tio-search"></i></button>
                        </div>
                        <!-- End Search -->
                    </form>
                    <!-- Unfold -->
                    {{-- <div class="hs-unfold mr-2">
                        <a class="js-hs-unfold-invoker btn btn-sm btn-white dropdown-toggle min-height-40" href="javascript:;"
                            data-hs-unfold-options='{
                                    "target": "#usersExportDropdown",
                                    "type": "css-animation"
                                }'>
                            <i class="tio-download-to mr-1"></i> {{ translate('messages.export') }}
                        </a>

                        <div id="usersExportDropdown"
                            class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-sm-right">
                            <span class="dropdown-header">{{ translate('messages.options') }}</span>
                            <a id="export-copy" class="dropdown-item" href="javascript:;">
                                <img class="avatar avatar-xss avatar-4by3 mr-2"
                                    src="{{ asset('public/assets/admin') }}/svg/illustrations/copy.svg"
                                    alt="Image Description">
                                {{ translate('messages.copy') }}
                            </a>
                            <a id="export-print" class="dropdown-item" href="javascript:;">
                                <img class="avatar avatar-xss avatar-4by3 mr-2"
                                    src="{{ asset('public/assets/admin') }}/svg/illustrations/print.svg"
                                    alt="Image Description">
                                {{ translate('messages.print') }}
                            </a>
                            <div class="dropdown-divider"></div>
                            <span class="dropdown-header">{{ translate('messages.download_options') }}</span>
                            <a id="export-excel" class="dropdown-item" href="javascript:;">
                                <img class="avatar avatar-xss avatar-4by3 mr-2"
                                    src="{{ asset('public/assets/admin') }}/svg/components/excel.svg"
                                    alt="Image Description">
                                {{ translate('messages.excel') }}
                            </a>
                            <a id="export-csv" class="dropdown-item" href="javascript:;">
                                <img class="avatar avatar-xss avatar-4by3 mr-2"
                                    src="{{ asset('public/assets/admin') }}/svg/components/placeholder-csv-format.svg"
                                    alt="Image Description">
                                .{{ translate('messages.csv') }}
                            </a>
                            <a id="export-pdf" class="dropdown-item" href="javascript:;">
                                <img class="avatar avatar-xss avatar-4by3 mr-2"
                                    src="{{ asset('public/assets/admin') }}/svg/components/pdf.svg"
                                    alt="Image Description">
                                {{ translate('messages.pdf') }}
                            </a>
                        </div>
                    </div> --}}
                    <!-- End Unfold -->
                </div>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive datatable-custom">
                    <table id="columnSearchDatatable"
                        class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                        data-hs-datatables-options='{
                            "search": "#datatableSearch",
                            "entries": "#datatableEntries",
                            "isResponsive": false,
                            "isShowPaging": false,
                            "paging":false,
                        }'>
                        <thead class="thead-light">
                            <tr>
                                <th class="border-0">{{ translate('sl') }}</th>
                                <th class="border-0">{{ translate('messages.id') }}</th>
                                <th class="border-0 w--1">{{ translate('messages.main_category') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.sub_category') }}</th>
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
                                            {{ Str::limit($category->parent['name'], 20, '...') }}
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <span class="d-block font-size-sm text-body">
                                            {{ Str::limit($category->name, 20, '...') }}
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
                                            <select name="priority" id="priority" onchange="this.form.submit()"
                                                class="form-control form--control-select mx-auto {{ $category->priority == 0 ? 'text-title' : '' }} {{ $category->priority == 1 ? 'text-info' : '' }} {{ $category->priority == 2 ? 'text-success' : '' }}">
                                                <option value="0" {{ $category->priority == 0 ? 'selected' : '' }}>
                                                    {{ translate('messages.normal') }}</option>
                                                <option value="1" {{ $category->priority == 1 ? 'selected' : '' }}>
                                                    {{ translate('messages.medium') }}</option>
                                                <option value="2" {{ $category->priority == 2 ? 'selected' : '' }}>
                                                    {{ translate('messages.high') }}</option>
                                            </select>
                                        </form>
                                    </td>
                                    <td>
                                        <div class="btn--container justify-content-center">
                                            <a class="btn action-btn btn--primary btn-outline-primary"
                                                href="{{ route('admin.category.edit', [$category['id'],'Sub Category']) }}"
                                                title="{{ translate('messages.edit_category') }}"><i
                                                    class="tio-edit"></i>
                                            </a>
                                            <a class="btn action-btn btn--danger btn-outline-danger" href="javascript:"
                                                onclick="form_alert('category-{{ $category['id'] }}','{{ translate('messages.Want to delete this category') }}')"
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
                {!! $categories->links() !!}
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
        $(document).on('ready', function() {
            // INITIALIZATION OF DATATABLES
            // =======================================================



            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function() {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
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
                $(".from_part_2").removeClass('d-none');
            } else {
                $(".from_part_2").addClass('d-none');
            }
        });
    </script>
    <script>
        $('#reset_btn').click(function() {
            $('#exampleFormControlSelect1').val(null).trigger('change');
        })
    </script>
@endpush
