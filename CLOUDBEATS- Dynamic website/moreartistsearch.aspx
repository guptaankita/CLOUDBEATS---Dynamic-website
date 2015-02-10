 <%@ Page MasterPageFile="~/Project/Myprojectmasterpage.master" Language="C#" %>


<asp:Content ID="ContentHead" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>


        <asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">


    <ul class="artistsearch"></ul>
   
    <ul class="nobk"></ul>
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="../javascript/jquery-1.11.0.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            var param =
                   {
                       api_key: "a1276d2c36045bff5015cb7b0c272887",
                       method: "artist.getInfo",

                       artist: "<%= Request.Params["artist"] %>",

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
                    var message = "<h1><span>No information avaliable rightnow</span></h1>";
                    $('.artistsearch').append(message);
                },

                success: function (response) {
                
                   
                    if (response.artist.mbid != undefined || response.artist.mbid != "")
                     {
                
                    var w = response.artist.bio;
                    var name = response.artist.image[2]["#text"];
                      gettoptracks();


                    if (w != undefined) {
                        var cont = w.content;
                        if (name != undefined) {
                            $('artistsearch').append('<div><img src="' + name + '"</></div>');
                        }
                        $('.artistsearch').append('<li><p>' + cont + '</p></li>');

                        }
                        else {
                            $('.artistsearch').append('<h1>Sorry no information available</h1>');

                        }
                    }
                    
                 else {
                     $('.artistsearch').append('<h1><p>Sorry no information available</h1>');

                 }

                }
            });




        });


        function gettoptracks() {

            var param =
                  {
                      api_key: "a1276d2c36045bff5015cb7b0c272887",
                      method: "artist.getTopTracks",

                      artist: "<%= Request.Params["artist"] %>",

                      limit:"6",
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
                          
                           $('.nobk').append('<div><h1><b>TOP TRACKS BY THIS ARTIST</b></h1></div>');
                           $('.nobk').append('<tr>');
                           if (response.toptracks.track.length != 0) {
                               getsimilarartist();

                               for (var i = 0; i < response.toptracks.track.length; i++) {
                                   var trackeach = response.toptracks.track[i];
                                   if (trackeach.mbid != "") {
                                       var tname = trackeach.name;
                                       var timg = trackeach.image[2]["#text"];
                                       if (tname != undefined) {
                                           if (timg == "" || timg == undefined) {
                                               timg = "../images/noimage.jpg";
                                           }

                                           $('.nobk').append('<th><li><img src="' + timg + '"></li><li><a href="songsearch.aspx?term=' + tname + '" target= "_blank">' + tname + '</a></li></th>');
                                       }

                                       else {
                                           $('.nobk').append('<th><li>Sorry no information available</li>');

                                       }
                                   }
                                   else {
                                       $('.nobk').append('<th><li>Sorry no information available</li>');

                                   }

                               }
                           }
                           else {

                               $('.nobk').append('<th><li>Sorry no information available</li></th>');

                           }
                           
                           $('.nobk').append('</tr>');


                       }
                   });



        }
        function getsimilarartist() {

            var param =
                  {
                      api_key: "a1276d2c36045bff5015cb7b0c272887",
                      method: "artist.getSimilar",

                      artist: "<%= Request.Params["artist"] %>",
                      autocorrect: "1",
                      limit:"6",
                    
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
                          $('.nobk').append('<div><h1><b>You Might Also Like Following Artist</b></h1></div>');
                          $('.nobk').append('<tr>');
                         
                          if (response.similarartists.artist.length != 0) {
                              for (var i = 0; i < response.similarartists.artist.length; i++) {
                                  if (response.similarartists.artist[i].mbid != "") {
                                      var eachartist = response.similarartists.artist[i];
                                      var name = eachartist.name;
                                      var img = eachartist.image['2']["#text"];
                                      if (name != undefined) {
                                          if (img == "" || img == undefined) {
                                              img = "../images/noimage.jpg";
                                          }

                                          $('.nobk').append('<th><li><img src="' + img + '"></li><li><a href="searchartist.aspx?term=' + name + '" target= "_blank">' + name + '</a></li></th>');
                                      }
                                      else {
                                          $('.nobk').append('<th><li>Sorry no information available</li>');

                                      }
                                  }
                                  else {
                                      $('.nobk').append('<th><li>Sorry no information available</li>');

                                  }

                              }
                          }
                          else {
                              $('.nobk').append('<th><li>Sorry no information available</li>');


                          }
                            

                          
                          $('.nobk').append('</tr>');

                      }
                  });



              }

         </script>

    
 
 
</asp:Content> 
