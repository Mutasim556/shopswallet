@extends('layouts.admin.app')

@section('title', translate('messages.Employees'))

@push('css_or_js')
    <link href="{{ asset('public/assets/admin/css/tags-input.min.css') }}" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
@endpush

@section('content')
    <div class="modal fade" id="add-user-modal" tabindex="-1" aria-labelledby="bs-example-modal-lg" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header d-flex align-items-center" style="border-bottom:1px dashed gray">
                    <h4 class="modal-title" id="myLargeModalLabel">
                        {{ translate('Add User') }}
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                </div>

                <p class="px-5 text-danger"><i>{{ translate('The field labels marked with * are required input fields.') }}</i>
                </p>
                <div class="modal-body" style="margin-top: -20px">
                    <form method="POST" action="{{ route('admin.business-settings.employee.employeeStore') }}" enctype="multipart/form-data" id="add_user_form">
                        @csrf
                        <div class="row g-3">
                            <div class="col-md-8">
                                <div class="row g-3">
                                    <div class="col-sm-6">
                                        <label class="input-label qcont" for="fname">{{translate('messages.first_name')}}</label>
                                        <input type="text" name="f_name" class="form-control" id="fname"
                                            placeholder="{{translate('messages.first_name')}}" value="{{old('f_name')}}" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="input-label qcont" for="lname">{{translate('messages.last_name')}}</label>
                                        <input type="text" name="l_name" class="form-control" id="lname" value="{{old('l_name')}}"
                                            placeholder="{{translate('messages.last_name')}}" value="{{old('name')}}" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <div >
                                            <label class="input-label" for="title">{{translate('messages.zone')}}</label>
                                            <select name="zone_id" id="zone_id" class="form-control js-select2-custom" >
                                                @if(!isset(auth('admin')->user()->zone_id))
                                                <option value="" {{!isset($e->zone_id)?'selected':''}}>{{translate('messages.all')}}</option>
                                                @endif
                                                @php($zones=\App\Models\Zone::all())
                                                @foreach($zones as $zone)
                                                    <option value="{{$zone['id']}}">{{$zone['name']}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div >
                                            <label class="input-label qcont" for="role_id">{{translate('messages.Role')}}</label>
                                            <select class="form-control js-select2-custom w-100" name="role_id" id="role_id" required>
                                                <option value="" selected disabled>{{translate('messages.select_Role')}}</option>
                                                @foreach($roles as $role)
                                                    <option value="{{$role->id}}">{{$role->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="input-label qcont" for="phone">{{translate('messages.phone')}}</label>
                                        <input type="number" name="phone" value="{{old('phone')}}" class="form-control" id="phone"
                                                placeholder="{{ translate('messages.Ex:') }} +88017********" required>
                                        </div>
                                    </div>
                                </div>
                            <div class="col-md-4">
                                <label class="h-100 d-flex flex-column">
                                    <center class="py-3 my-auto">
                                        <img class="img--100" id="viewer"
                                        src="{{asset('public\assets\admin\img\400x400\img2.jpg')}}" alt="Employee thumbnail"/>
                                    </center>
                                    <div class="custom-file">
                                        <input type="file" name="image" id="customFileUpload" class="custom-file-input"
                                            accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" value="{{old('image')}}" required>
                                        <div class="custom-file-label">{{translate('messages.choose_file')}}</div>
                                    </div>
                                </label>
                            </div>
                        </div>
                        <div class="row g-3 my-3">
                            <div class="col-md-4">
                                <label class="input-label qcont" for="email">{{translate('messages.email')}}</label>
                                <input type="email" name="email" value="{{old('email')}}" class="form-control" id="email"
                                        placeholder="{{ translate('messages.Ex:') }} ex@gmail.com" required>
                            </div>
                            <div class="col-md-4">
                                <div class="js-form-message form-group mb-0">
                                    <label class="input-label" for="signupSrPassword">{{translate('messages.password')}}<span class="form-label-secondary" data-toggle="tooltip" data-placement="right" data-original-title="{{ translate('messages.Must_contain_at_least_one_number_and_one_uppercase_and_lowercase_letter_and_symbol,_and_at_least_8_or_more_characters') }}"><img src="{{ asset('/public/assets/admin/img/info-circle.svg') }}" alt="{{ translate('messages.Must_contain_at_least_one_number_and_one_uppercase_and_lowercase_letter_and_symbol,_and_at_least_8_or_more_characters') }}"></span></label>
        
                                    <div class="input-group input-group-merge">
                                        <input type="password" class="js-toggle-password form-control" name="password" id="signupSrPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="{{ translate('messages.Must_contain_at_least_one_number_and_one_uppercase_and_lowercase_letter_and_symbol,_and_at_least_8_or_more_characters') }}"
                                        placeholder="{{ translate('messages.password_length_placeholder', ['length' => '8+']) }}"
                                        aria-label="8+ characters required"required
                                        data-msg="Your password is invalid. Please try again."
                                        data-hs-toggle-password-options='{
                                        "target": [".js-toggle-password-target-1", ".js-toggle-password-target-2"],
                                        "defaultClass": "tio-hidden-outlined",
                                        "showClass": "tio-visible-outlined",
                                        "classChangeTarget": ".js-toggle-passowrd-show-icon-1"
                                        }'>
                                        <div class="js-toggle-password-target-1 input-group-append">
                                            <a class="input-group-text" href="javascript:;">
                                                <i onclick="pass_show('signupSrPassword')" class="js-toggle-passowrd-show-icon-1 tio-visible-outlined"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="js-form-message form-group mb-0">
                                    <label class="input-label" for="signupSrConfirmPassword">{{translate('messages.confirm_password')}}</label>
                                    <div class="input-group input-group-merge">
                                    <input type="password" class="js-toggle-password form-control" name="confirmPassword" id="signupSrConfirmPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="{{ translate('messages.Must_contain_at_least_one_number_and_one_uppercase_and_lowercase_letter_and_symbol,_and_at_least_8_or_more_characters') }}"
                                    placeholder="{{ translate('messages.password_length_placeholder', ['length' => '8+']) }}"
                                    aria-label="8+ characters required" required
                                            data-msg="Password does not match the confirm password."
                                            data-hs-toggle-password-options='{
                                            "target": [".js-toggle-password-target-1", ".js-toggle-password-target-2"],
                                            "defaultClass": "tio-hidden-outlined",
                                            "showClass": "tio-visible-outlined",
                                            "classChangeTarget": ".js-toggle-passowrd-show-icon-2"
                                            }'>
                                        <div class="js-toggle-password-target-2 input-group-append">
                                            <a class="input-group-text" href="javascript:;">
                                            <i onclick="pass_show('signupSrConfirmPassword')" class="js-toggle-passowrd-show-icon-2 tio-visible-outlined"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-4">
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
    {{-- Edit user modal --}}
    <div class="modal fade" id="edit-user-modal" tabindex="-1" aria-labelledby="bs-example-modal-lg" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header d-flex align-items-center" style="border-bottom:1px dashed gray">
                    <h4 class="modal-title" id="myLargeModalLabel">
                        {{ translate('Edit User') }}
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                </div>

                <p class="px-5 text-danger"><i>{{ translate('The field labels marked with * are required input fields.') }}</i>
                </p>
                <div class="modal-body" style="margin-top: -20px">
                    <form method="POST" action="{{ route('admin.business-settings.employee.employeeStore') }}" enctype="multipart/form-data" id="add_user_form">
                        @csrf
                        <div class="row g-3">
                            <div class="col-md-12">
                                <div class="row g-3">
                                    <div class="col-sm-6">
                                        <label class="input-label qcont" for="fname">{{translate('messages.first_name')}}</label>
                                        <input type="text" name="f_name" class="form-control" id="fname"
                                            placeholder="{{translate('messages.first_name')}}" value="{{old('f_name')}}" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="input-label qcont" for="lname">{{translate('messages.last_name')}}</label>
                                        <input type="text" name="l_name" class="form-control" id="lname" value="{{old('l_name')}}"
                                            placeholder="{{translate('messages.last_name')}}" value="{{old('name')}}" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <div >
                                            <label class="input-label" for="title">{{translate('messages.zone')}}</label>
                                            <select name="zone_id" id="zone_id" class="form-control js-select2-custom" >
                                                @if(!isset(auth('admin')->user()->zone_id))
                                                <option value="" {{!isset($e->zone_id)?'selected':''}}>{{translate('messages.all')}}</option>
                                                @endif
                                                @php($zones=\App\Models\Zone::all())
                                                @foreach($zones as $zone)
                                                    <option value="{{$zone['id']}}">{{$zone['name']}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div >
                                            <label class="input-label qcont" for="role_id">{{translate('messages.Role')}}</label>
                                            <select class="form-control js-select2-custom w-100" name="role_id" id="role_id" required>
                                                <option value="" selected disabled>{{translate('messages.select_Role')}}</option>
                                                @foreach($roles as $role)
                                                    <option value="{{$role->id}}">{{$role->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="input-label qcont" for="phone">{{translate('messages.phone')}}</label>
                                        <input type="number" name="phone" value="{{old('phone')}}" class="form-control" id="phone"
                                                placeholder="{{ translate('messages.Ex:') }} +88017********" required>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        
                        <div class="row mt-4">
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
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-header-title">
                <span class="page-header-icon">
                    <img src="{{ asset('public/assets/admin/img/category.png') }}" class="w--20" alt="">
                </span>
                <span>
                    {{ isset($employee)?translate('update_employee'):translate('employee_list') }}
                </span>
                @if (hasPermission(['employee-create']))
                <div class="col-md-2">
                    <button class="btn btn-primary ml-4" type="btn" data-toggle="modal"
                    data-target="#add-user-modal">+  {{ translate('add_new_employee') }}</button>
                </div>
                @endif
                @if (hasPermission(['employee-create']))
                <div class="col-md-3">
                    <button class="btn btn-success" type="btn" data-toggle="modal"
                    data-target="#add-user-modal">+  {{ translate('Give employee a specific permission') }}</button>
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
                    <h5 class="card-title">{{ translate('messages.employee_list') }}<span
                            class="badge badge-soft-dark ml-2" id="itemCount">{{ count($employees) }}</span></h5>
                    <form class="search-form">

                        <!-- Search -->
                        <div class="input-group input--group">
                            <input type="search" name="search" value="{{ request()?->search ?? null }}"
                                class="form-control min-height-45"
                                placeholder="{{ translate('messages.search_employee') }}"
                                aria-label="{{ translate('messages.ex_:_employee') }}">
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
                                href="{{ route('admin.category.export-employees', ['type' => 'excel', request()->getQueryString()]) }}">
                                <img class="avatar avatar-xss avatar-4by3 mr-2"
                                    src="{{ asset('public/assets/admin') }}/svg/components/excel.svg"
                                    alt="Image Description">
                                {{ translate('messages.excel') }}
                            </a>
                            <a id="export-csv" class="dropdown-item"
                                href="{{ route('admin.category.export-employees', ['type' => 'csv', request()->getQueryString()]) }}">
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
                        class="table table-bordered table-thead-bordered table-align-middle"
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
                                <th class="border-0 text-center">{{ translate('messages.email') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.phone') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.role') }}</th>
                                <th class="border-0 text-center">{{ translate('messages.action') }}</th>
                            </tr>
                        </thead>

                        <tbody id="table-div">
                            @foreach ($employees as $key => $employee)
                                <tr>
                                    <td>{{ $key + 1 }}</td>
                                    <td>{{ $employee->id }}</td>
                                    <td>{{ $employee->name }}</td>
                                    <td>{{ $employee->email }}</td>
                                    <td>{{ $employee->phone }}</td>
                                    <td>{{ $employee->getRoleNames()->first() }}</td>
                                    <td>
                                        @if ($employee->getRoleNames()->first()==='Master admin')
                                            <span class="badge badge-danger">{{ translate('No Action') }}</span>
                                        @else
                                            @if (hasPermission(['role-update']))
                                                <button id="edit_button" data-toggle="modal" style="cursor: pointer;" data-target="#edit-user-modal" class="btn btn-primary px-1 py-1"><i class="tio-edit"></i></button>
                                            @endif
                                            @if (hasPermission(['role-delete']))
                                                <button class="btn btn-danger px-1 py-1" href="javascript:" onclick="form_alert('employee-{{$employee->id}}','{{translate('messages.Want_to_delete_this_item')}}')" title="{{translate('messages.delete_item')}}"><i class="tio-delete-outlined"></i></button>
                                                <form action="{{route("admin.business-settings.employee.employeeRoleEdit",[$employee->id])}}"
                                                        method="post" id="employee-{{$employee->id}}">
                                                    @csrf @method('delete')
                                                </form>
                                            @endif
                                        @endif 
                                    </td>
                                    
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            @if (count($employees) !== 0)
                <hr>
            @endif
            <div class="page-area">
                {!! $employees->appends($_GET)->links() !!}
            </div>
            @if (count($employees) === 0)
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
                    placeholder: '{{ translate("messages.employee_details") }}'
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

            $('.js-validate').each(function() {
                $.HSCore.components.HSValidation.init($(this), {
                rules: {
                    confirmPassword: {
                    equalTo: '#signupSrPassword'
                    }
                }
                });
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

       function pass_show(x){
            if($('#'+x).attr('type')=='password'){
                $('#'+x).attr('type','text');
            }else{
                $('#'+x).attr('type','password');
            }
       }

       function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#viewer').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileUpload").change(function () {
            readURL(this);
        });

        $(".js-example-theme-single").select2({
            theme: "classic"
        });

        $(".js-example-responsive").select2({
            width: 'resolve'
        });


        // $('#add_user_form').submit(function(e){
        //     e.preventDefault();
        //     $('button[type=submit]','#add_user_form').text('{{ translate("Submitting.....") }}');
        //     var formData = new FormData(this);
        //     console.log(formData);
        // })

    </script>
@endpush
