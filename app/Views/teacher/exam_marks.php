<?php echo view ('common/top_header_backdesk.php') ?>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
</head>

<?php $session = session(); ?>


<body>
   
    <div class="container-scroller">
        
        <!--Top navbar-->
      <?= view('common/top_navbar') ?>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        
        <!--sidenavbar starts-->
        <?= view('common/side_navbar') ?>  
        <!--sidenavbar ends-->
        
        <div class="main-panel">
          <div class="content-wrapper">

             <form>
              <div class="row">
                <div class="col-md-3 form-group">
                  <label for="exampleFormControlInput1">Medium</label>
                  <select class="form-control" name="medium" id="medium">
                    <option value="">Select Medium</option>
                    <?php
                    if(!empty($medium)){
                      foreach($medium as $row){
                        ?><option value="<?php echo $row->id?>"><?php echo $row->label?></option><?php
                      }
                    }
                    ?>
                  </select>
                </div>
                <div class="col-md-3 form-group">
                  <label for="exampleFormControlInput1">Class</label>
                  <input type="text" class="form-control" placeholder="Last name">
                </div>
                 <div class="col-md-3 form-group">
                  <label for="exampleFormControlInput1">Section</label>
                  <input type="text" class="form-control" placeholder="Last name">
                </div>
                <div class="col-md-3 form-group">
                  <label for="exampleFormControlInput1">Exam</label>
                  <input type="text" class="form-control" placeholder="Last name">
                </div>
                <div class="col-md-3 form-group">
                  <label for="exampleFormControlInput1">Subject</label>
                  <input type="text" class="form-control" placeholder="Last name">
                </div>
              </div>
            </form>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.html -->
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © <?=date('Y') . ' ' . COMPANY_FULL_NAME?> . All rights reserved.</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">With gratitude from || <i class="mdi mdi-heart text-danger"></i><a href="<?=CREDIT_LINK?>" target="_blank"><?=CREDIT_TITLE?></a></span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <?php echo view ('common/footer_backdesk.php') ?>
   
</body>

</html>