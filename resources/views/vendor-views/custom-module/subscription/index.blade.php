@extends('layouts.vendor.app')

@section('title',translate('messages.category'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-header-title">
                <span class="page-header-icon">
                    <img src="{{asset('public/assets/admin/img/categories.png')}}" class="w--20" alt="">
                </span>
                <span>
                    {{translate('messages.package_list')}} <span class="badge badge-soft-dark ml-2" id="itemCount">{{$packages->count()}}</span>
                </span>
            </h1>
        </div>
        <!-- End Page Header -->
        <div class="row">
            @foreach ($packages as $package)
                <div class="col-md-3 col-lg-3 col-sm-12">
                    <div class="card">
                        <div class="card-header py-3 border-0 bg-danger">
                            <h4 class="mx-auto text-light">{{ $package->name }}</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12 col-lg-12 text-center">
                                    @if ($package->purchase_type=='Free')
                                        
                                        <span class="badge badge-success">
                                           {{ translate('messages.this_package_is_free_for_you') }}
                                        </span><br>
                                        <span>
                                            {{ translate('messages.update_your_account_to_access_full_version') }}
                                        </span><br>
                                        <b>{{ $package->validity.' '.translate('messages.days_unlimited_access') }}</b><br>
                                        <b>{{ translate('messages.you_can_receive_maximum').' '.$package->maximum_order_limit.' orders' }}</b><br>
                                        <span style="font-size:11px;color:red">{{ translate('messages.you_can_purchase_it_only_one_time') }}</span><br>
                                        <button class="btn btn-outline btn-info">{{ translate('messages.start_free_trail') }}</button>
                                    @else
                                        @if ($package->discount>=0)
                                        <strike style="color: red">{{ $package->price}} </strike> &nbsp;
                                        <b>
                                            @if ($package->discount_type=='Flat')
                                            {{ $package->price-$package->discount.' '.$package->currency}}
                                            @endif
                                        </b>
                                        @else
                                        <b>{{ $package->price.' '.$package->currency }}</b>  
                                        @endif
                                    @endif
                                    
                                    
                                </div>
                            </div>
                        </div>
                        {{-- <div class="card-footer page-area">
                            <!-- Pagination -->
                            {!! $categories->links() !!}
                            <!-- Pagination -->
                            @if(count($categories) === 0)
                            <div class="empty--data">
                                <img src="{{asset('/public/assets/admin/svg/illustrations/sorry.svg')}}" alt="public">
                                <h5>
                                    {{translate('no_data_found')}}
                                </h5>
                            </div>
                            @endif
                        </div> --}}
                    </div>
                </div>
            @endforeach
            
        </div>
    </div>

@endsection

@push('script_2')
    <script>
        $(document).on('ready', function () {
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
                    '<img class="w-7rem mb-3" src="{{asset('public/assets/admin/svg/illustrations/sorry.svg')}}" alt="Image Description">' +

                    '</div>'
                }
            });


            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function () {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
        });
    </script>

    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#viewer').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileEg1").change(function () {
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
        //         url: '{{route('vendor.category.search')}}',
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
    </script>
@endpush
