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
        
        let movie_name = document.forms["movieForm"]["movie_name"].value; 
        let rdate = document.forms["movieForm"]["release_date"].value;   
        let mformat = document.forms["movieForm"]["movie_format"].value; 
        let genre = document.forms["movieForm"]["genre"].value;
        let lang = document.forms["movieForm"]["language"].value;  
        let duration = document.forms["movieForm"]["duration"].value;   
        let trailer_url = document.forms["movieForm"]["trailer_url"].value;  
        let poster = document.forms["movieForm"]["poster"].value;  
        let wallpaper = document.forms["movieForm"]["wallpaper"].value; 
        let description = document.forms["movieForm"]["description"].value;      
    
        if (movie_name == "")
         { 
            alert("Movie name must be filled out");
            event.preventDefault();
            return false;
        }
        if (rdate == "") 
        {  
            alert("Release Date must be filled out");
            event.preventDefault();
            return false;
        }
        if (mformat == "") 
        {  
            alert("Movie Format must be filled out");
            event.preventDefault();
            return false;
        }  
        if (genre == "") 
        {  
            alert("Movie genre must be filled out");
            event.preventDefault();
            return false;
        }  
        if (lang == "") 
        {  
            alert("Movie Language must be filled out");
            event.preventDefault();
            return false;
        }  
        if (duration == "") 
        {  
            alert("Movie Duration must be filled out");
            event.preventDefault();
            return false;
        }  
        if (trailer_url == "") 
        {  
            alert("Movie Trailer must be filled out");
            event.preventDefault();
            return false;
        }  
 
        if (description == "") 
        {  
            alert("description must be filled out");
            event.preventDefault();
            return false;
        }  
        return true; 

               
      }


      var loadFile = function(event) {
        var reader = new FileReader();
        reader.onload = function(){
          var output = document.getElementById('output');
          output.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
      };
    
    
      var loadPoster = function(event) {
        var reader = new FileReader();
        reader.onload = function(){
          var output = document.getElementById('output');
          output.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
      };
      var loadWallPaper = function(event) {
        var reader = new FileReader();
        reader.onload = function(){
          var output = document.getElementById('output2');
          output.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
      };

      function checkMovie()
   {
       var movie=$('#movie_name').val();            
       $.ajax({   
        url: "../../cfc/movie.cfc",
        type: 'get',
        dataType:"json",
        data:{
        method:"getMovieName",
          movie_name:movie             
        },
        success: function(data)
        {
            console.log(data);            
            if(data.RECORDCOUNT==1)
            {                
                $('.movie_alert').text("Movie Name Already Exists!!");
                $('#mov_btn').prop('disabled', true);                
            }
            else{

                $('.movie_alert').text(" ");
                $('#mov_btn').prop('disabled', false);
            }                         
        }         
    });
       
   }

   function checkTrailerUrl()
   {
       var trailer=$('#trailer_url').val();            
       $.ajax({   
        url: "../../cfc/movie.cfc",
        type: 'get',
        dataType:"json",
        data:{
        method:"getTrailerUrl",
          trailer_name:trailer         
        },
        success: function(data)
        {
            console.log(data);            
            if(data.RECORDCOUNT==1)
            {                
                $('.trailer_alert').text("Trailer Url Already Exists!!");
                $('#mov_btn').prop('disabled', true);                
            }
            else{

                $('.trailer_alert').text(" ");
                $('#mov_btn').prop('disabled', false);
            }                         
        }         
    });
       
   }

   const editMovieData = (id) => {  
    $.ajax({
        url: "../../cfc/movie.cfc",
        type: "post", 
        dataType: "json",
        data: {
            method: "getMovie",
            id
        },
        success: function (data){             
            if(data && data.length){  
                
                                    
                $('#movie_name').val(data[0].movie_name);
                $('#release_date').val(data[0].release_date);
                $('#movie_format').val(data[0].movie_format);                         
                $('#genre').val(data[0].genre);
                $('#language').val(data[0].movie_language); 
                $('#duration').val(data[0].movie_duration);  
                $('#trailer_url').val(data[0].movie_trailer); 
                $('#description').val(data[0].movie_des);    
                $("#output").attr("src", "../../assets/poster/"+data[0].movie_poster);
                $("#output2").attr("src", "../../assets/wallpaper/"+data[0].movie_wallpaper);

           
                           
                $('#id').val(data[0].id);  
                $('#old_image').val(data[0].movie_poster);  
                $('#old_image1').val(data[0].movie_wallpaper);                                                                           
                $('#AddMovieModal').modal('show');
            }
        }
    });
  }

  function   validateCastForm() { 
        
    let character_name = document.forms["castForm"]["character_name"].value; 
    let actor_name = document.forms["castForm"]["actor_name"].value;   
    let actor_photo = document.forms["castForm"]["actor_photo"].value;    

    if (character_name == "")
     { 
        alert("Character name must be filled out");
        event.preventDefault();
        return false;
    }
    if (actor_name == "") 
    {  
        alert("Actor Name must be filled out");
        event.preventDefault();
        return false;
    }
    if (actor_photo== "") 
    {  
        alert("Actor Photo must be filled out");
        event.preventDefault();
        return false;
    }  
   
    return true;
           
  }
  function  validateCrewForm() { 
        
    let role_name = document.forms["crewForm"]["role_name"].value; 
    let person_name = document.forms["crewForm"]["person_name"].value;   
    let crew_photo = document.forms["crewForm"]["crew_photo"].value;    

    if (role_name == "")
     { 
        alert("Role name must be filled out");
        event.preventDefault();
        return false;
    }
    if (person_name == "") 
    {  
        alert("Person Name must be filled out");
        event.preventDefault();
        return false;
    }
    if (crew_photo== "") 
    {  
        alert("Crew Photo must be filled out");
        event.preventDefault();
        return false;
    }  
   
    return true;
           
  }



          

   
        



    

     