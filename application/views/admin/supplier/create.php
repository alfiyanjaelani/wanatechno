<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Control Stock - Dashboard</title>

  <!-- Custom fonts for this template-->

  <link href="<?php echo base_url('assets/fontawesome-free/css/all.min.css') ?>" rel="stylesheet">


  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<?php echo base_url('css/sb-admin-2.min.css') ?>" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<?php echo base_url('/index.php/admin') ?>">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-file-alt"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Control Stock</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="<?php echo base_url('/index.php/admin') ?>">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
          Master Data
        </div>

       <!-- Nav Item - Pages Collapse Menu -->
       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-laptop"></i>
          <span>Master</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">List Master Data:</h6>
            <a class="collapse-item" href="<?php echo base_url('index.php/admin/barang/index') ?>">Barang</a>
            <a class="collapse-item" href="<?php echo base_url('index.php/admin/supplier/index') ?>">Supplier</a>
            <a class="collapse-item" href="<?php echo base_url('index.php/admin/divisi/index') ?>">Divisi</a>
            <a class="collapse-item" href="<?php echo base_url('index.php/admin/sliptype/index') ?>">Sliptype</a>
             <a class="collapse-item" href="<?php echo base_url('index.php/admin/destination/index') ?>">Destination</a>
          </div>
        </div>
      </li>



        <!-- Divider -->
        <hr class="sidebar-divider">

       <!-- Heading -->
      <div class="sidebar-heading">
        Transaksi Barang
      </div>

       <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-indent"></i>
          <span>Barang Masuk</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Barang :</h6>
            <a class="collapse-item" href="<?php echo base_url('index.php/admin/barangmasuk/create') ?>">Input</a>
            <a class="collapse-item" href="<?php echo base_url('index.php/admin/barangmasuk/index') ?>">View</a>
          </div>
        </div>
        </div>
      </li>
       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBarangkeluar" aria-expanded="true" aria-controls="collapseBarangkeluar">
          <i class="fas fa-fw fa-outdent"></i>
          <span>Barang keluar</span>
        </a>
        <div id="collapseBarangkeluar" class="collapse" aria-labelledby="headingBarangkeluar" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Barangkeluar:</h6>
            <a class="collapse-item" href="<?php echo base_url('index.php/admin/barangkeluar/create') ?>">Input</a>
            <a class="collapse-item" href="<?php echo base_url('index.php/admin/barangkeluar/index') ?>">View</a>
          </div>
        </div>
      </li>

         <!-- Nav Item - View -->
      <li class="nav-item">
        <a class="nav-link" href="<?php echo base_url('index.php/admin/viewreport/index') ?>">
          <i class="fas fa-fw fa-table"></i>
          <span>Views All</span></a>
      </li>



        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
          <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

      </ul>
      <!-- End of Sidebar -->

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

          <!-- Topbar -->
          <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

            <!-- Sidebar Toggle (Topbar) -->
            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
              <i class="fa fa-bars"></i>
            </button>


            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">

              <!-- Nav Item - Search Dropdown (Visible Only XS) -->
              <li class="nav-item dropdown no-arrow d-sm-none">
                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-search fa-fw"></i>
                </a>
                <!-- Dropdown - Messages -->
                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                  <form class="form-inline mr-auto w-100 navbar-search">
                    <div class="input-group">
                      <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                      <div class="input-group-append">
                        <button class="btn btn-primary" type="button">
                          <i class="fas fa-search fa-sm"></i>
                        </button>
                      </div>
                    </div>
                  </form>
                </div>
              </li>

              <!-- Nav Item - Alerts -->
              <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-bell fa-fw"></i>
                  <!-- Counter - Alerts -->
                  <span class="badge badge-danger badge-counter">3+</span>
                </a>
                <!-- Dropdown - Alerts -->
                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                  <h6 class="dropdown-header">
                    Alerts Center
                  </h6>
                  <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="mr-3">
                      <div class="icon-circle bg-primary">
                        <i class="fas fa-file-alt text-white"></i>
                      </div>
                    </div>
                    <div>
                      <div class="small text-gray-500">December 12, 2019</div>
                      <span class="font-weight-bold">A new monthly report is ready to download!</span>
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="mr-3">
                      <div class="icon-circle bg-success">
                        <i class="fas fa-donate text-white"></i>
                      </div>
                    </div>
                    <div>
                      <div class="small text-gray-500">December 7, 2019</div>
                      $290.29 has been deposited into your account!
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="mr-3">
                      <div class="icon-circle bg-warning">
                        <i class="fas fa-exclamation-triangle text-white"></i>
                      </div>
                    </div>
                    <div>
                      <div class="small text-gray-500">December 2, 2019</div>
                      Spending Alert: We've noticed unusually high spending for your account.
                    </div>
                  </a>
                  <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                </div>
              </li>



              <div class="topbar-divider d-none d-sm-block"></div>

               <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><?php echo $this->session->userdata("nama"); ?></span>
                <i class="fa fa-user"></i>
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="<?php echo base_url('index.php/admin/login/logout') ?>" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

            </ul>

          </nav>
          <!-- End of Topbar -->

          <!-- Begin Page Content -->
          <div class="container-fluid">


            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

              <!-- Main Content -->
              <div id="content">



                <!-- Begin Page Content -->
                <div class="container-fluid">

                  <!-- Page Heading -->
                  <h1 class="h3 mb-2 text-gray-800">Master Supplier</h1>
                  <!-- DataTales Example -->
                  <div class="card shadow mb-4">
                    <div class="card-header py-3">
                      <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Input Data Supplier</h1>
                      </div>

                    </div>
                    <div class="card-body">
                     <div class="row">
                      <div class="col-sm-3">
                       </div>
                       <div class="col-sm-6">
                        <form class="user" style="text-align: left;" action="<?php echo base_url(). 'index.php/admin/supplier/tambah_data'; ?>" method="post">
                          <div class="form-group row" >
                            <div class="col-sm-5" >
                              <label> Nama Supplier</label>
                            </div>
                            <div class="col-sm-1" >
                              <label> : </label>
                            </div>
                            <div class="col-sm-6">
                              <input type="text" class="form-control form-control-user" id="nama_supplier" placeholder="Nama Supplier" name="nama_supplier">
                            </div>
                          </div>
                          <div class="form-group row">
                             <div class="col-sm-5" >
                              <label>Alamat</label>
                            </div>
                            <div class="col-sm-1" >
                              <label> : </label>
                            </div>
                            <div class="col-sm-6">
                              <input type="text" class="form-control form-control-user" id="alamat_supplier" placeholder="Alamat" name="alamat_supplier">
                            </div>
                          </div>
                          <div class="form-group row">
                            <div class="col-sm-5" >
                              <label>No Tlp</label>
                            </div>
                            <div class="col-sm-1" >
                              <label> : </label>
                            </div>
                            <div class="col-sm-6">
                              <input type="text" class="form-control form-control-user" id="no_tlp_supplier" placeholder="No Telepon" name="no_tlp_supplier">
                            </div>
                          </div>
                         
                          <div class="row">
                          <div class="col-sm-6">
                            <a href="<?php echo base_url(). 'index.php/admin/supplier/index'; ?>" class="btn btn-warning btn-user btn-block"> Cancel
                            </a>
                          </div>
                           <div class="col-sm-6">
                            <input type="submit" value="Save" class="btn btn-primary btn-user btn-block">
                          </div>
                          </div>
                          
                        </form>
                      </div>
                      <div class="col-sm-3">
                      </div>
                      
                    </div>
                  </div>

                </div>

              </div>
              <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
          </div>
          <!-- End of Content Wrapper -->




          <!-- Footer -->
          <footer class="sticky-footer bg-white">
            <div class="container my-auto">
              <div class="copyright text-center my-auto">
                <span>Copyright &copy; Your control stock 2019</span>
              </div>
            </div>
          </footer>
          <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

      </div>
      <!-- End of Page Wrapper -->

      <!-- Scroll to Top Button-->
      <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
      </a>

      <!-- Logout Modal-->
      <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
              <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
              <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
              <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
          </div>
        </div>
      </div>

      <!-- Bootstrap core JavaScript-->

      <script src="<?php echo base_url('assets/jquery/jquery.min.js') ?>"></script>
      <script src="<?php echo base_url('assets/bootstrap/js/bootstrap.bundle.min.js') ?>"></script>
      <script src="<?php echo base_url('assets/jquery-easing/jquery.easing.min.js') ?>"></script>


      <!-- Custom scripts for all pages-->
      <script src="<?php echo base_url('js/sb-admin-2.min.js') ?>"></script>


      <!-- Page level plugins -->
      <script src="<?php echo base_url('assets/chart.js/Chart.min.js') ?>"></script>


      <!-- Page level custom scripts -->
      <script src="<?php echo base_url('js/demo/chart-area-demo.js') ?>"></script>
      <script src="<?php echo base_url('js/demo/chart-pie-demo.js') ?>"></script>


    </body>

    </html>



