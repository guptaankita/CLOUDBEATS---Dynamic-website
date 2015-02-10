<%@ MasterPageFile="~/Project/Myprojectmasterpage.master" Language="C#" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
        </asp:Content>
 <asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">


  
    <ul class="nobk"></ul>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="../javascript/jquery-1.11.0.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            var param =
                {
                    api_key: "a1276d2c36045bff5015cb7b0c272887",
                    method: "tag.getTopTracks",

                    tag: "Pop",

                    limit: "5",
                    format: "json",


                };
            $.ajax({
                url: "http://ws.audioscrobbler.com/2.0/?",
                data: param,
                dataType: "jsonp",
                timeout: 5000,
                error: function (x, status, error) {
                    alert(status);
                    var message = "<h1><span>No information avaliable rightnow</span></h1>";
                    $('.nobk').append(message);
                },


                success: function (response) {
                    $('.nobk').append('<div><h1><b>TOP TRACKS BY GENRE</b></h1></div>');
                    $('.nobk').append('<div><h1><i>Click on the track name to know more about the track</i></h1></div>');
                    console.log(response);
                    $('.nobk').append('<li><h2><b>POP:</b></h2></li>');
                    $('.nobk').append('<tr>');
                    
                    if (response.toptracks.track.length != 0)
                    {
                        addone();

                        for (var i = 0; i < response.toptracks.track.length; i++) {

                            var eachtrack = response.toptracks.track[i];
                            if (eachtrack.mbid != "") {
                                var img = eachtrack.image['2']["#text"];
                                var name = eachtrack.name;
                                if (name != undefined) {
                                    if (img == "" || img == undefined) {
                                        img = "../images/noimage.jpg";
                                    }
                                    

                                    $('.nobk').append('<th><li><img src="' + img + '"></li><li><a href="songsearch.aspx?term=' + name + '" target= "_blank">' + name + '</a></li></th>');
                                }

                                else {
                                    $('.nobk').append('<th><h1>No information available</h1></th>');

                                }
                            }
                            else{
                                $('.nobk').append('<th><h1>No information available</h1></th>');

                            }
                        }
                    }
                    else{
                        $('.nobk').append('<th><h1>No information available</h1></th>');


                    }
                            $('.nobk').append('</tr>');

                        

                    
                }
            });
        });

        function addone()
        {

            var param =
                {
                    api_key: "a1276d2c36045bff5015cb7b0c272887",
                    method: "tag.getTopTracks",

                    tag: "New Age",

                    limit: "5",
                    format: "json",


                };
            $.ajax({
                url: "http://ws.audioscrobbler.com/2.0/?",
                data: param,
                dataType: "jsonp",
                timeout: 5000,
                error: function (x, status, error) {
                    alert(status);
                    var message = "<h1><span>No information avaliable rightnow</span></h1>";
                    $('.nobk').append(message);
                },

                success: function (response) {
                 
                    console.log(response);
                    $('.nobk').append('<li><h2><b>NEW AGE:</b></h2></li>');
                    $('.nobk').append('<tr>');


                    for (var i = 0; i < response.toptracks.track.length; i++) {

                        var eachtrack = response.toptracks.track[i];
                        if (eachtrack.mbid != "") {
                            var name = eachtrack.name;
                            if (eachtrack.image['2']["#text"] != undefined) {
                                var img = eachtrack.image['2']["#text"];

                                $('.nobk').append('<th><li><img src="' + img + '"></li><li><a href="songsearch.aspx?term=' + name + '" target= "_blank">' + name + '</a></li></th>');
                            }
                            else {
                                $('.nobk').append('<th><li><span>No image available</span></li><li><a href="songsearch.aspx?term=' + name + '" target= "_blank">' + name + '</a></li></th>');

                            }
                        }
                    }
                    $('.nobk').append('</tr>');


                }
            });


            var param1 =
                {
                    api_key: "a1276d2c36045bff5015cb7b0c272887",
                    method: "tag.getTopTracks",

                    tag: "Romantic",

                    limit: "5",
                    format: "json",


                };
            $.ajax({
                url: "http://ws.audioscrobbler.com/2.0/?",
                data: param1,
                dataType: "jsonp",
                timeout: 5000,
                error: function (x, status, error) {
                    alert(status);
                    var message = "<h1><span>No information avaliable rightnow</span></h1>";
                    $('.nobk').append(message);
                },

                success: function (response) {
             
                    console.log(response);
                    $('.nobk').append('<li><h2><b>ROMANTIC:</b></h2></li>');
                    $('.nobk').append('<tr>');


                    for (var i = 0; i < response.toptracks.track.length; i++) {

                        var eachtrack = response.toptracks.track[i];
                        if (eachtrack.mbid != "") {
                            var name = eachtrack.name;
                            if (eachtrack.image['2']["#text"] != undefined) {
                                var img = eachtrack.image['2']["#text"];

                                $('.nobk').append('<th><li><img src="' + img + '"></li><li><a href="songsearch.aspx?term=' + name + '" target= "_blank">' + name + '</a></li></th>');
                            }
                            else {
                                $('.nobk').append('<th><li><span>No image available</span></li><li><a href="songsearch.aspx?term=' + name + '" target= "_blank">' + name + '</a></li></th>');

                            }
                        }
                    }
                    $('.nobk').append('</tr>');


                }
            });



            var param2 =
                {
                    api_key: "a1276d2c36045bff5015cb7b0c272887",
                    method: "tag.getTopTracks",

                    tag: "Soul",

                    limit: "5",
                    format: "json",


                };
            $.ajax({
                url: "http://ws.audioscrobbler.com/2.0/?",
                data: param2,
                dataType: "jsonp",
                timeout: 5000,
                error: function (x, status, error) {
                    alert(status);
                    var message = "<h1><span>No information avaliable rightnow</span></h1>";
                    $('.nobk').append(message);
                },

                success: function (response) {
               
                    console.log(response);
                    $('.nobk').append('<li><h2><b>SOUL:</b></h2></li>');
                    $('.nobk').append('<tr>');


                    for (var i = 0; i < response.toptracks.track.length; i++) {

                        var eachtrack = response.toptracks.track[i];
                        if (eachtrack.mbid != "") {
                            var name = eachtrack.name;
                            if (eachtrack.image['2']["#text"] != undefined) {
                                var newimg = new Image();
                                newimg.src = eachtrack.image['2']["#text"];
                                var width = newimg.width;
                                var img = eachtrack.image['2']["#text"];

                                $('.nobk').append('<th><li><div class="wrap"><img src="' + img + '" class="picture"/></div></li><li><a href="songsearch.aspx?term=' + name + '" target= "_blank">' + name + '</a></li></th>');
                            }
                            else {
                                $('.nobk').append('<th><li><span>No image available</span></li><li><a href="songsearch.aspx?term=' + name + '" target= "_blank">' + name + '</a></li></th>');

                            }
                        }
                    }
                    $('.nobk').append('</tr>');


                }
            });













            }
        </script>
        </asp:Content>