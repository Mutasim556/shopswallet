@extends('layouts.vendor.app')

@section('title', translate('messages.category'))

@push('css_or_js')
@endpush

@section('content')
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success py-2">
                    <h5 class="modal-title" id="exampleModalLabel">{{ translate('messages.more_details') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body px-1">
                    
                </div>
                <div class="modal-footer py-2">
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">{{ translate('messages.close') }}</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="purchaseModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success py-2">
                    <h5 class="modal-title" id="exampleModalLabel">{{ translate('messages.purchase_details') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body px-3">
                    <form action="">
                        <div class="form-group">
                            <label for="">{{ translate('messages.package_name') }}</label>
                            <input type="text" class="form-control" id="package_name" name="package_name" readonly>
                            <input type="hidden" class="form-control" id="package_id" name="package_id">
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
                            <label for="">{{ translate('messages.select_payment_option') }}</label>
                            <select name="payment_option" id="payment_option" required class="form-control js-select2-custom"  data-placeholder="{{translate('messages.select_payment_option')}}" >

                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer py-2">
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">{{ translate('messages.close') }}</button>
                </div>
            </div>
        </div>
    </div>
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-header-title">
                <span class="page-header-icon">
                    <img src="{{ asset('public/assets/admin/img/categories.png') }}" class="w--20" alt="">
                </span>
                <span>
                    {{ translate('messages.purchase_list') }} <span class="badge badge-soft-dark ml-2"
                        id="itemCount">{{ $purchases->count() }}</span>
                </span>
            </h1>
        </div>
        <!-- End Page Header -->
        <div class="row">
            <div class="card mt-3 col-lg-12">
                <div class="card-header py-2 border-0">
                    <div class="search--button-wrapper">
                        <h5 class="card-title">{{ translate('messages.package_list') }}<span
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
                                    placeholder="{{ translate('messages.search_purchases') }}"
                                    aria-label="{{ translate('messages.ex_:_purchases') }}">
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
                                    href="{{ route('admin.category.export-purchases', ['type' => 'excel', request()->getQueryString()]) }}">
                                    <img class="avatar avatar-xss avatar-4by3 mr-2"
                                        src="{{ asset('public/assets/admin') }}/svg/components/excel.svg"
                                        alt="Image Description">
                                    {{ translate('messages.excel') }}
                                </a>
                                <a id="export-csv" class="dropdown-item"
                                    href="{{ route('admin.category.export-purchases', ['type' => 'csv', request()->getQueryString()]) }}">
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
                                <td class="text-center">{{ $key + 1 }}</td>
                                <td class="text-center">{{ $purchase->subscription_package->name }}</td>
                                <td class="text-center">{{ $purchase->subscription_package->module->module_name }}</td>
                                <td class="text-center">{{ $purchase->paid_amount}}<br>{{ $purchase->subscription_package->purchase_type==''}}</td>
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
    </div>

@endsection

@push('script_2')
    <script>
        $(document).on('ready', function() {
            // INITIALIZATION OF DATATABLES
            // =======================================================
            var datatable = $.HSCore.components.HSDatatables.init($('#columnSearchDatatable'), {
                select: {
                    style: 'multi',
                    classMap: {
                        checkAll: '#datatableCheckAll',
                        counter: '#datatableCounter',
                        counterInfo: '#datatableCounterInfo'
                    }
                },
                language: {
                    zeroRecords: '<div class="text-center p-4">' +
                        '<img class="w-7rem mb-3" src="{{ asset('public/assets/admin/svg/illustrations/sorry.svg') }}" alt="Image Description">' +

                        '</div>'
                }
            });


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

        // $('#dataSearch').on('submit', function (e) {
        //     e.preventDefault();
        //     var formData = new FormData(this);
        //     $.ajaxSetup({
        //         headers: {
        //             'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        //         }
        //     });
        //     $.post({
        //         url: '{{ route('vendor.category.search') }}',
        //         data: formData,
        //         cache: false,
        //         contentType: false,
        //         processData: false,
        //         beforeSend: function () {
        //             $('#loading').show();
        //         },
        //         success: function (data) {
        //             $('#table-div').html(data.view);
        //             $('#itemCount').html(data.count);
        //             $('.page-area').hide();
        //         },
        //         complete: function () {
        //             $('#loading').hide();
        //         },
        //     });
        // });
        $(document).on('click','#detailsBtn',function(){
            $('#exampleModal .modal-body').empty().append($(this).data('details'));
        });

        $(document).on('click','#purchasebtn',function(){
            $('#purchaseModal .modal-body #package_name').val($(this).data('name'));
            $('#purchaseModal .modal-body #package_id').val($(this).data('package_id'));
            $('#purchaseModal .modal-body #package_price').val($(this).data('price'));
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

        $('#purchaseModal .modal-body #payment_option').change(function(){

        })
    </script>
@endpush
