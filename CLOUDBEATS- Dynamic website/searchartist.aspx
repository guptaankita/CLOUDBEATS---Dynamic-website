 <%@Page MasterPageFile="~/Project/Myprojectmasterpage.master" Language="C#" %>


<asp:Content ID="ContentHead" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
 </asp:Content>


        <asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">


   
    <ul class="artistsearch"></ul>
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
                timeout: 5000,
                error: function (x, status, error) {
                    alert(status);
                    var message = "<h1><span>No information avaliable rightnow</span></h1>";
                    $('.artistsearch').append(message);
                },

                success: function (response) {
               
                    
                    if (response.results.length != 0) {

                        var item = response.results[0];
                        var iddd = item.artistId;
                        
                            var id = item.artistName;
                            var name = response.results[0].previewUrl;
                            var img = response.results[0].artworkUrl100;
                            var date = Date(response.results[0].releaseDate);
                            if (img == "" || img==undefined) {
                                img = "../images/noimage.jpg";
                            }
                            musicvideos();

                            var pv = "<%= Request.Params["term"] %>";
                            $('.artistsearch').append('<div>To know more about this artist click on the image<a href="moreartistsearch.aspx?artist=' + pv + ' "target="_blank"><img src="' + img + '"/></a></li>');
                       
                    }
                    else {
                        $('.artistsearch').append('<li><span>Enter a valid artist name</span></li>');

                    }
                }
            });
        });
        function musicvideos() {

            
                var param =
                {
                    term: "<%= Request.Params["term"] %>",

                    limit: "5",
                    entity:"musicVideo",



            };
            $.ajax({
                url: "https://itunes.apple.com/search?",

                data: param,
                dataType: "jsonp",
                timeout: 5000,
                error: function (x, status, error) {
                    alert(status);
                    var message = "<h1><span>No information avaliable rightnow</span></h1>";
                    $('.artistsearch').append(message);
                },

                success: function (response) {
                
                    console.log(response);

                    $('.artistsearch').append('<div><h1>Below are the videos of the artist</h1><h2>Click on the track name to watch the video</h2></div>');
                    if (response.results.length != 0)
                    {
                        for (var i = 0; i < response.results.length; i++) {
                            var one = response.results[i];
                            var url = one.previewUrl;
                            var img = one.artworkUrl100;
                            var name = one.trackName;


                            if (url != undefined || img != undefined || name != undefined) {
                                if (img == "") {
                                    img = "../images/noimage.jpg";
                                }

                                $('.artistsearch').append('<li><a href="' + url + '" target= "_blank">' + name + '</a><img src="' + img + '"/></li>');
                            }
                            else {
                                $('.artistsearch').append('<h1><span>No information avaliable rightnow</span></h1>');

                            }
                        }
                    }

                    else {
                        $('.artistsearch').append('<h1><span>No information avaliable rightnow</span></h1>');

                    }

                    


      

                }
            });


        



        }
           </script>

    
 
 
</asp:Content> 
