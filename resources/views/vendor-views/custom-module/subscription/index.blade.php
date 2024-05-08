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
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-header-title">
                <span class="page-header-icon">
                    <img src="{{ asset('public/assets/admin/img/categories.png') }}" class="w--20" alt="">
                </span>
                <span>
                    {{ translate('messages.package_list') }} <span class="badge badge-soft-dark ml-2"
                        id="itemCount">{{ $packages->count() }}</span>
                </span>
            </h1>
        </div>
        <!-- End Page Header -->
        <div class="row">
            @foreach ($packages as $package)
                <div class="col-md-3 col-lg-3 col-sm-12">
                    <div class="card">
                        <div
                            class="card-header py-3 border-0 {{ $package->purchase_type == 'Free' ? 'bg-success' : 'bg-danger' }}">
                            <h4 class="mx-auto text-light">{{ $package->name }}</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12 col-lg-12 text-center">
                                    @if ($package->purchase_type == 'Free')
                                        <span class="badge badge-success">
                                            {{ translate('messages.this_package_is_free_for_you') }}
                                        </span>
                                        <br>
                                        <br>
                                        <span>
                                            {{ translate('messages.update_your_account_to_access_full_version') }}
                                        </span><br>
                                        <b>{{ $package->validity . ' ' . translate('messages.days_unlimited_access') }}</b><br>
                                        <b>{{ translate('messages.you_can_receive_maximum') . ' ' . $package->maximum_order_limit . ' orders' }}</b><br>
                                        <span
                                            style="font-size:11px;color:red">{{ translate('messages.you_can_purchase_it_only_one_time') }}</span><br>
                                    @else
                                        @if ($package->discount >= 0)
                                            <strike style="color: red">{{ $package->price }} </strike> &nbsp;
                                            <b>
                                                @if ($package->discount_type == 'Flat')
                                                    {{ $package->price - $package->discount . ' ' . $package->currency }}
                                                    <br><span class="badge badge-danger">{{ translate('messages.discount') }} {{ $package->discount." ".$package->currency }}
                                                        </span>
                                                @else
                                                    {{ $package->price - ($package->price * $package->discount) / 100 . ' ' . $package->currency }}
                                                    <br><span class="badge badge-danger">{{ $package->discount }}%
                                                        {{ translate('messages.discount') }}</span>
                                                @endif
                                            </b>
                                        @else
                                            <b>{{ $package->price . ' ' . $package->currency }}</b>
                                        @endif <br>
                                        <span>
                                            {{ translate('messages.update_your_account_to_access_full_version') }}
                                        </span><br>
                                        <b>{{ $package->validity . ' ' . translate('messages.days_unlimited_access') }}</b><br>
                                        <b>{{ translate('messages.you_can_receive_maximum') . ' ' . $package->maximum_order_limit . ' orders' }}</b><br>
                                        <span
                                            style="font-size:11px;color:red">{{ translate('messages.you_can_purchase_it') . ' ' . $package->purchase_limit . translate('messages._times_per_months') }}</span><br>
                                    @endif


                                </div>
                            </div>
                        </div>
                        <div class="card-footer page-area bg-white">
                            <div class="row" style="text-align: center">
                                <div class="col-lg-12">
                                    @if ($package->purchase_type == 'Free')
                                        <button
                                            class="btn btn-sm btn-info">{{ translate('messages.start_free_trail') }}</button>
                                    @else
                                        <button id="detailsBtn" class="btn btn-sm btn-primary mx-2" data-toggle="modal" data-target="#exampleModal" data-details="{!! $package->details !!}">{{ translate('messages.details') }}</button>
                                        <button class="btn btn-sm btn-danger mx-2" >{{ translate('messages.purchase_now') }}</button>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach

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
    </script>
@endpush
