<%@ Page MasterPageFile="~/Project/Myprojectmasterpage.master" Language="C#" %>



<asp:Content ID="ContentHead" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">

    <title>Music Search</title>
        </asp:Content>


        <asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">

       


    <ul class="answer"></ul>
    <ul class="secondanswer"></ul>
    <ul class="thirdanswer"></ul>
    <ul class="fourth"></ul>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="../javascript/jquery-1.11.0.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {


            var param =
                {
                    term: "<%= Request.Params["term"] %>",

                    limit: "1"
                };
            $.ajax({
                url: "https://itunes.apple.com/search?",
                data: param,
                dataType: "jsonp",
                error:function(x,status,error)
                {
                    alert(status);
                    var message="<li><span> API down at this moment</span></li>";
                    $('.answer').append(message);
                },
                success: function (response) {
                    arts();
                    findartist();

                    var template = $(".template .listofitems:first-child");
                    var ul = $(".answer");
                    ul.empty();
                    
                    var item = response.results;
                    var id = response.results[0].artistName;
                    var name = response.results[0].previewUrl;
                    var url = response.results[0].artworkUrl100;

                    var instance = template;
                    $('.answer').append('<li><img src="' + url + '"><span>Click on the author name if wish to play the preview work</span><span class="title"><a href="' + name + '" target= "_blank"> ' + id + '</a></span></a></li>');
                    //instance.find(".song_id").html(id);
                    // instance.find(".song_name").html(name);
                    //instance.find("a").attr("href", name);
                  //  console.log(response);


                  
                }
            });
        });
        function arts() {
            alert("inside new function");
                    var param =
               {
                   api_key: "a1276d2c36045bff5015cb7b0c272887",
                   method:"artist.getTopTracks",
                   artist: "<%= Request.Params["term"] %>",

                   format: "json",
                   limit: "10"

               };
                    $.ajax({
                        url: "http://ws.audioscrobbler.com/2.0/?",
                        data: param,
                        dataType: "jsonp",
                        success: function (response) {
                            alert("inside success");
                            for (var i = 0; i < response.toptracks.track.length; i++) {


                                var food = response.toptracks.track[i];
                                var imgarr = food.image[2]["#text"];
                                var name = food.name;



                                $('.secondanswer').append('<li><img src="' + imgarr + '"><span>' + name + '</span></li>');

                                

                            }
                         //   console.log(response);
                            
                            
                        }
                    });
                

}
        function findartist() {
            var param =
            {
                api_key: "a1276d2c36045bff5015cb7b0c272887",
                method: "artist.getinfo",
                artist: "<%= Request.Params["term"] %>",

                   format: "json",
                   

               };
               $.ajax({
                   url: "http://ws.audioscrobbler.com/2.0/?",
                   data: param,
                   dataType: "jsonp",
                   success: function (response) {
                       alert("inside success");
                       var bio = response.artist.bio.content;
                       if (bio != undefined) {
                           $('.thirdanswer').append('<li><p>' + response.artist.bio.content + '</p><img src=" ' + response.artist.image[2]["#text"] + '"/></li>');
                       }
                       else {
                           $('.thirdanswer').append('<li><p>Biography not available at this moment </p><img src=" ' + response.artist.image[2]["#text"] + '"/></li>');

                       }
                     for (var i = 0; i < response.artist.similar.artist.length; i++) {


                         var food = response.artist.similar.artist[i];
                           var imgarr = food.image[2]["#text"];
                           var name = food.name;



                           $('.fourth').append('<li><img src="' + imgarr + '"><a href="artist_search.aspx?term=' + name + '" target= "_blank">' + name + '</a></li>');



                       }
                        console.log(response);


                   }
               });


        }

        
    </script>

    
</asp:Content>

