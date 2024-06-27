@extends('layouts.admin.app')

@section('title', translate('messages.Packages'))

@push('css_or_js')
    <link href="{{ asset('public/assets/admin/css/tags-input.min.css') }}" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
@endpush

@section('content')

{{-- Add role Modal Start --}}

    <div class="modal fade" id="add-role-modal" tabindex="-1" aria-labelledby="bs-example-modal-lg" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header bg-success py-2">
                    <h5 class="modal-title" id="exampleModalLabel">{{ translate('messages.Create Role') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <p class="px-5 text-danger"><i>{{ translate('The field labels marked with * are required input fields.') }}</i>
                </p>
                <div class="modal-body" style="margin-top: -20px">
                    <form action="" id="add_role_form">
                        @csrf
                        <div class="row">
                            <div class="col-lg-12 mt-2">
                                <label for="role_name" style="font-size: 15px;font-weight:600"><strong>{{ translate('Role Name') }} *</strong></label>
                                <input type="text" class="form-control" name="role_name" id="role_name">
                                <span class="text-danger err-mgs"></span>
                            </div>
                            @foreach ($permissions as $group=>$permission)
                                <div class="col-lg-12 mt-4">
                                    <label for="user_permission" style="font-size: 15px;color:blue;font-weight:600"><strong>{{ $group }}</strong></label><br>
                                    @foreach ($permission as $item)
                                        <input data-status="" id="permission-switch" type="checkbox" value="{{ $item->name }}" name="permissions[]"/>
                                        <span class="mx-2">{{ $item->name }}</span>
                                    @endforeach
                                </div>
                            @endforeach
                        </div>

                        <div class="row mt-4 mb-2">
                            <div class="form-group col-lg-12">

                                <button class="btn btn-danger text-white font-weight-medium waves-effect text-start"
                                    data-dismiss="modal" style="float: right"
                                    type="button">{{ translate('Close') }}</button>
                                <button class="btn btn-primary mx-2" style="float: right"
                                    type="submit">{{ translate('Submit') }}</button>
                            </div>

                        </div>
                    </form>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    {{-- Add role Modal End --}}
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-header-title">
                <span class="page-header-icon">
                    <img src="{{ asset('public/assets/admin/img/category.png') }}" class="w--20" alt="">
                </span>
                <span>
                    {{ isset($package)?translate('update_package'):translate('role_list') }} 
                </span>
                @if (hasPermission(['role-permission-create']))
                <div class="col-md-3">
                    <button class="btn btn-primary ml-4" type="btn" data-toggle="modal"
                        data-target="#add-role-modal">+  {{ translate('add_new_role') }}</button>
                </div>
                @endif
            </h1>
            
        </div>
        <!-- End Page Header -->
        @php($language = \App\Models\BusinessSetting::where('key', 'language')->first())
        @php($language = $language->value ?? null)
        @php($default_lang = str_replace('_', '-', app()->getLocale()))
        

        <div class="card mt-3">
            <div class="card-header py-2 border-0">
                <div class="search--button-wrapper">
                    <h5 class="card-title">{{ translate('messages.role_list') }}<span
                            class="badge badge-soft-dark ml-2" id="itemCount">{{ $roles->count() }}</span></h5>

                    <form class="search-form">

                        <!-- Search -->
                        <div class="input-group input--group">
                            <input type="search" name="search" value="{{ request()?->search ?? null }}"
                                class="form-control min-height-45"
                                placeholder="{{ translate('messages.search_role') }}"
                                aria-label="{{ translate('messages.ex_:_role') }}">
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
                                <th class="border-0" style="width: 5%">{{ translate('sl') }}</th>
                                <th class="border-0" style="width: 5%">{{ translate('messages.id') }}</th>
                                <th class="border-0 " style="width: 20%">{{ translate('messages.name') }}</th>
                                <th class="border-0 " style="width: 50%">{{ translate('messages.permissions') }}</th>
                                <th class="border-0 text-center" style="width: 20%">{{ translate('messages.action') }}</th>
                            </tr>
                        </thead>

                        <tbody id="table-div">
                            @foreach ($roles as $key => $role)
                                <tr>
                                    <td>{{ $key + 1 }}</td>
                                    <td>{{ $role->id }}</td>
                                    <td>
                                        {{ $role->name }}
                                    </td>
                                    <td>
                                        @if ($role->name==='Master admin')
                                        <span class="badge badge-info">{{ translate('All Permission') }}</span>
                                        @else
                                            @if (count($role->permissions)<1)
                                            <span class="badge badge-danger">{{ translate('No Permission') }}</span>
                                            @endif
                                            @foreach ($role->permissions as $permission)
                                                <span class="badge badge-success">{{ $permission->name }}</span>
                                            @endforeach
                                        @endif
                                    </td>
                                    
                                    
                                    <td>
                                        {{-- <div class="btn--container justify-content-center">
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
                                        </div> --}}
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            @if (count($roles) !== 0)
                <hr>
            @endif
            <div class="page-area">
                {!! $roles->appends($_GET)->links() !!}
            </div>
            @if (count($roles) === 0)
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


    <script>
        $(document).on('submit','#add_role_form',function(e){
            e.preventDefault();
            $("#add_role_form button[type=submit]").css({"pointer-events":"none"}).addClass('disabled').text("{{ translate('Submitting') }}....");
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                url: '{{ route("admin.business-settings.employee.employeeRoleAdd") }}',
                method:"post",
                data: $('#add_role_form').serialize(),
                success: function (data) {
                    $("#add_role_form button[type=submit]").css({"pointer-events":"auto"}).removeClass('disabled').text("{{ translate('Submit') }}");
                    swal({
                        icon: "success",
                        title: '{{ translate('Congratulations') }}',
                        text: '{{ translate('role created successfully') }}',
                        confirmButtonText: "Ok",
                    }).then(function(){
                        location.reload();
                    });
                },
                error: function(err){
                    swal({
                        icon: "error",
                        title: '{{ translate('Opps') }}',
                        text: err.responseJSON.message,
                        confirmButtonText: "Ok",
                    })
                    $("#add_role_form button[type=submit]").css({"pointer-events":"auto"}).removeClass('disabled').text("{{ translate('Submit') }}");
                }
            });
        })
    </script>
@endpush
