@extends('layouts.admin.app')

@section('title', $prams[0].' '.translate('messages.time slot'))

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
                    {{ $prams[0].' '.translate('time_slot') }}
                </span>
            </h1>
        </div>
        <!-- End Page Header -->

        <div class="card">
            <div class="card-body">
                <form
                    action="{{ isset($timeslot) ? route('admin.service.time-and-slot.update', [$timeslot['id']]) : route('admin.service.time-and-slot.store') }}"
                    method="post">
                    @csrf
                    @if (isset($timeslot))
                        @method('PUT')
                    @endif
                    <div class="row">
                        <div class="col-md-12">
                            <label class="input-label"
                                for="{{ translate('message.select_category') }}">{{ translate('messages.select_category') }}</label>
                            <select id="exampleFormControlSelect1" name="parent_id" class="form-control js-select2-custom"
                                >
                                <option value="" selected disabled>{{ translate('Select Category') }}</option>
                                @foreach (\App\Models\Category::with('module')->where(['position' => 0])->module(Config::get('module.current_module_id'))->get() as $cat)
                                    <option value="{{ $cat['id'] }}"
                                        {{ isset($timeslot) ? ($timeslot['category_id'] == $cat['id'] ? 'selected' : '') : '' }}>
                                        {{ $cat['name'] }} ({{ Str::limit($cat->module->module_name, 15, '...') }})
                                    </option>
                                @endforeach
                            </select>
                            <span class="text-danger">@error('parent_id') {{ $message }} @enderror</span>
                        </div>
                        <div class="col-md-12 mt-3">
                            <label class="input-label"
                                for="{{ translate('message.current_or_next_date?') }}">{{ translate('messages.current_or_next_date?') }}</label>
                            <select name="current_next" class="form-control js-select2-custom"
                                >
                                <option value="">Select Date Status</option>
                                <option value="1" {{ isset($timeslot) ? ($timeslot['dstatus'] == 1 ? 'selected' : '') : '' }}>Current</option>
                                <option value="0" {{ isset($timeslot) ? ($timeslot['dstatus'] == 0 ? 'selected' : '') : '' }}>Next</option>
                            </select>
                            <span class="text-danger">@error('current_next') {{ $message }} @enderror</span>
                        </div>
                        <div class="col-md-12 mt-3">
                            <label class="input-label"
                                for="{{ translate('message.date_+_day') }}">{{ translate('messages.date_+_day') }}</label>
                            <input type="number" min="0" class="form-control" name="date_day" value="{{ isset($timeslot) ? $timeslot->days : '' }}">
                            <span class="text-danger">@error('date_day') {{ $message }} @enderror</span>
                        </div>

                        
                    </div>
                    <div class="row">
                        <div class="col-md-4 mt-3">
                            <label class="input-label"
                                for="{{ translate('message.timeslot_list') }}">{{ translate('messages.timeslot_list') }}</label>
                            <button id="plus_timeslot" type="button" class="btn btn-primary">+{{ translate('messages.add_new') }}</button>
                        </div>
                    </div>
                    @php
                        if (isset($timeslot)) {
                            $time_slot_list = explode(',',$timeslot->timeslots);
                        }
                    @endphp
                    <div id="append_timeslot" class="row">
                        <div class="col-md-3 mt-3">
                            <input type="time" class="form-control" name="timeslot_list[]" value="{{ isset($timeslot) ? date('H:i',strtotime($time_slot_list[0])) : '08:00' }}">
                            <span class="text-danger">@error('timeslot_list') {{ $message }} @enderror</span>
                        </div>
                        @if (isset($timeslot))
                            @foreach ($time_slot_list as $key=>$value)
                                @php
                                    if($key==0){
                                        continue;
                                    }
                                @endphp
                                <div class="col-md-3 mt-3" id="new_append">
                                    <div class="row">
                                        <div class="col-md-9">
                                            <input type="time" class="form-control" name="timeslot_list[]" value="{{ date('H:i',strtotime($value)) }}">
                                        </div>
                                        <div class="col-md-3">
                                            <button type="button" id="del_timeslot" class="btn btn-danger" style="padding-bottom:10px; padding-top:10px;"><i class="tio-delete-outlined"></i></button>
                                        </div>    
                                    </div>
                                </div>
                            @endforeach
                        @endif
                        
                    </div>
                    <div class="btn--container justify-content-end mt-3">
                        <button type="reset" id="reset_btn"
                            class="btn btn--reset">{{ translate('messages.reset') }}</button>
                        <button type="submit"
                            class="btn btn--primary">{{ isset($timeslot) ? translate('messages.update') : translate('messages.add') }}</button>
                    </div>

                </form>
            </div>
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
