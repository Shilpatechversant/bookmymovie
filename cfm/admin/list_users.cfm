<cfinclude template="../header.cfm" runOnce="true">
    <cfparam name="message" default="v">
        <cfparam name="status" default="v">
            <cfset user_res=application.user.allUsers()>
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Manage Users</h1>
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 "></div>
                        <div class="card-body">
                            <div class="col-md-12">
                                <div class="table-responsive" id="tableList" width="100%">
                                    <table class="table table-bordered" id="example" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Email</th>
                                                <th>Registered On</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Email</th>
                                                <th>Registered On</th>
                                                <th>Delete</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <cfoutput query='user_res'>
                                                <tr>
                                                    <td>#user_email#</td>
                                                    <td>#registered_on#</td>
                                                    <td>
                                                        <a href="../../cfc/login.cfc?method=deleteUser&id=#id#" class="btn btn-outline-primary">Delete</a>
                                                    </td>
                                                </tr>
                                            </cfoutput>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
                </div>
                <!-- End of Main Content -->
                <cfinclude template="../footer.cfm" runOnce="true">