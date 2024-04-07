<?php 

namespace App\Controllers\Teacher;

use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;
use App\Models\Common_M;
use App\Libraries\GroceryCrud;

class TeacherController extends BaseController
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
    public function exam_marks()
    {       $session = session();
        $data['page_title'] = "Exam || ";
        $data['meta_tag'] = '<meta content="Baazar Kolkata, Sketch Me Global" name="keywords"><meta content="Baazar Kolkata, Sketch Me Global" name="description">';
        // return view('authentication/signin', $data);
        $data['approved_menu'] = $this->common->fetch_navbar($session->get('userrole'), $session->get('id'));
        $where_cond=array(
            "row_status"=>1
        );
        $data['medium'] = $this->common->data_all('medium',$where_cond);
        return view('teacher/exam_marks', $data);
    }
    
}


?>