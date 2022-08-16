<cfinclude template="header.cfm" runOnce="true">
    <cfparam name="message" default="v">
        <!-- Main content -->
        <div class="clearfix"></div> 
        <section class="container">
            <div class="col-sm-12">
                <div class="clearfix"></div>
                <!-- Form content -->
                <form class="user" method="post" name="loginForm" action="../../cfc/login.cfc?method=checkWebUser">
                    <div class="clearfix"></div>
                    <div class="field-wrap">
                        <h2 class="page-heading">login Here</h2>
                        <label>Email</label>
                        <input type='email' placeholder='Email' autocomplete="off" name='user_email' id="cemail" class="col-sm-12" required>
                        <p class="email_alert text-danger"></p>
                        <label>Password</label>
                        <input type='password' autocomplete="off" placeholder='Password' name='user_password' class="col-sm-12" required>
                        <hr>
                        <button type='submit' class="btn btn-md btn--warning ">Log in</button>
                    </div>
                </form>
                <cfif message EQ hash('4','sha')>
                    <div class="alert alert-danger alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a> Login failed.!!
                    </div>
                </cfif>
                <cfif message EQ hash('5','sha')>
                    <div class="alert alert-success alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a> Login Successfull.!!
                    </div>
                </cfif>
                <cfif message EQ hash('8','sha')>
                    <div class="alert alert-success alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a> Registartion Successfull.Please login!!
                    </div>
                </cfif>
            </div>
            <div class="clearfix"></div>
        </section>
        <footer class="footer-wrapper">
            <section class="container">
                <div class="clearfix">
                    <p class="copy">&copy;Book MyMovie, 2022. All rights reserved.</p>
                </div>
            </section>
        </footer>
</div>
<cfinclude template="footer.cfm" runOnce="true">