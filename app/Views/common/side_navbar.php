<!-- Sidebar Start -->
<?php         
    $session = session();
    // echo '<pre>',print_r($approved_menu),'</pre>';
    
    foreach($approved_menu as $key=>$am){
        if($am->show_on_left_nav == 0){
            unset($approved_menu[$key]);
        }
    }

    if($session->userrole != 1){ // Normal User Level
        
        $module_master_permission = in_array('Master', array_column($approved_menu, 'menu_module'));
        $module_user_permission = in_array('User', array_column($approved_menu, 'menu_module'));
        $module_report_permission = in_array('Report', array_column($approved_menu, 'menu_module'));

    } else{
        
        $module_master_permission = $module_user_permission = $module_report_permission = 1;
        $module_teacher_permission = in_array('Teacher', array_column($approved_menu, 'menu_module'));
        
    }
?>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
  <ul class="nav">
    <li class="nav-item nav-profile">
      <a href="#" class="nav-link">
        <div class="nav-profile-image">
          <img src="<?=base_url('assets/backdesk/img/user.png')?>" alt="profile" />
          <span class="login-status online"></span>
          <!--change to offline or busy as needed-->
        </div>
        <div class="nav-profile-text d-flex flex-column">
          <span class="font-weight-bold mb-2">David Grey. H</span>
          <span class="text-secondary text-small"><?= $session->get('username') ?></span>
        </div>
        <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
      </a>
    </li>
    <hr>
    <li class="nav-item">
      <a class="nav-link" href="<?=base_url('dashboard')?>">
        <span class="menu-title">Dashboard</span>
        <i class="mdi mdi-home menu-icon"></i>
      </a>
    </li>
    
    <?php if($module_user_permission){ ?>
    <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#module-user" aria-expanded="false" aria-controls="page-layouts">
            <span class="menu-title">User Management</span>
            <i class="menu-arrow"></i>
            <i class="mdi mdi-apps menu-icon"></i>
        </a>
        <div class="collapse" id="module-user">
            <ul class="nav flex-column sub-menu">
                <?php 
                foreach($approved_menu as $am){
                    if($am->menu_module == "User"){
                        ?>
                        <li class="nav-item">
                            <a href="<?= base_url() . $am->menu_slug?>" class="nav-link"><?=$am->menu_name?></a>
                        </li>
                        <?php
                    }
                } 
                ?>     
            </ul>
        </div>
    </li>
    <?php } ?>
    
    <?php if($module_master_permission){ ?>
    <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#module-master" aria-expanded="false" aria-controls="page-layouts">
            <span class="menu-title">Master Management</span>
            <i class="menu-arrow"></i>
            <i class="mdi mdi-apps menu-icon"></i>
        </a>
        <div class="collapse" id="module-master">
            <ul class="nav flex-column sub-menu">
                <?php 
                foreach($approved_menu as $am){
                    if($am->menu_module == "Master"){
                        ?>
                        <li class="nav-item">
                            <a href="<?= base_url('master/') . $am->menu_slug?>" class="nav-link"><?=$am->menu_name?></a>
                        </li>
                        <?php
                    }
                } 
                ?>     
            </ul>
        </div>
    </li>
    <?php } ?>

    <?php if($module_user_permission){ ?>
    <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#module-student" aria-expanded="false" aria-controls="page-layouts">
            <span class="menu-title">Student Management</span>
            <i class="menu-arrow"></i>
            <i class="mdi mdi-apps menu-icon"></i>
        </a>
        <div class="collapse" id="module-student">
            <ul class="nav flex-column sub-menu">
                <?php 
                foreach($approved_menu as $am){
                    if($am->menu_module == "Student"){
                        ?>
                        <li class="nav-item">
                            <a href="<?= base_url('student/') . $am->menu_slug?>" class="nav-link"><?=$am->menu_name?></a>
                        </li>
                        <?php
                    }
                } 
                ?>     
            </ul>
        </div>
    </li>
    <?php } ?>

      <?php if($module_teacher_permission){ ?>
    <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#module-master" aria-expanded="false" aria-controls="page-layouts">
            <span class="menu-title">Teacher</span>
            <i class="menu-arrow"></i>
            <i class="mdi mdi-apps menu-icon"></i>
        </a>
        <div class="collapse" id="module-master">
            <ul class="nav flex-column sub-menu">
                <?php 
                foreach($approved_menu as $am){
                    if($am->menu_module == "Teacher"){
                        ?>
                        <li class="nav-item">
                            <a href="<?= base_url('teacher/') . $am->menu_slug?>" class="nav-link"><?=$am->menu_name?></a>
                        </li>
                        <?php
                    }
                } 
                ?>     
            </ul>
        </div>
    </li>
    <?php } ?>
    
  </ul>
</nav>
        