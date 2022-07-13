<cfinclude  template = "../header.cfm"  runOnce = "true"> 
<cfparam  name="message" default="v"> 
<cfparam  name="status" default="v"> 
    <!-- Begin Page Content -->
    <div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Manage Password</h1>    
    <div class="card shadow mb-4 col-lg-4 offset-lg-3 text-center">
        <div class="card-header py-3">            
           <h6 class="font-weight-bold text-dark text-center">Update Password</h6>
           <cfif status EQ hash('1','sha')>
                <div class="alert alert-success alert-dismissible">
                    <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        Password Updated Successfully !!
                </div>
            <cfelseif status EQ hash('2','sha')>
                <div class="alert alert-danger alert-dismissible">
                    <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        Please Fill All fields !!
                </div>
            <cfelseif status EQ hash('3','sha')>
                <div class="alert alert-danger alert-dismissible">
                    <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        Password and Confirm password should be same!!
                </div>   
            </cfif> 
        </div>
        <div class="card-body">
            <form name="passForm" id="passForm" action="../../cfc/login.cfc?method=updatePassword" method="post"> 
                <div class="row ">
                    <div class="form-group">
                    <input type="text" name="old_pass" id="old_pass" class="form-control" placeholder="Old Password">
                    </div>
                    <div class="form-group">
                        <input type="text" name="new_pass" id="new_pass" class="form-control" placeholder="New Password">
                    </div>
                    <div class="form-group">
                        <input type="text" name="c_pass" id="c_pass" class="form-control" placeholder="Confirm Password">
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary" name="submit" value="Update Password">
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>

<cfinclude  template = "../footer.cfm"  runOnce = "true">  