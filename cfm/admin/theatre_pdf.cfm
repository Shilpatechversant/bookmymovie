   <cfset d1= application.obj.getpdfdata()> 
     <cfinclude template="../header.cfm" runOnce="true">
     <cfinclude template="sidebar.cfm" runOnce="true">
      <cfinclude template="topbar.cfm" runOnce="true">
             <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Dashboard</h1>          

                         <!-- Content Row -->
                    <div class="row">

   <cfdocument  format="pdf" filename="theatre_data.pdf" overwrite="Yes"> 
    <h3 class="text-center">Theatre List</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th >Photo</th>
                <th >Name</th>
                <th >Email</th>
                <th >Phone</th>
                <th >Address</th>
                
            </tr>
        </thead>
        <cfoutput query="d1">
            <tbody>                
                <cfset addr=theatre_address & ", " & theatre_street & ", " & theatre_pincode &" .">
                <tr>
                    <td><img src="../../#theatre_image#" class="img-fluid" width="100" height="100"></td>
                    <td>#theatre_name#</td>
                    <td>#theatre_email#</td>
                    <td>#theatre_phone#</td>
                    <td>#theatre_address#,#theatre_street#,#theatre_pincode#</td>                    
                </tr>
            </tbody>
        </cfoutput>
    </table>    
</cfdocument>
<cfheader name="Content-Disposition" value="attachment;filename=theatre_data.pdf">
<cfcontent type="application/octet-stream" file="#expandPath('.')#\theatre_data.pdf" deletefile="Yes">
</div>
</div>
<cfinclude template="../footer.cfm" runOnce="true">