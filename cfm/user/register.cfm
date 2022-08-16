<cfinclude template="header.cfm" runOnce="true">
    <cfparam name="message" default="v">
        <!-- Main content -->
        <div class="clearfix"></div>
        <!-- Search bar -->
        <section class="container">
            <div class="col-sm-12">
                <div class="clearfix"></div>
                <!-- Main content -->
                <form class="user" method="post" name="loginForm" action="../../cfc/login.cfc?method=insertData" onsubmit="return validateClientForm()">
                    <div class="clearfix"></div>
                    <div class="field-wrap">
                        <h2 class="page-heading">Register Here</h2>
                        <label>Email</label>
                        <input type='email' placeholder='Email' autocomplete="off" name='user_email' id="useremail" class="col-sm-12" onchange="validateClientEmail();" required>
                        <p class="email_alert text-danger"></p>
                        <label>Password</label>
                        <input type='password' autocomplete="off" placeholder='Password' name='user_password' class="col-sm-12">
                        <hr>
                        <button type='submit' class="btn btn-md btn--warning ">sign in</button>
                    </div>
                </form>
                <cfif message EQ hash('2','sha')>
                    <div class="alert alert-danger alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a> Registration failed.!!
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
    <cfinclude template="movie_footer.cfm" runOnce="true">