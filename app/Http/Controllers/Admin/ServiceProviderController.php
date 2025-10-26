<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class ServiceProviderController extends CRUDCrontroller
{
    public function __construct(Request $request)
    {
        parent::__construct('User');
        $this->__request    = $request;
        $this->__data['page_title'] = 'Service Provider';
        $this->__indexView  = 'service_provider.index';
        $this->__createView = 'service_provider.add';
        $this->__editView   = 'service_provider.edit';
        $this->__detailView = 'service_provider.detail';
    }

    /**
     * This function is used for validate data
     * @param string $action
     * @param string $slug
     * @return array|\Illuminate\Contracts\Validation\Validator
     */
    public function validation(string $action, string $slug=NULL)
    {
        $validator = [];
        switch ($action){
            case 'POST':
                $validator = Validator::make($this->__request->all(), [
                    'attribute' => 'required',
                ]);
                break;
            case 'PUT':
                $validator = Validator::make($this->__request->all(), [
                    '_method'    => 'required|in:PUT',
                    'status'     => 'sometimes|required',
                    'is_approve' => 'sometimes|required',
                ]);
                break;
        }
        return $validator;
    }

    /**
     * This function is used for before the index view render
     * data pass on view eg: $this->__data['title'] = 'Title';
     */
    public function beforeRenderIndexView()
    {

    }

    /**
     * This function is used to add data in datatable
     * @param object $record
     * @return array
     */
    public function dataTableRecords($record)
    {
        $options  = '<a href="'. route('provider.show',['provider' => $record->slug ]) .'" title="Edit" class="btn btn-xs btn-primary"><i class="fa fa-eye"></i></a> ';
        $options  .= '<a href="'. route('provider.edit',['provider' => $record->slug ]) .'" title="Edit" class="btn btn-xs btn-primary"><i class="fa fa-pencil"></i></a>';
        return [
            $record->name,
            $record->email,
            $record->mobile_no,
            $record->is_email_verify == 1 ? '<span class="btn btn-xs btn-success">Verified</span>' : '<span class="btn btn-xs btn-danger">not verified</span>',
            $record->is_approve == 1 ? '<span class="btn btn-xs btn-success">Approve</span>' : '<span class="btn btn-xs btn-danger">Disapprove</span>',
            $record->status == 1 ? '<span class="btn btn-xs btn-success">Active</span>' : '<span class="btn btn-xs btn-danger">Disabled</span>',
            date(config("constants.ADMIN_DATE_FORMAT") , strtotime($record->created_at)),
            $options
        ];
    }

    /**
     * This function is used for before the create view render
     * data pass on view eg: $this->__data['title'] = 'Title';
     */
    public function beforeRenderCreateView()
    {

    }

    /**
     * This function is called before a model load
     */
    public function beforeStoreLoadModel()
    {

    }

    /**
     * This function is used for before the edit view render
     * data pass on view eg: $this->__data['title'] = 'Title';
     * @param string @slug
     */
    public function beforeRenderEditView($slug)
    {
        $this->__data['userDetail'] = User::where('slug', $slug)->first();
    }

    /**
     * This function is called before a model load
     */
    public function beforeUpdateLoadModel()
    {

    }

    /**
     * This function is called before a model load
     */
    public function beforeRenderDetailView($slug)
    {
        $this->__data['user'] = User::where('slug', $slug)->first();
    }

    /**
     * This function is called before a model load
     */
    public function beforeDeleteLoadModel()
    {

    }
}
