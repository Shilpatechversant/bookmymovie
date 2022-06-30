             <script src="../../assets/js/custom.js"></script>  
                    <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
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
                    <a class="btn btn-primary" href="../../cfc/logout.cfc?id=logout">Logout</a>
                </div>
            </div>
        </div>
    </div>

    
    <!-- Theatre Modal-->
    <div class="modal fade" id="TheatreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add New Theatre</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="../../cfc/logout.cfc?id=logout">Save</a>
                </div>
            </div>
        </div>
    </div>

    <!--Add theatre Modal-->
      <!-- Modal -->
        <div class="modal fade" id="AddTheatreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">               
                    <div class="modal-header center">
                        <h4><center>Add Theatre</center></h4>                                
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                      <image src="../../assets/images/theatre1.jpg" class="theatre-div float-right"> 
                        <form method="post" action="../../cfc/theatre.cfc?method=addTheatre" name="contactform" enctype="multipart/form-data" onsubmit="return validateContactForm()">
                            <div class="row">                               
                                <div class="col-md-4">
                                    <label  for="TheatreName">Theatre Name*</label>
                                    <input name="theatre_name" type="text" id="f1" class="form-control" required>
                                </div>
                                <div class="col-md-4">
                                    <label for="email">Email*</label>
                                    <input name="theatre_email" type="email" id="email1" class="form-control" onchange="validateEmail();" required/>
                                     <p class="email_alert text-danger"></p>
                                </div>
                                <div class="col-md-3">
                                    <label for="phone">Phone*</label>
                                    <input name="phone" type="text" id="phone1" class="form-control" onchange="validatePhone();" required/>
                                       <p class="phone_alert text-danger"></p>
                                </div>                                                    
                            </div>                           
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <label for="pImage">Upload Photo</label>
                                    <input name="file" type="file" accept=".jpeg,.png,.gif,.jpg" id="pImage" class="form-control" />
                                    <div id="imagecontent">
                                    </div>                            
                                </div>
                            </div>
                            <div class="row mt-4">                               
                                <div class="col-md-3">
                                    <label for="address">Address</label>
                                    <input name="address" type="text" id="ad1" class="form-control" />
                                </div>
                                <div class="col-md-3">
                                    <label for="street">Street</label>
                                    <input name="street" type="text" id="st1" class="form-control" />
                                </div>
                                <div class="col-md-3">
                                    <label for="LastName">Pincode*</label>
                                    <input name="pincode" id="pn1" type="text" id="pincode" class="form-control" required>
                                </div>
                         
                                <input type="hidden" name="id"  id="id" value="0" /> 
                                  <input type="hidden" name="old_image"  id="old_image" value="0" /> 
                            </div>                               
                        </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" id="s_btn">Save changes</button>
                    </div>
                    </form>  
                </div>
            </div>
        </div>    
       <!-- Modal -->    
    
    <!-- Bootstrap core JavaScript-->
    <script src="../../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../../resources/js/sb-admin-2.min.js"></script>



    <!-- Page level plugins -->
    <script src="../../resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="../../resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../../resources/js/demo/datatables-demo.js"></script>
      <!-- user level custom scripts -->

          <!-- Custom scripts datatable for all pages-->

    <script src="../../resources/vendor/tabledata/buttons/js/dataTables.buttons.min.js"></script>
    <script src="../../resources/vendor/tabledata/JSZip-2.5.0/jszip.min.js"></script>
    <script src="../../resources/vendor/tabledata/pdfmake/pdfmake.min.js"></script>
    <script src="../../resources/vendor/tabledata/pdfmake/vfs_fonts.js"></script>
    <script src="../../resources/vendor/tabledata/buttons/js/buttons.html5.min.js"></script>
   

    </body>

</html>

