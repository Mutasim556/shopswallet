@extends('layouts.admin.app')

@section('title', translate('messages.time slot'))

@push('css_or_js')
{{-- <script src="https://kit.fontawesome.com/2adbe48dfe.js" crossorigin="anonymous"></script> --}}

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
                    {{ translate('view_time_slot') }}
                </span>
            </h1>
        </div>
        <!-- End Page Header -->

        <div class="card mt-3">
            <div class="card-header py-2 border-0">
                <div class="search--button-wrapper">
                    <h5 class="card-title">{{ translate('messages.category_list') }}<span
                            class="badge badge-soft-dark ml-2" id="itemCount">{{ $timeslots->total() }}</span></h5>
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
                                placeholder="{{ translate('messages.search_timeslots') }}"
                                aria-label="{{ translate('messages.ex_:_timeslots') }}">
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
                                <th class="border-0" >{{ translate('messages.id') }}</th>
                                <th class="border-0 w--1">{{ translate('messages.category') }}</th>
                                <th class="border-0 w--1">{{ translate('messages.current_or_next_date?') }}</th>
                                <th class="border-0 w--1">{{ translate('messages.added_days') }}</th>
                                <th class="border-0 w--3 text-center">{{ translate('messages.selected_slots') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.status') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.action') }}</th>
                            </tr>
                        </thead>

                        <tbody id="table-div">
                            @foreach ($timeslots as $key => $timeslot)
                                <tr>
                                    <td>{{ $key + $timeslots->firstItem() }}</td>
                                    <td>{{ $timeslot->id }}</td>
                                    <td>
                                        <span class="d-block font-size-sm text-body">
                                            {{ Str::limit($timeslot->category->name, 20, '...') }}
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <span class="badge badge-{{ $timeslot->dstatus==1?'primary':'warning'}}">{{ $timeslot->dstatus==1?translate('messages.Current'):translate('messages.Next') }}</span>
                                    </td>
                                    <td class="text-center">
                                        {{ $timeslot->days }}
                                    </td>
                                    <td class="text-center">
                                        {{ $timeslot->timeslots }}
                                    </td>
                                    <td>
                                        <label class="toggle-switch toggle-switch-sm"
                                            for="stocksCheckbox{{ $timeslot->id }}">
                                            <input type="checkbox"
                                                onclick="location.href='{{ route('admin.service.time-and-slot.changeStatus', [$timeslot['id'], $timeslot->status==1 ? 0 : 1]) }}'"
                                                class="toggle-switch-input" id="stocksCheckbox{{ $timeslot->id }}"
                                                {{ $timeslot->status==1 ? 'checked' : '' }}>
                                            <span class="toggle-switch-label mx-auto">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </td>

                                    <td>
                                        <div class="btn--container justify-content-center">
                                            <a class="btn action-btn btn--primary btn-outline-primary"
                                                href="{{ route('admin.service.time-and-slot.edit',[$timeslot['id']]) }}"
                                                title="{{ translate('messages.edit_timeslot') }}"><i
                                                    class="tio-edit"></i>
                                            </a>
                                            <a class="btn action-btn btn--danger btn-outline-danger" href="javascript:"
                                                onclick="form_alert('timeslot-{{ $timeslot['id'] }}','{{ translate('Want to delete this timeslot') }}')"
                                                title="{{ translate('messages.delete_timeslot') }}"><i
                                                    class="tio-delete-outlined"></i>
                                            </a>
                                            <form action="{{ route('admin.service.time-and-slot.destroy', [$timeslot['id']]) }}"
                                                method="post" id="timeslot-{{ $timeslot['id'] }}">
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
            @if (count($timeslots) !== 0)
                <hr>
            @endif
            <div class="page-area">
                {!! $timeslots->appends($_GET)->links() !!}
            </div>
            @if (count($timeslots) === 0)
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
        $('#reset_btn').click(function() {
            $('#module_id').val(null).trigger('change');
            $('#viewer').attr('src', "{{ asset('public/assets/admin/img/900x400/img1.jpg') }}");
        })
    </script>

    <script>
        $('#plus_timeslot').on('click',function(){
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

        $(document).on('click','#del_timeslot',function(){
            $(this).closest('#new_append').remove();
        });
    </script>
@endpush
