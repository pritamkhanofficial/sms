<?php 

namespace App\Controllers\Master;

use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;
use App\Models\Common_M;
use App\Libraries\GroceryCrud;

class MasterController extends BaseController
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
    
    public function fees_header()
    {       
        $crud = new GroceryCrud();
        $crud->displayAs('fees_type', 'Fees Name');
        $crud->columns(['fees_type', 'profit_loss_balance_sheet', 'profit_loss_balance_sheet_part']);
        $crud->fields(['fees_type', 'profit_loss_balance_sheet', 'profit_loss_balance_sheet_part']);
        $crud->unsetPrint();
        $crud->unsetExport();
        $crud->setTable('fees_headers');
        $crud->setSubject('Fees Header');
        $output = $crud->render();

        $session = session();
        
        $output->page_title = "Dashboard || " . COMPANY_SHORT_NAME;
        $output->meta_tag = '<meta content='. COMPANY_FULL_NAME . ', Sketch Me Global" name="keywords"><meta content=School Management System,'.COMPANY_FULL_NAME.'", Sketch Me Global" name="description">';
        $output->approved_menu = $this->common->fetch_navbar($session->get('userrole'), $session->get('id'));
        return view('common', (array)$output);
    }
    public function fees_details()
    {       
        $crud = new GroceryCrud();
        $crud->displayAs('fees_header_id', 'Fees Type');
        $crud->displayAs('class_id', 'Class');
        $crud->columns(['fees_header_id','class_id', 'fees_title']);
        $crud->fields(['fees_header_id','class_id', 'fees_title']);
        $crud->unsetPrint();
        $crud->unsetExport();
        $crud->setRelation('fees_header_id', 'fees_headers', 'fees_type');
        $crud->setRelation('class_id', 'classes', 'class_name');
        $crud->setTable('fees_details');
        $crud->setSubject('Fees Details');
        $output = $crud->render();

        $session = session();
        
        $output->page_title = "Dashboard || " . COMPANY_SHORT_NAME;
        $output->meta_tag = '<meta content='. COMPANY_FULL_NAME . ', Sketch Me Global" name="keywords"><meta content=School Management System,'.COMPANY_FULL_NAME.'", Sketch Me Global" name="description">';
        $output->approved_menu = $this->common->fetch_navbar($session->get('userrole'), $session->get('id'));
        return view('common', (array)$output);
    }
    public function classes()
    {       
        $crud = new GroceryCrud();
        $crud->displayAs('account_group_id', 'Account Group');
        $crud->displayAs('account_master_name', 'Account Name');
        $crud->columns(['class_name', 'class_type_id']);
        $crud->fields(['class_name', 'class_type_id']);
        $crud->unsetPrint();
        $crud->unsetExport();
        $crud->setRelation('class_type_id', 'class_types', 'label');
        $crud->setTable('classes');
        $crud->setSubject('Class');
        $output = $crud->render();

        $session = session();
        
        $output->page_title = "Dashboard || " . COMPANY_SHORT_NAME;
        $output->meta_tag = '<meta content='. COMPANY_FULL_NAME . ', Sketch Me Global" name="keywords"><meta content=School Management System,'.COMPANY_FULL_NAME.'", Sketch Me Global" name="description">';
        $output->approved_menu = $this->common->fetch_navbar($session->get('userrole'), $session->get('id'));
        return view('common', (array)$output);
    }
    public function class_types()
    {       
        $crud = new GroceryCrud();
        $crud->displayAs('label', 'Class Type Name');
        $crud->columns(['label']);
        $crud->fields(['label']);
        $crud->unsetPrint();
        $crud->unsetExport();
        $crud->setTable('class_types');
        $crud->setSubject('Class');
        $output = $crud->render();

        $session = session();
        
        $output->page_title = "Dashboard || " . COMPANY_SHORT_NAME;
        $output->meta_tag = '<meta content='. COMPANY_FULL_NAME . ', Sketch Me Global" name="keywords"><meta content=School Management System,'.COMPANY_FULL_NAME.'", Sketch Me Global" name="description">';
        $output->approved_menu = $this->common->fetch_navbar($session->get('userrole'), $session->get('id'));
        return view('common', (array)$output);
    }

    public function sections()
    {       
        $crud = new GroceryCrud();
        $crud->displayAs('section_name', 'Section Name');
        $crud->displayAs('medium_id', 'Medium');
        $crud->columns(['section_name','medium_id']);
        $crud->fields(['section_name','medium_id']);
        $crud->setRelation('medium_id', 'medium', 'label');
        $crud->unsetPrint();
        $crud->unsetExport();
        $crud->setTable('sections');
        $crud->setSubject('Section');
        $output = $crud->render();

        $session = session();
        
        $output->page_title = "Dashboard || " . COMPANY_SHORT_NAME;
        $output->meta_tag = '<meta content='. COMPANY_FULL_NAME . ', Sketch Me Global" name="keywords"><meta content=School Management System,'.COMPANY_FULL_NAME.'", Sketch Me Global" name="description">';
        $output->approved_menu = $this->common->fetch_navbar($session->get('userrole'), $session->get('id'));
        return view('common', (array)$output);
    }

    public function class_section_allocation()
    {       
        $crud = new GroceryCrud();
        $crud->displayAs('class_id', 'Class Name');
        $crud->displayAs('section_id', 'Section Name');
        $crud->columns(['class_id','section_id']);
        $crud->fields(['class_id','section_id']);
        $crud->setRelation('class_id', 'classes', 'class_name');
        $crud->setRelation('section_id', 'sections', 'section_name');
        $crud->unsetPrint();
        $crud->unsetExport();
        $crud->setTable('class_section_allocation');
        $crud->setSubject('Section Allocation');
        $output = $crud->render();

        $session = session();
        
        $output->page_title = "Dashboard || " . COMPANY_SHORT_NAME;
        $output->meta_tag = '<meta content='. COMPANY_FULL_NAME . ', Sketch Me Global" name="keywords"><meta content=School Management System,'.COMPANY_FULL_NAME.'", Sketch Me Global" name="description">';
        $output->approved_menu = $this->common->fetch_navbar($session->get('userrole'), $session->get('id'));
        return view('common', (array)$output);
    }

    public function student_details()
    {       
        $crud = new GroceryCrud();
        $crud->displayAs('class_id', 'Class Name');
        $crud->displayAs('section_id', 'Section Name');
        /* $tableKeys = ['id', 'class_id', 'section_id', 'full_name', 'roll_number', 'registration_number', 'date_of_birth', 'date_of_admission', 'blood_group', 'gender', 'aadhar_number', 'bangla_shiksha_id', 'state', 'city', 'full_address', 'pincode', 'nationality', 'religion', 'category', 'concession_eligible', 'rc', 'physically_disabled', 'last_school', 'old_TC_number', 'old_TC_date', 'old_school_leaving_date', 'TC_number', 'TC_date', 'TC_reason', 'school_leaving_date', 'is_left', 'promotion_eligible', 'image', 'session', 'created_at', 'created_by', 'updated_by', 'updated_at', 'row_status']; */


        $crud->columns(['class_id', 'section_id', 'full_name', 'roll_number', 'registration_number', 'date_of_birth', 'date_of_admission',]);
        $crud->fields(['class_id', 'section_id', 'full_name', 'roll_number', 'registration_number', 'date_of_birth', 'date_of_admission', 'blood_group', 'gender', 'aadhar_number', 'bangla_shiksha_id', 'state', 'city', 'full_address', 'pincode', 'nationality', 'religion', 'category', 'concession_eligible', 'rc', 'physically_disabled', 'last_school', 'old_TC_number', 'old_TC_date', 'old_school_leaving_date', 'TC_number', 'TC_date', 'TC_reason', 'school_leaving_date', 'is_left', 'promotion_eligible', 'image', 'session']);
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

    public function medium()
    {       
        $crud = new GroceryCrud();
        $crud->displayAs('label', 'Medium Name');
        $crud->columns(['label']);
        $crud->fields(['label']);
        $crud->unsetPrint();
        $crud->unsetExport();
        $crud->setTable('medium');
        $crud->setSubject('Medium');
        $output = $crud->render();

        $session = session();
        
        $output->page_title = "Dashboard || " . COMPANY_SHORT_NAME;
        $output->meta_tag = '<meta content='. COMPANY_FULL_NAME . ', Sketch Me Global" name="keywords"><meta content=School Management System,'.COMPANY_FULL_NAME.'", Sketch Me Global" name="description">';
        $output->approved_menu = $this->common->fetch_navbar($session->get('userrole'), $session->get('id'));
        return view('common', (array)$output);
    }

    public function subjects()
    {       
        $crud = new GroceryCrud();
        $crud->displayAs('label', 'Subject Name');
        $crud->columns(['label']);
        $crud->fields(['label']);
        $crud->unsetPrint();
        $crud->unsetExport();
        $crud->setTable('subjects');
        $crud->setSubject('subjects');
        $output = $crud->render();

        $session = session();
        
        $output->page_title = "Dashboard || " . COMPANY_SHORT_NAME;
        $output->meta_tag = '<meta content='. COMPANY_FULL_NAME . ', Sketch Me Global" name="keywords"><meta content=School Management System,'.COMPANY_FULL_NAME.'", Sketch Me Global" name="description">';
        $output->approved_menu = $this->common->fetch_navbar($session->get('userrole'), $session->get('id'));
        return view('common', (array)$output);
    }

    public function class_subject_allocation()
    {       
        $crud = new GroceryCrud();
        $crud->displayAs('medium_id', 'Medioum');
        $crud->displayAs('class_id', 'Class');
        $crud->displayAs('subject_id', 'Subject');
        $crud->columns(['medium_id','class_id','subject_id']);
        $crud->fields(['medium_id','class_id','subject_id']);
        $crud->setRelation('medium_id', 'medium', 'label');
        $crud->setRelation('class_id', 'classes', 'class_name');
        $crud->setRelation('subject_id', 'subjects', 'label');
        $crud->unsetPrint();
        $crud->unsetExport();
        $crud->setTable('class_subject_allocation');
        $crud->setSubject('Subject Allocation');
        $output = $crud->render();

        $session = session();
        
        $output->page_title = "Dashboard || " . COMPANY_SHORT_NAME;
        $output->meta_tag = '<meta content='. COMPANY_FULL_NAME . ', Sketch Me Global" name="keywords"><meta content=School Management System,'.COMPANY_FULL_NAME.'", Sketch Me Global" name="description">';
        $output->approved_menu = $this->common->fetch_navbar($session->get('userrole'), $session->get('id'));
        return view('common', (array)$output);
    }
    public function exams()
    {       
        $crud = new GroceryCrud();
        $crud->displayAs('exam_name', 'Exam Name');
        $crud->displayAs('exam_marks', 'Exam Marks');
        $crud->columns(['exam_name','exam_marks']);
        $crud->fields(['exam_name','exam_marks']);
        $crud->unsetPrint();
        $crud->unsetExport();
        $crud->setTable('exams');
        $crud->setSubject('exams');
        $output = $crud->render();

        $session = session();
        
        $output->page_title = "Dashboard || " . COMPANY_SHORT_NAME;
        $output->meta_tag = '<meta content='. COMPANY_FULL_NAME . ', Sketch Me Global" name="keywords"><meta content=School Management System,'.COMPANY_FULL_NAME.'", Sketch Me Global" name="description">';
        $output->approved_menu = $this->common->fetch_navbar($session->get('userrole'), $session->get('id'));
        return view('common', (array)$output);
    }

    public function grades()
    {       
        $crud = new GroceryCrud();
        $crud->displayAs('name', 'Name');
        $crud->displayAs('grace_percent', 'Grace Percent');
        $crud->columns(['name','grace_percent']);
        $crud->fields(['name','grace_percent']);
        $crud->unsetPrint();
        $crud->unsetExport();
        $crud->setTable('grades');
        $crud->setSubject('grades');
        $output = $crud->render();

        $session = session();
        
        $output->page_title = "Dashboard || " . COMPANY_SHORT_NAME;
        $output->meta_tag = '<meta content='. COMPANY_FULL_NAME . ', Sketch Me Global" name="keywords"><meta content=School Management System,'.COMPANY_FULL_NAME.'", Sketch Me Global" name="description">';
        $output->approved_menu = $this->common->fetch_navbar($session->get('userrole'), $session->get('id'));
        return view('common', (array)$output);
    }
    
}


?>