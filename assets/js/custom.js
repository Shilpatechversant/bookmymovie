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

  function validateContactForm()
  {
      alert("zfszdg");
    let image = document.forms['contactform']['file']; //fetched the input element and have stored in image variable.
    let allowedMimes = ['png', 'jpg', 'jpeg']; //allowed image mime types
    let maxMb = 1; //maximum allowed size (MB) of image

    if (!image.value) { // if the image input does not have value
         alert('No image selected :(');
        event.preventDefault();
        return false;
    }
    else {
        let mime = image.value.split('.').pop(); // get the extension/mime of image file
        if (!allowedMimes.includes(mime)) {  // if allowedMimes array does not have the extension
            alert("Only png,jpg,jpeg alowed");
            event.preventDefault();
            return false;
        }
        else {
            let kb = image.files[0].size / 1024; // convert the file size into byte to kb
            let mb = kb / 1024; // convert kb to mb
            if (mb > maxMb) { // if the file size is gratter than maxMb
                alert(`Image should be less than ${maxMb} MB`);
                event.preventDefault();
                return false;
            }
            else { // if all the validations are good
              return true;
            }
        }
    }
  }

  function showError(errorMessage) {
        alert(errorMessage);
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

  $('#Stheatre').change(function(){ 
    var theatreID = $(this).val(); 
    if(theatreID != ''){
        $.ajax({
            type:'POST',
            url:"../../cfc/screen.cfc",
                dataType: "json",
                data: {
                    method: "getThScreen",
                    'id':theatreID
                },              
                success:function(data) {  
                    $('select[name="th_screen"]').empty();
                    $('select#th_screen').append($('<option>').text("--Select--"));
                    $.each(data, function(key, value) {  
                        $('#th_screen').append($('<option>').text(value.screen_name).attr('value', value.screen_id));
                    });
                }
        }); 
    }else{
        $('#th_screen').html('<option value="">Select Theatre first</option>'); 
    }
});

$('#th_screen').change(function(){ 
    alert("fxgvc");
    var screenID = $(this).val(); 
    console.log(screenID);
    if(screenID != ''){
        $.ajax({
            type:'POST',
            url:"../../cfc/screen.cfc",
                dataType: "json",
                data: {
                    method: "getScreenTimes",
                    'id':screenID
                },              
                success:function(data) {  
                    $('select[name="th_shows"]').empty();
                    $('select#th_shows').append($('<option>').text("--Select--"));
                    $.each(data, function(key, value) {  
                        $('#th_shows').append($('<option>').text(value.show_name).attr('value', value.id));
                    });
                }
        }); 
    }else{
        alert("no no");
        $('#th_shows').html('<option value="">Select Screen first</option>'); 
    }
});


const editShowData = (id) => {  
    $.ajax({
        url: "../../cfc/shows.cfc",
        type: "post", 
        dataType: "json",
        data: {
            method: "getShowDetails",
            showId:id
        },
        success: function (data){             
            if(data && data.length){                 
                                                    
                //console.log(data);                       
                $("#movie option[value='"+data[0].m_id+"']").attr("selected", "selected");
                $("#Stheatre option[value='"+data[0].t_id+"']").attr("selected", "selected");                
                editScreenList(data[0].s_id);                
                editTimeList(data[0].st_id,data[0].s_id);                                                              
                $('#plan_end_date').val(data[0].end_date);   
                $('#total_seats').val(data[0].total_seats);  
                $("#show_priority option[value='"+data[0].priority+"']").attr("selected", "selected");           
                $('#upid').val(id);                                                                              
                $('#AddShowTimeModal').modal('show');
            }
        }
    });
  }

  function editScreenList(screen_id)
{
    alert("ssdf");
    var id=$('#Stheatre').val();
    
    if(id!="")
    {        
        $.ajax({   
            url: "../../cfc/screen.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"getThScreen",
              id:id           
            },
            success:function(data) {  
                $('select[name="th_screen"]').empty();              
               
                $.each(data, function(key, value) {                     
                    $('#th_screen').append($('<option>').text(value.screen_name).attr('value', value.screen_id));
                });
                $("#th_screen option[value='"+screen_id+"']").attr("selected", "selected");
            }  
        });       
    }
    else{
        $('#th_screen').html('<option value="">Select Screen</option>'); 
    }
}

function editTimeList(screen_time_id,sc_id){    
    var th_sc_id=$('#Stheatre').val();     
    if(sc_id!="")
    {        
        $.ajax({   
            url: "../../cfc/screen.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"screenTimeDetails",
              theatre_id:th_sc_id,
              screen_id:sc_id           
            },
            success:function(data) {  
                $('select[name="th_shows"]').empty();
        
                $.each(data, function(key, value) {  
                    $('#th_shows').append($('<option>').text(value.show_name).attr('value', value.id));
                });
                $("#th_shows option[value='"+screen_time_id+"']").attr("selected", "selected");
            }  
        });       
    }
    $('#th_shows').html('<option value="">Select Show</option>'); 
}



  



          

   
        



    

     