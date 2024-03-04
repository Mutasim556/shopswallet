@extends('layouts.admin.app')

@section('title', translate('messages.Add new city'))

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
                    {{ translate('add_new_city') }}
                </span>
            </h1>
        </div>
        <!-- End Page Header -->

        <div class="card">
            <div class="card-body">
                <form
                    action="{{ isset($category) ? route('admin.service.city.update', [$category['id']]) : route('admin.service.city.store') }}"
                    method="post">
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
                                        placeholder="{{ translate('messages.new_city') }}" maxlength="191"
                                        oninvalid="document.getElementById('en-link').click()">
                                    {{-- {{ session()->get('current_module') }} --}}


                                </div>
                                <input type="hidden" name="lang[]" value="default">
                                @foreach (json_decode($language) as $lang)
                                    <div class="form-group d-none lang_form" id="{{ $lang }}-form">
                                        <label class="input-label"
                                            for="exampleFormControlInput1">{{ translate('messages.name') }}
                                            ({{ strtoupper($lang) }})
                                        </label>
                                        <input type="text" name="name[]" class="form-control"
                                            placeholder="{{ translate('messages.new_city') }}" maxlength="191"
                                            oninvalid="document.getElementById('en-link').click()">


                                    </div>
                                    <input type="hidden" name="lang[]" value="{{ $lang }}">
                                @endforeach
                            @else
                                <div class="form-group">
                                    <label class="input-label"
                                        for="exampleFormControlInput1">{{ translate('messages.name') }}</label>
                                    <input type="text" name="name" class="form-control"
                                        placeholder="{{ translate('messages.new_city') }}" value="{{ old('name') }}"
                                        maxlength="191">
                                </div>
                                <input type="hidden" name="lang[]" value="default">
                            @endif
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
                            class="badge badge-soft-dark ml-2" id="itemCount">{{ $cities->total() }}</span></h5>
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
                                <th class="border-0 text-center">{{ translate('messages.status') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.action') }}</th>
                            </tr>
                        </thead>

                        <tbody id="table-div">
                            @foreach ($cities as $key => $city)
                                <tr>
                                    <td>{{ $key + $cities->firstItem() }}</td>
                                    <td>{{ $city->id }}</td>
                                    <td>
                                        <span class="d-block font-size-sm text-body">
                                            {{ Str::limit($city['name'], 20, '...') }}
                                        </span>
                                    </td>

                                    <td>
                                        <label class="toggle-switch toggle-switch-sm"
                                            for="stocksCheckbox{{ $city->id }}">
                                            <input type="checkbox"
                                                onclick="location.href='{{ route('admin.service.city.status', [$city['id'], $city->status==1 ? 0 : 1]) }}'"
                                                class="toggle-switch-input" id="stocksCheckbox{{ $city->id }}"
                                                {{ $city->status ? 'checked' : '' }}>
                                            <span class="toggle-switch-label mx-auto">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </td>

                                    <td>
                                        <div class="btn--container justify-content-center">
                                            <a class="btn action-btn btn--primary btn-outline-primary"
                                                href="{{ route('admin.service.city.edit',[$city['id']]) }}"
                                                title="{{ translate('messages.edit_city') }}"><i
                                                    class="tio-edit"></i>
                                            </a>
                                            <a class="btn action-btn btn--danger btn-outline-danger" href="javascript:"
                                                onclick="form_alert('category-{{ $city['id'] }}','{{ translate('Want to delete this category') }}')"
                                                title="{{ translate('messages.delete_category') }}"><i
                                                    class="tio-delete-outlined"></i>
                                            </a>
                                            <form action="{{ route('admin.service.city.destroy', [$city['id']]) }}"
                                                method="post" id="category-{{ $city['id'] }}">
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
            @if (count($cities) !== 0)
                <hr>
            @endif
            <div class="page-area">
                {!! $cities->appends($_GET)->links() !!}
            </div>
            @if (count($cities) === 0)
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
