@extends('layouts.admin.app')

@section('title', translate('messages.purchase_request'))

@push('css_or_js')
    <link href="{{ asset('public/assets/admin/css/tags-input.min.css') }}" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
@endpush

@section('content')
    <div class="modal fade" id="purchaseModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success py-2">
                    <h5 class="modal-title" id="exampleModalLabel">{{ translate('messages.accept_request') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body px-3">
                    <form action="" id="payment_form" method="post">
                        <div class="form-group">
                            <label for="">{{ translate('messages.package_name') }}</label>
                            <input type="text" class="form-control" id="package_name" name="package_name" readonly>
                            <input type="hidden" class="form-control" id="package_id" name="package_id">
                            <input type="hidden" class="form-control" id="purchase_request_id" name="purchase_request_id">
                            <input type="hidden" class="form-control" id="vendor_id" name="vendor_id">
                        </div>
                        
                        <div class="form-group">
                            <label for="">{{ translate('messages.package_price') }}</label>
                            <input type="text" class="form-control" id="package_price" name="package_price" readonly>
                        </div>
                        <div class="form-group">
                            <label for="">{{ translate('messages.currency') }}</label>
                            <input type="text" class="form-control" id="currency" name="currency" readonly>
                        </div>
                        <div class="form-group">
                            <label for="">{{ translate('messages.payment_method') }}</label>
                            <input type="text" class="form-control" id="payment_method" name="payment_method" required>
                        </div>
                        <div class="form-group">
                            <label for="">{{ translate('messages.account_nunber') }}</label>
                            <input type="text" class="form-control" id="account_nunber" name="account_nunber" required>
                        </div>
                        <div class="form-group">
                            <label for="">{{ translate('messages.transaction_id') }}</label>
                            <input type="text" class="form-control" id="transaction_id" name="transaction_id" required>
                        </div>
                        <div class="form-group">
                            <label for="">{{ translate('messages.paid_amount') }}</label>
                            <input type="text" class="form-control" id="paid_amount" name="paid_amount" required>
                        </div>
                        <div class="modal-footer py-2">
                            <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">{{ translate('messages.close') }}</button>
                            <button type="submit" id="submitbutton" class="btn btn-success btn-sm">{{ translate('messages.approve_now') }}</button>
                        </div>
                    </form>
                </div>
                
            </div>
        </div>
    </div>
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-header-title">
                <span class="page-header-icon">
                    <img src="{{ asset('public/assets/admin/img/category.png') }}" class="w--20" alt="">
                </span>
                <span>
                    {{ translate('purchase_request') }}
                </span>
            </h1>
        </div>
        <!-- End Page Header -->

        @php($language = \App\Models\BusinessSetting::where('key', 'language')->first())
        @php($language = $language->value ?? null)
        @php($default_lang = str_replace('_', '-', app()->getLocale()))

        <div class="card mt-3">
            <div class="card-header py-2 border-0">
                <div class="search--button-wrapper">
                    <h5 class="card-title">{{ translate('messages.purchase_request') }}<span
                            class="badge badge-soft-dark ml-2" id="itemCount">{{ $purchases->total() }}</span></h5>
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
                                    <th class="border-0 w--1">{{ translate('messages.package_name') }}</th>
                                    <th class="border-0 text-center">{{ translate('messages.module') }}</th>
                                    <th class="border-0 text-center">{{ translate('messages.vendor_email') }}</th>
                                    <th class="border-0 text-center">{{ translate('messages.vendor_phone') }}</th>
                                    <th class="border-0 text-center">{{ translate('messages.paid_amount') }}</th>
                                    <th class="border-0 text-center">{{ translate('messages.purchase_type') }}</th>
                                    <th class="border-0 text-center">{{ translate('messages.purchase_date') }}</th>
                                    <th class="border-0 text-center">{{ translate('messages.expiry_date') }}</th>
                                    <th class="border-0 text-center">{{ translate('messages.status') }}</th>
                                    <th class="border-0 text-center">{{ translate('messages.action') }}</th>
                                </tr>
                            </thead>
    
                            <tbody id="table-div">
                                @foreach ($purchases as $key => $purchase)
                                <tr>
                                    <td class="text-center">{{ $key + 1 }}</td>
                                    <td class="text-center">{{ $purchase->subscription_package->name }}</td>
                                    <td class="text-center">{{ $purchase->subscription_package->module->module_name }}</td>
                                    <td class="text-center">{{ $purchase->vendor->email }}</td>
                                    <td class="text-center">{{ $purchase->vendor->phone }}</td>
                                    <td class="text-center">{{ $purchase->paid_amount}}</td>
                                    <td class="text-center">{{ $purchase->subscription_package->purchase_type}}</td>
                                    <td class="text-center">{{ $purchase->package_status==1?date('Y-m-d h:i A',strtotime($purchase->purchase_date)):'N/A'}}</td>
                                    <td class="text-center">{{ $purchase->package_status==1?date('Y-m-d h:i A',strtotime($purchase->expiry_date)):'N/A'}}</td>
                                    <td class="text-center">{!! $purchase->package_status==1?'<span class="badge badge-success">'.translate('messages.activated').'</span>':'<span class="badge badge-danger">'.translate('messages.pending').'</span>'!!}</td>
                                    <td class="text-center"><button class="btn btn-sm btn-primary" id="purchasebtn" data-toggle="modal" data-purchase_request_id="{{ $purchase->id }}" data-target="#purchaseModal" data-vendor_id="{{ $purchase->vendor_id }}" data-package_id="{{ $purchase->subscription_package->id }}" data-name="{{ $purchase->subscription_package->name }}" data-price="{{ $purchase->subscription_package->discount_type == 'Flat'?($purchase->subscription_package->price - $purchase->subscription_package->discount):($purchase->subscription_package->price - ($purchase->subscription_package->price * $purchase->subscription_package->discount) / 100) }}" data-currency="{{ $purchase->subscription_package->currency }}" data-payment_option="{{$purchase->subscription_package->payment_option}}">{{ translate('messages.approve') }}</button></td>
                                </tr>
                                
                                @endforeach
                            </tbody>
                        </table>
                </div>
            </div>
            @if (count($purchases) !== 0)
                <hr>
            @endif
            <div class="page-area">
                {!! $purchases->appends($_GET)->links() !!}
            </div>
            @if (count($purchases) === 0)
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
        $(document).on('click','#purchasebtn',function(){
            $('#purchaseModal .modal-body #package_name').val($(this).data('name'));
            $('#purchaseModal .modal-body #package_id').val($(this).data('package_id'));
            $('#purchaseModal .modal-body #vendor_id').val($(this).data('vendor_id'));
            $('#purchaseModal .modal-body #purchase_request_id').val($(this).data('purchase_request_id'));
            $('#purchaseModal .modal-body #package_price').val($(this).data('price'));
            $('#purchaseModal .modal-body #paid_amount').val($(this).data('price'));
            $('#purchaseModal .modal-body #currency').val($(this).data('currency'));

            var payoption = $(this).data('payment_option').split(',');
            $('#purchaseModal .modal-body #payment_option').empty()
            $('#purchaseModal .modal-body #payment_option').append(`
                 <option value="">{{ translate('messages.plesae_select_one') }}</option>
            `);
            $(payoption).each(function(key,val){
                $('#purchaseModal .modal-body #payment_option').append(`
                    <option value="${val}">${val.toUpperCase().replace('_',' ')}</option>
                `);
            })
        });


        $('#payment_form').submit(function(e){
            e.preventDefault();
            $('#submitbutton').text("{{ translate('messages.please_wait .....') }}").addClass('disabled')
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            var formData = new FormData(this);
            $.post({
                url: '{{ route('subscription.packages.purchaserequest') }}',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('#table-div').html(data.view);
                    $('#itemCount').html(data.count);
                    $('.page-area').hide();
                    location.reload();
                },
                error : function(err){
                    location.reload();
                },
                complete: function () {
                    $('#loading').hide();
                    $('#submitbutton').text("{{ translate('messages.submit') }}").removeClass('disabled')
                },
            })
        })  
    </script>
@endpush
