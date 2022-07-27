
       <cfinclude  template = "movie_header.cfm"  runOnce = "true">  
          <!-- Main content -->
        <div class="clearfix"></div>
        <!-- Search bar -->        
        <section class="container">
            <div class="col-sm-12">
                <div class="clearfix"></div>
                <h2 class="page-heading">Register Here</h2>
                       <!-- Main content -->
                <form class="user" 
                       method="post" 
                       name="loginForm" 
                       action="cfc/login.cfc?method=insertuser"
                       onsubmit="return validateClientForm()">
                    <p class="login__title">sign in <br><span class="login-edition">welcome to BookMyMovie</span></p>
                    <div class="field-wrap">
                        <input type='email' placeholder='Email' name='user_email' id="cemail" class="login__input" 
                         onchange="validateClientEmail();" required>
                        <p class="email_alert text-danger"></p>
                        <input type='password' placeholder='Password' name='user_password' class="login__input">
                     </div>
                    <div class="login__control">
                        <button type='submit' id="reg_btn" class="btn btn-md btn--warning btn--wider">sign in</button>                     
                    </div>
                </form>
        
            <div class="clearfix"></div>
       </section>
        <div class="clearfix"></div>
            <footer class="footer-wrapper">
                <section class="container">
                    <div class="clearfix">
                        <p class="copy">&copy;Book MyMovie, 2022. All rights reserved.</p>
                    </div>
                </section>             
            </footer>
        </div>
    <cfinclude  template = "movie_footer.cfm"  runOnce = "true">  


 