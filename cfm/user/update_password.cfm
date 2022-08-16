<cfinclude template="header.cfm" runOnce="true">
<cfparam name="message" default="v">
<cfparam name="status" default="v">
<div>   
    <div class="container">
        <h1 class="page-heading">Update Password </h1> 
            <div class="col-lg-12">              
               <div class="card-header p-3">                    
                    <cfif status EQ hash('1','sha')>
                        <div class="alert alert-success alert-dismissible">
                            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a> Password Updated Successfully !!
                        </div>
                        <cfelseif status EQ hash('2','sha')>
                            <div class="alert alert-danger alert-dismissible">
                                <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a> Please Fill All fields !!
                            </div>
                            <cfelseif status EQ hash('3','sha')>
                                <div class="alert alert-danger alert-dismissible">
                                    <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a> Password and Confirm password should be same!!
                                </div>
                    </cfif>
                </div>
                <div class="card-body">
                    <form name="passForm" id="passForm" action="../../cfc/login.cfc?method=updateWebuserPassword" method="post">
                        <div class="row ">                             
                            <div class="form-group">
                                <input type="text" name="old_password" id="old_password" class="form-control" placeholder="Old Password">
                                <p class="oldpassword_alert text-danger"></p>
                            </div>
                            <div class="form-group">
                                <input type="text" name="new_password" id="new_password" class="form-control" placeholder="New Password">
                                <p class="newpassword_alert text-danger"></p>
                            </div>
                            <div class="form-group">
                                <input type="text" name="c_password" id="confirm_password" class="form-control" placeholder="Confirm Password">
                                <p class="confirm_alert text-danger"></p>
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-danger" name="submit" value="Update Password">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</div>
<cfinclude template="footer.cfm" runOnce="true">