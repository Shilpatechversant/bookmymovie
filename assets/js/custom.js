function validateScreenForm() { 
     
    let sname = document.forms["screenForm"]["screen_name"].value; 
    let grate = document.forms["screenForm"]["gold_rate"].value;   
    let srate = document.forms["screenForm"]["silver_rate"].value;        

    if (sname == "") { 
      alert("Screen name must be filled out");
      event.preventDefault();
      return false;
    }
    if (grate == "") {  
        alert("Gold rate name must be filled out");
        event.preventDefault();
        return false;
      }
      if (srate == "") {  
        alert("Silver rate name must be filled out");
        event.preventDefault();
        return false;
      }    

    return true;          
  }
 
 
 const editData = (id) => {  
        $.ajax({
            url: "../../cfc/theatre.cfc",
            type: "post", 
            dataType: "json",
            data: {
                method: "getContact",
                id
            },
            success: function (data){             
                if(data && data.length){                
                    $('#f1').val(data[0].theatre_name);
                    $('#email1').val(data[0].theatre_email); 
                    $('#phone1').val(data[0].theatre_phone);              
                    $('#ad1').val(data[0].theatre_address);
                    $('#st1').val(data[0].theatre_street);   
                    $('#pn1').val(data[0].theatre_pincode);                  
                    $('#id').val(data[0].id);  
                    $('#old_image').val(data[0].image);                                                                            
                    $('#AddTheatreModal').modal('show');
                }
            }
        });
      }

    function validateEmail()
      {  
     
      var email_id= document.getElementById("email1").value;    
      $.ajax({   
            url: "../../cfc/theatre.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"getEmailData",
            email:email_id              
            },
            success: function(data)
            {
                  console.log(data);            
                  if(data.RECORDCOUNT==1)
                  {
                  $('.email_alert').text('Email Already Exists!!');
                  $('#r_btn').prop('disabled', true);
                  }
                  else{
                  $('.email_alert').text(" ");
                  $('#r_btn').prop('disabled', false);
                  }                         
            }         
      });       
      }
        function validatePhone()
      {  
     
      var phone_id= document.getElementById("phone1").value;    
      $.ajax({   
            url: "../../cfc/theatre.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"getPhoneData",
            phone:phone_id              
            },
            success: function(data)
            {
                console.log(data);            
                if(data.RECORDCOUNT==1)
                {
                $('.phone_alert').text('Phone Already Exists!!');
                $('#r_btn').prop('disabled', true);
                }
                else{
                $('.email_alert').text(" ");
                $('#r_btn').prop('disabled', false);
                }                         
            }         
      });       
      }



      function printTable() {
    
        var printContents = document.getElementById('tableData').innerHTML;    
        var originalContents = document.body.innerHTML;   
        document.body.innerHTML = printContents;   
        window.print(); 
        //document.body.innerHTML = originalContents;
    }
    function selectElementContents(el) {
        var body = document.body, range, sel;
        if (document.createRange && window.getSelection) {
            range = document.createRange();
            sel = window.getSelection();
            sel.removeAllRanges();
            try {
                range.selectNodeContents(el);
                sel.addRange(range);
            } catch (e) {
                range.selectNode(el);
                sel.addRange(range);
            }
            document.execCommand("copy");
    
        } else if (body.createTextRange) {
            range = body.createTextRange();
            range.moveToElementText(el);
            range.select();
            range.execCommand("Copy");
        }
    }
    
        $(document).ready(function() {
            $('#example').DataTable( {
                dom: 'Bfrtip',
                buttons: [
                    'copy',  
                    {
                        extend: 'excelHtml5',
                        exportOptions: {
                            columns: [ 1, 2, 3, 4 ]
                        }
                    },
                    {
                        extend: 'csvHtml5',
                        exportOptions: {
                            columns: [ 1, 2, 3, 4 ]
                        }
                    },
                    {
                        extend: 'pdfHtml5',
                        exportOptions: {
                            columns: [ 1, 2, 3, 4 ]
                        }
                    },
                    'print', 'colvis'
                ]
            } );
        } );

        const editScreenData = (id) => {  
            $.ajax({
                url: "../../cfc/screen.cfc",
                type: "post", 
                dataType: "json",
                data: {
                    method: "getScreen",
                    id
                },
                success: function (data){             
                    if(data && data.length){                
                        $('#s1').val(data[0].screen_name);
                        $('#gold_rate').val(data[0].gold_rate); 
                        $('#silver_rate').val(data[0].silver_rate);                                     
                        $('#id').val(data[0].id);  
                        $('#theate_id').val(data[0].theatre_id);                                                                            
                        $('#AddScreenModal').modal('show');
                    }
                }
            });
          }
          
          function validateScreenTimeForm() { 

                let screen = document.forms["screenTimeForm"]["screens"].value; 
                let sname = document.forms["screenTimeForm"]["show_name"].value;   
                let stime = document.forms["screenTimeForm"]["start_time"].value;        
            
                if (sname == "")
                 { 
                    alert("Show name must be filled out");
                    event.preventDefault();
                    return false;
                }
                if (screen == "") 
                {  
                    alert("Screen must be filled out");
                    event.preventDefault();
                    return false;
                }
                if (stime == "") 
                {  
                    alert("Start time must be filled out");
                    event.preventDefault();
                    return false;
                }       
                return true;          
          }
          const editScreenTimeData = (id) => {  
            $.ajax({
                url: "../../cfc/screentime.cfc",
                type: "post", 
                dataType: "json",
                data: {
                    method: "getScreenTime",
                    id
                },
                success: function (data){             
                    if(data && data.length){             
                        $('#theate_id').val(data[0].theatre_id); 
                        $('#show_name[value="'+data[0].show_name+'"]').attr("selected", "selected"); 
                        $('#screens[value="'+data[0].screen_id+'"]').attr("selected", "selected");                    
                        $('#start_time').val(data[0].show_time);                                     
                        $('#stid').val(data[0].id);                                                                                                  
                        $('#AddScreenTimeModal').modal('show');
                    }
                }
            });
          }

          function validateMovieForm() { 

            
            return true;          
      }

          

   
        



    

     