 <%@Page MasterPageFile="~/Project/Myprojectmasterpage.master" Language="C#" %>


<asp:Content ID="ContentHead" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">

    <!--In this page I am making an API call to Apple iTunes API, to retreive 10 tracks, that match with the track entered
        by the user.And then I am parsing the JSON response and displaying on the HTML page, the url, which is the url 
        of the sample music of the track and HTML display also contains the artist name and release date of the track-->
        </asp:Content>


        <asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">

     <!-- 'ul' used to display the result of the search on the HTML page-->
    <ul class="songsearch"></ul>
  
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="../javascript/jquery-1.11.0.js"></script>
    <script type="text/javascript">
         
        <!-- javascript code to make the API call and parse the response data and display on the HTML page-->
        $(document).ready(function () {

            var param =
                {
                    term: "<%= Request.Params["term"] %>",

                    limit: "10"
                };
            $.ajax({
                url: "https://itunes.apple.com/search?",
                data: param,
                dataType: "jsonp",
                timeout:5000,
                error: function (x, status, error) {
                    alert(status);
                    var message = "<h1><span>Try Again Later</span></h1>";
                    $('.songsearch').append(message);
                },

                success: function (response) {
                    $('.songsearch').append('<div><h1><i>Click on the artist name to listen to sample music of this track</i></h1></div>');
                    $('.songsearch').append('<div><h1><i>Click on the image to know more about this track</i></h1></div>');

                    console.log(response);
                   if (response.results.length != 0) {
                        for (var i = 0; i < response.results.length; i++) {

                            var item = response.results[i];
                            var idddd = item.artistId;

                            var id = item.artistName;
                            var songname = item.trackName;
                            var name = response.results[i].previewUrl;
                            var img = response.results[i].artworkUrl100;
                           
                            

                            var genre = response.results[i].primaryGenreName;
                            if (genre == undefined || name == undefined || img == undefined) {
                                $('.songsearch').append('<h1><span>Sorry no information avaliable</span></h1>');

                            }
                            else {
                                if (img == "") {
                                    img = "../images/noimage.jpg";
                                }

                                var pv = "<%= Request.Params["term"] %>";
                                $('.songsearch').append('<li><a href="' + name + '">' + id + '</a><a href="moresongsearch.aspx?artistid=' + id + '&track=' + pv + ' "target="_blank"><img src="' + img + '"></></a><span>Genre:' + genre + '</span></li>');
                            }
                        }
                    }
                   else {
                       $('.songsearch').append('<h1><span>Enter a valid track</span></h1>');
                    }

                }
            });
        });
        
       

    </script>

    
 
 
</asp:Content> 
