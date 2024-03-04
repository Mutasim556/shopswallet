<?php

namespace App\Http\Controllers\Admin\Service;

use App\Http\Controllers\Controller;
use App\Models\service\TimeSlot;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\Config;

class TimeSlotController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $timeslots = TimeSlot::with('category')->latest()->paginate(config('default_pagination'));
        return view('admin-views.service.timeslot.index',compact('timeslots'));
    }
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $prams = [translate('messages.add_new')];
        return view('admin-views.service.timeslot.create',compact('prams'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $data)
    {
        $data->validate([
            'parent_id'=>'required',
            'current_next'=>'required',
            'date_day'=>'required|integer',
            'timeslot_list'=>'required',
            'timeslot_list.*'=>'required',
        ],[
            'parent_id.required'=>translate('Select category first'),
        ]);
        $timeslot_list = [];
        foreach($data->timeslot_list as $val){
            array_push($timeslot_list,date('h:i a',strtotime($val)));
        }
        $time_slot = implode(',',$timeslot_list);
        $timeslots = new TimeSlot();
        $timeslots->category_id = $data->parent_id;
        $timeslots->dstatus = $data->current_next;
        $timeslots->days = $data->date_day;
        $timeslots->timeslots = $time_slot;
        $timeslots->status = 1 ;
        $timeslots->save();
        Toastr::success(translate('messages.time_slot_created_successfully'),'',["positionClass" => "toast-bottom-right","timeOut"=>2000]);
        return back();
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $timeslot = TimeSlot::with('category')->findOrFail($id);
        $prams = [translate('messages.edit')];
        return view('admin-views.service.timeslot.create',compact('timeslot','prams'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $data, string $id)
    {
        $data->validate([
            'parent_id'=>'required',
            'current_next'=>'required',
            'date_day'=>'required|integer',
            'timeslot_list'=>'required',
            'timeslot_list.*'=>'required',
        ],[
            'parent_id.required'=>translate('Select category first'),
        ]);
        
        $timeslot_list = [];
        foreach($data->timeslot_list as $val){
            array_push($timeslot_list,date('h:i a',strtotime($val)));
        }
        $time_slot = implode(',',$timeslot_list);
        $timeslot = TimeSlot::findOrFail($id);
        $timeslot->category_id = $data->parent_id;
        $timeslot->dstatus = $data->current_next;
        $timeslot->days = $data->date_day;
        $timeslot->timeslots = $time_slot;
        $timeslot->save();

        Toastr::success(translate('messages.time_slot_updated_successfully'),'',["positionClass" => "toast-bottom-right","timeOut"=>2000]);
        return back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $timeslot = TimeSlot::findOrFail($id);
        $timeslot->delete();
        Toastr::success(translate('messages.timeslot_removed!'));
       
        return back();
    }

    public function status(string $id , string $status){
        $city = TimeSlot::find($id);
        $city->status = $status;
        $city->save();
        Toastr::success(translate('messages.time_slot_status_updated'),'',["positionClass" => "toast-bottom-right","timeOut"=>2000]);
        return back();
    }
}
