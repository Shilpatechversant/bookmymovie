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
    

     