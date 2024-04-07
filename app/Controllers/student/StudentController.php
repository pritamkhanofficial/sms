<?php 

namespace App\Controllers\Student;

use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;
use App\Models\Common_M;
use App\Libraries\GroceryCrud;

class StudentController extends BaseController
{
    public function __construct(){

        $session = session();
        if($session->logged_in == true and !empty($session->get('id'))) {
            $this->session_exists = 1;
        }else{
            $this->session_exists = 0;
        }
        
        helper(['url', 'form']);
        $this->common = new Common_M();
        // $this->authentication = new Authentication_M();
        
    }
    public function student_details()
    {       
        $crud = new GroceryCrud();
        $crud->displayAs('class_id', 'Class Name');
        $crud->displayAs('section_id', 'Section Name');
        /* $tableKeys = ['id', 'class_id', 'section_id', 'full_name', 'roll_number', 'registration_number', 'date_of_birth', 'date_of_admission', 'blood_group', 'gender', 'aadhar_number', 'bangla_shiksha_id', 'state', 'city', 'full_address', 'pincode', 'nationality', 'religion', 'category', 'concession_eligible', 'rc', 'physically_disabled', 'last_school', 'old_TC_number', 'old_TC_date', 'old_school_leaving_date', 'TC_number', 'TC_date', 'TC_reason', 'school_leaving_date', 'is_left', 'promotion_eligible', 'image', 'session', 'created_at', 'created_by', 'updated_by', 'updated_at', 'row_status']; */

        
        $crud->columns(['class_id', 'section_id', 'full_name', 'roll_number', 'registration_number', 'date_of_birth', 'date_of_admission',]);
        $crud->fields(['class_id', 'section_id', 'full_name', 'roll_number', 'registration_number', 'date_of_birth', 'date_of_admission', 'blood_group', 'gender', 'aadhar_number', 'bangla_shiksha_id', 'state', 'city', 'full_address', 'pincode', 'nationality', 'religion', 'category', 'concession_eligible', 'rc', 'physically_disabled', 'last_school', 'old_TC_number', 'old_TC_date', 'old_school_leaving_date', 'TC_number', 'TC_date', 'TC_reason', 'school_leaving_date', 'is_left', 'promotion_eligible', 'image', 'session']);
        $crud->setTexteditor(['full_address','TC_reason']);
        $crud->setRelation('class_id', 'classes', 'class_name');
        $crud->setRelation('section_id', 'sections', 'section_name');
        $crud->unsetPrint();
        $crud->unsetExport();
        $crud->setTable('student_details');
        $crud->setSubject('Student Details');
        $output = $crud->render();

        $session = session();
        
        $output->page_title = "Dashboard || " . COMPANY_SHORT_NAME;
        $output->meta_tag = '<meta content='. COMPANY_FULL_NAME . ', Sketch Me Global" name="keywords"><meta content=School Management System,'.COMPANY_FULL_NAME.'", Sketch Me Global" name="description">';
        $output->approved_menu = $this->common->fetch_navbar($session->get('userrole'), $session->get('id'));
        return view('common', (array)$output);
    }
    
}


?>