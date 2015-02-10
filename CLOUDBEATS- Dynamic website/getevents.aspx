<%@ MasterPageFile="~/Project/Myprojectmasterpage.master" Language="C#" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">

    <title>Music Search</title>
    <style>
      
    </style>
        </asp:Content>
 <asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
      <h1>Enter the location</h1>
         <div id="searchDiv">

    <input type="text" id="textbox" class="textartist" />
    <input type="button" id="mybutton" class="btnfetchdetails" value="Get Events"  />
</div>

    <ul class="answergeo"></ul>
  
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="../javascript/jquery-1.11.0.js"></script>
    <script type="text/javascript">


        $(document).ready(function () {
            document.getElementById("mybutton").onclick = function () {

                var text = $(".textartist").val();
                if (/^[A-Za-z\s]+$/.test(text)) {
                    getgeoevent(text);


                }
                else {
                    $('.answergeo').append('<div>Enter a valid location</div>');
                }
            }
            $('.textartist').keydown(function (e) {
                var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                if (key == 13) {
                    e.preventDefault();
                    var text = $(".textartist").val();
                    if (/^[A-Za-z\s]+$/.test(text)) {
                        getgeoevent(text);


                    }
                    else {
                        $('.answergeo').append('<div>Enter a valid location</div>');
                    }

                }
            });


        });





        function getgeoevent(text) {

            var param =
                {
                    api_key: "a1276d2c36045bff5015cb7b0c272887",
                    method: "geo.getEvents",

                    location: text,
                
                    limit: "6",
                    format: "json",


                };
            $.ajax({
                url: "http://ws.audioscrobbler.com/2.0/?",
                data: param,
                dataType: "jsonp",
                timeout: 5000,
                error: function (x, status, error) {

                    console.log(status);

                    $('.answergeo').append('<div> API down at this moment</div>');


                },

                success: function (response) {
                
                    console.log(response);
                    if (response.error != undefined) {
                        $('.answergeo').append('<h1><b>No information available</b></h1>');


                    }

                    else {
                        if (response.events.event.length != 0) {
                            for (var i = 0; i < response.events.event.length; i++) {

                                var event = response.events.event[i];
                                var start = Date(event.startDate);
                                var end = Date(event.endDate);
                                var title = event.title;

                                var img = event.image[2]["#text"];
                                if (img == "" || img == undefined) {
                                    img = "../images/noimage.jpg";
                                }

                                if (event.venue != undefined) {
                                    var vname = event.venue.name;

                                    var vweb = event.venue.website;
                                }





                                if (event.venue.location != undefined) {
                                    var city = event.venue.location.city;
                                    var country = event.venue.location.country;
                                    var street = event.venue.location.street;
                                    var postalcode = event.venue.location.postalcode;
                                }


                                if (start != undefined || end != undefined || title != undefined || event.venue != undefined || event.venue.location != undefined) {
                                    $('.answergeo').append('<li>Event:&nbsp;&nbsp;' + (i + 1) + '</li>');

                                    $('.answergeo').append('<li><img src="' + img + '"</></li>');

                                    $('.answergeo').append('<li><span>Title:&nbsp;&nbsp;' + title + '</span></li>');
                                    $('.answergeo').append('<li><span>Start Date:&nbsp;&nbsp;' + start + '</span></li>');
                                    $('.answergeo').append('<li><span>End Date:&nbsp;&nbsp;' + end + '</span></li>');

                                    $('.answergeo').append('<li><span>Venue Detail:&nbsp;&nbsp;</span><span>' + vname + '&nbsp;</span><span>' + street + '&nbsp;</span><span>' + city + '&nbsp;</span><span><u>Venue Website:</u> &nbsp;<a href="' + vweb + '">' + vname + '</a><span></li>');
                                    $('.answergeo').append('</br></br>');





                                }
                                else {
                                    $('.answergeo').append('<h1>No information available</h1>');

                                }
                            }
                        }

                        else {
                            $('.answergeo').append('<h1>No information available</h1>');


                        }


                    }
                    
                }

            });






        }
          
        
        </script>
        </asp:Content>
