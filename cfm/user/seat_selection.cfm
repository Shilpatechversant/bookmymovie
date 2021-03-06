
<cfinclude  template = "movie_header.cfm"  runOnce = "true">  
 <cfparam  name="cdate" default="v"> 
   <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-lg-12 col-sm-12 col-md-12 text-center">
                    <h1>MOVIE SEAT RESERVATION</h1>
                    <div class='row text-center'>
                        <input type="text" class="form-control input" id="Name" placeholder="Enter Name" >
                        <input type="number" min='0' max='50' class="form-control input" id="Seats" placeholder="Enter number of seats">
                    </div>
                    <div class='row'>
                        <button type="button" id="Selectseat" class="btn btn-success seatsBtn">Select Seats</button>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 bg-primary screen">SCREEN</div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"></div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                            <table id="seatTable" class="table fixed-column td">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>1</th>
                                        <th>2</th>
                                        <th>3</th>
                                        <th>4</th>
                                        <th>5</th>
                                        <th>6</th>
                                        <th>7</th>
                                        <th>8</th>
                                        <th>9</th>
                                        <th>10</th>
                                        <th></th>
                                        <th>11</th>
                                        <th>12</th>
                                        <th>13</th>
                                        <th>14</th>
                                        <th>15</th>
                                        <th>16</th>
                                        <th>17</th>
                                        <th>18</th>
                                        <th>19</th>
                                        <th>20</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>A</td>
                                    </tr>
                                    <tr>
                                        <td>B</td>
                                    </tr>
                                    <tr>
                                        <td>C</td>
                                    </tr>
                                    <tr>
                                        <td>D</td>
                                    </tr>
                                    <tr>
                                        <td>E</td>
                                    </tr>
                                    <tr>
                                        <td>F</td>
                                    </tr>
                                    <tr>
                                        <td>G</td>
                                    </tr>
                                    <tr>
                                        <td>H</td>
                                    </tr>
                                    <tr>
                                        <td>I</td>
                                    </tr>
                                    <tr>
                                        <td>J</td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="button" id="ConfirmSeat" class="btn btn-warning seatsBtn">Confirm Seats</button>
                            <div>
                                <span class="spanBox" style='Background-color:green'></span><label>Selected Seats</label>
                                <span class="spanBox" style='Background-color:red'></span><label>Reserved Seats</label>
                                <span class="spanBox"></span><label>Empty Seats</label>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2"></div>
                    </div>
                </div>
            </div>
            <div class='row'>
                <div class='col-xs-12 col-sm-2 col-md-2 col-lg-2'></div>
                <div class='col-xs-12 col-sm-6 col-md-6 col-lg-6'>
                    <table class='table-striped table table-bordered resultTable'>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>No. of Seats</th>
                                <th>Seats Reserved</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                        </tbody>
                    </table>
                </div>
                <div class='col-xs-12 col-sm-4 col-md-4 col-lg-4'></div>
            </div>
        </div>
    </body>
</html>

<cfinclude  template = "movie_footer.cfm"  runOnce = "true">  