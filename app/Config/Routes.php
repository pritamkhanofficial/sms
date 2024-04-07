<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
//$routes->get('/', 'Home::index');

$routes->group('',['filter' => 'LoggedFilter'],function($routes){
    
    // $routes->match(['get', 'post'], '/', 'Authentication\Registration_C::index');
    $routes->match(['get', 'post'], '/', 'authentication\AuthenticationController::login');
    $routes->match(['get', 'post'], '/login', 'authentication\AuthenticationController::login');
    $routes->post('/login/login_form', 'authentication\AuthenticationController::login_form');
    
});

$routes->group('',['filter' => 'AuthFilter'],function($routes){
    
    // logout
    $routes->get('logout', 'authentication\AuthenticationController::logout');
    // dashboard
    $routes->get('/dashboard', 'dashboard\DashboardController::index');

    $routes->group('master',function($routes){
        $routes->match(['get', 'post'],'fees-header/', 'master\MasterController::fees_header');
        $routes->match(['get', 'post'],'fees-header/(:segment)', 'master\MasterController::fees_header/$1');
        $routes->match(['get', 'post'],'fees-header/(:segment)/(:segment)', 'master\MasterController::fees_header/$1/$2');

        $routes->match(['get', 'post'],'fees-details/', 'master\MasterController::fees_details');
        $routes->match(['get', 'post'],'fees-details/(:segment)', 'master\MasterController::fees_details/$1');
        $routes->match(['get', 'post'],'fees-details/(:segment)/(:segment)', 'master\MasterController::fees_details/$1/$2');


        $routes->match(['get', 'post'],'class/', 'master\MasterController::classes');
        $routes->match(['get', 'post'],'class/(:segment)', 'master\MasterController::classes/$1');
        $routes->match(['get', 'post'],'class/(:segment)/(:segment)', 'master\MasterController::classes/$1/$2');


        $routes->match(['get', 'post'],'class-type/', 'master\MasterController::class_types');
        $routes->match(['get', 'post'],'class-type/(:segment)', 'master\MasterController::class_types/$1');
        $routes->match(['get', 'post'],'class-type/(:segment)/(:segment)', 'master\MasterController::class_types/$1/$2');

        $routes->match(['get', 'post'],'section/', 'master\MasterController::sections');
        $routes->match(['get', 'post'],'section/(:segment)', 'master\MasterController::sections/$1');
        $routes->match(['get', 'post'],'section/(:segment)/(:segment)', 'master\MasterController::sections/$1/$2');

        $routes->match(['get', 'post'],'section-allocation/', 'master\MasterController::class_section_allocation');
        $routes->match(['get', 'post'],'section-allocation/(:segment)', 'master\MasterController::class_section_allocation/$1');
        $routes->match(['get', 'post'],'section-allocation/(:segment)/(:segment)', 'master\MasterController::class_section_allocation/$1/$2');

        $routes->match(['get', 'post'],'medium/', 'master\MasterController::medium');
        $routes->match(['get', 'post'],'medium/(:segment)', 'master\MasterController::medium/$1');
        $routes->match(['get', 'post'],'medium/(:segment)/(:segment)', 'master\MasterController::medium/$1/$2');

        $routes->match(['get', 'post'],'subjects/', 'master\MasterController::subjects');
        $routes->match(['get', 'post'],'subjects/(:segment)', 'master\MasterController::subjects/$1');
        $routes->match(['get', 'post'],'subjects/(:segment)/(:segment)', 'master\MasterController::subjects/$1/$2');

        $routes->match(['get', 'post'],'subject-allocation/', 'master\MasterController::class_subject_allocation');
        $routes->match(['get', 'post'],'subject-allocation/(:segment)', 'master\MasterController::class_subject_allocation/$1');
        $routes->match(['get', 'post'],'subject-allocation/(:segment)/(:segment)', 'master\MasterController::class_subject_allocation/$1/$2');

        $routes->match(['get', 'post'],'exams/', 'master\MasterController::exams');
        $routes->match(['get', 'post'],'exams/(:segment)', 'master\MasterController::exams/$1');
        $routes->match(['get', 'post'],'exams/(:segment)/(:segment)', 'master\MasterController::exams/$1/$2');

        $routes->match(['get', 'post'],'grades/', 'master\MasterController::grades');
        $routes->match(['get', 'post'],'grades/(:segment)', 'master\MasterController::grades/$1');
        $routes->match(['get', 'post'],'grades/(:segment)/(:segment)', 'master\MasterController::grades/$1/$2');
    });

    $routes->group('student',function($routes){
       
        $routes->match(['get', 'post'],'student-details/', 'student\StudentController::student_details');
        $routes->match(['get', 'post'],'student-details/(:segment)', 'student\StudentController::student_details/$1');
        $routes->match(['get', 'post'],'student-details/(:segment)/(:segment)', 'student\StudentController::student_details/$1/$2');


        $routes->match(['get', 'post'],'parent-details/', 'student\ParentController::parent_details');
        $routes->match(['get', 'post'],'parent-details/(:segment)', 'student\ParentController::parent_details/$1');
        $routes->match(['get', 'post'],'parent-details/(:segment)/(:segment)', 'student\ParentController::parent_details/$1/$2');
        
    });

     $routes->group('teacher',function($routes){
       
        $routes->match(['get', 'post'],'exam-marks/', 'teacher\TeacherController::exam_marks');
               
    });
    
});

