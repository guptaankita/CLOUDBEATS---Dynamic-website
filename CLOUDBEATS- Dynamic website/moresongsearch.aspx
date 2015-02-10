<%@ Page MasterPageFile="~/Project/Myprojectmasterpage.master" Language="C#" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <!---In this page I making nested API calls , to retreive track information, lyrics of the track and tracks similar to this track,
    I am using Last Fm API, Lyrics n Music API here.-->
</asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">


    <!-- 'ul' is used to display the result-->
    <ul class="songsearch"></ul>
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="../javascript/jquery-1.11.0.js"></script>
    <script type="text/javascript">

        <!--API call is made to Last FM API, to retreive data about the track-->
        $(document).ready(function () {
            var param =
                {
                    api_key: "a1276d2c36045bff5015cb7b0c272887",
                    method: "track.getinfo",
                    track: "<%= Request.Params["track"] %>",
                    artist: "<%= Request.Params["artistid"] %>",
                    autocorrect:"1",

                    format: "json",


                };
                $.ajax({
                    url: "http://ws.audioscrobbler.com/2.0/?",
                    data: param,
                    dataType: "jsonp",
                    timeout: 5000,
                    error: function (x, status, error) {
                        alert(status);
                        var message = "<h1><span>Try Again Later</span></h1>";
                        $('.songsearch').append(message);
                    },

                    success: function (response) {
                        $('.songsearch').append('<div><b>Track Information</b></div>');
                  
                        console.log(response);
                        if (response.error != undefined) {
                            $('.songsearch').append('<h1><b>No information available</b></h1>');
                          

                        }
                        else {
                        //lyricssearch() function is called, to retreieve the lyrics of the track..
                            lyricssearch();
                         
                           var name = response.track.artist.name;
                           if (response.track.wiki != undefined) {
                               var w = response.track.wiki;

                               var cont = response.track.wiki.content;
                               var publ = response.track.wiki.published;
                               if(cont!=undefined|| publ!=undefined||name!=undefined)
                               $('.songsearch').append('<h1><span><b>Artist of the track:</b>&nbsp;&nbsp;' + name + '</span></h1><li><p>' + cont + '</p></li><span><b>Release Date of the track:</b>&nbsp;&nbsp;' + publ + '</span>');
                               else
                                   $('.songsearch').append('<h1>Sorry no information available</h1>');

                           }

                       
                           else {
                               $('.songsearch').append('<h1>Sorry no information available</h1>');

                           }

                      

                           }

                      
                    }
                });


            
        });

        //function , which makes an Ajax call to 'lyricsnmusic api' to retreive the lyrics of the track..
        function lyricssearch() {
            var param =
            {
                api_key: "99833e47be7f02113710683d997512",

                track: "<%= Request.Params["track"] %>",
                    artist: "<%= Request.Params["artistid"] %>",
                    page: "1",
                    per_page: "1",

                    format: "json",


                };
                $.ajax({
                    url: "http://api.lyricsnmusic.com/songs?",
                    data: param,
                    dataType: "jsonp",
                    timeout: 5000,
                    error: function (x, status, error) {
                        alert(status);
                        var message = "<h1><span>No information avaliable rightnow</span></h1>";
                        $('.songsearch').append(message);
                    },

                    success: function (response) {
                   
                        console.log(response);

                        if (response.data[0] != undefined) {
                            findsimilar();

                            var title = response.data[0].title;

                            var l = response.data[0].snippet;
                            var more = response.data[0].url;

                            if (l != undefined || title != undefined || more != undefined) {
                                $('.songsearch').append('<h1><b>' + title + ' lyrics</b></h1>');


                                $('.songsearch').append('<li><div><p>' + l + '</p><a href="' + more + '" target= "_blank">Click to have full lyrics </a></div></li>');

                            }
                            else {
                                $('.songsearch').append('<h1>Sorry No lyrics available</h1>');

                            }
                        }

                        else {
                            $('.songsearch').append('<h1>Sorry No lyrics available</h1>');

                        }



                     


                    }
                });




            }

        //here in this function an Ajax call is made to Last Fm API, to retreive tracks similar to this track.
        function findsimilar() {
            var param =
            {
                api_key: "a1276d2c36045bff5015cb7b0c272887",
                method: "track.getSimilar",
                track: "<%= Request.Params["track"] %>",
                artist: "<%= Request.Params["artistid"] %>",
                limit:"10",

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
                    $('.songsearch').append(message);
                },

                success: function (response) {
              
                    $('.songsearch').append('<div><b>You might also like the following tracks</b></div>');
                    console.log(response);
               

                    if (response.similartracks.track.length != 0) {
                        for (var i = 0; i < response.similartracks.track.length; i++) {

                            if (response.similartracks.track[i].mbid != "")
                                {
                            var song = response.similartracks.track[i];
                            if (song != undefined) {
                                var cont = song.name;
                                var artistname = song.artist.name;
                                var publ = song.image[2]["#text"];

                                if (cont != undefined || artistname != undefined || publ != undefined) {
                                    if (publ == "") {
                                        publ = "../images/noimage.jpg";
                                    }

                                    $('.songsearch').append('<li><a href="songsearch.aspx?term=' + cont + '" target= "_blank">' + cont + '</a><img src="' + publ + '"/><span>Artist:<a href="searchartist.aspx?term=' + artistname + '" target= "_blank">' + artistname + '</a></span></li>');
                                }

                                else {
                                    $('.songsearch').append('<h1>Sorry no track found</h1>');

                                }


                            }
                            else {
                                $('.songsearch').append('<h1>Sorry no track found</h1>');

                            }

                            }
                            else {
                                $('.songsearch').append('<h1>Sorry no track found</h1>');

                            }
                      
                            
                        }
                        
                    }

                    else {
                        $('.songsearch').append('<h1>Sorry no tracks found similar to this track</h1>');

                    }
                }
            });


        }

          
    </script>

    
 
 
</asp:Content> 
