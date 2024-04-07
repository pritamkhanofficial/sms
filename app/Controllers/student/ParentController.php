<?php 

namespace App\Controllers\Student;

use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;
use App\Models\Common_M;
use App\Libraries\GroceryCrud;

class ParentController extends BaseController
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
    public function parent_details()
    {       
        $crud = new GroceryCrud();
        $crud->displayAs('class_id', 'Class Name');
        $crud->displayAs('section_id', 'Section Name');
                
        $crud->columns(['father_full_name', 'father_phone', 'father_email', 'father_occupation']);
        $crud->fields(['father_full_name', 'father_phone', 'father_email', 'father_occupation', 'father_full_address', 'mother_full_name', 'mother_phone', 'mother_email', 'mother_occupation', 'mother_full_address', 'guardian_full_name', 'guardian_phone', 'guardian_email', 'guardian_occupation', 'guardian_full_address']);
        // $crud->setRelation('class_id', 'classes', 'class_name');
        // $crud->setRelation('section_id', 'sections', 'section_name');
        $crud->setTexteditor(['father_full_address','mother_full_address','guardian_full_address']);
        $crud->unsetPrint();
        $crud->unsetExport();
        $crud->setTable('parent_details');
        $crud->setSubject('Parent Details');
        $output = $crud->render();

        $session = session();
        
        $output->page_title = "Dashboard || " . COMPANY_SHORT_NAME;
        $output->meta_tag = '<meta content='. COMPANY_FULL_NAME . ', Sketch Me Global" name="keywords"><meta content=School Management System,'.COMPANY_FULL_NAME.'", Sketch Me Global" name="description">';
        $output->approved_menu = $this->common->fetch_navbar($session->get('userrole'), $session->get('id'));
        return view('common', (array)$output);
    }
    
}


?>