<%@ Page MasterPageFile="~/Project/Myprojectmasterpage.master" Language="C#" %>




<asp:Content ID="ContentHead" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">

  
     
   <script type="text/javascript" src="../javascript/jquery-1.10.1.js"></script>
   
    </asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">

    

        <ul class="chartul">
            
        </ul>
       

    <script>
        
        $(document).ready(function () {
            $.ajax({
                url: "http://ws.audioscrobbler.com/2.0/?",
                dataType: "jsonp",
                data: { api_key: "a1276d2c36045bff5015cb7b0c272887", method: "chart.gettoptracks", format: "json", limit: "10" },
                timeout:5000,
                error: function (x, status, error) {
                 
                        console.log(status);
                 
                        $('.chartul').append('<div> API down at this moment</div>');
                    
                    
                },

                success: function (resp) {
                    $(".chartul").append('<div><h1><b>TOP TRACKS ON CHART</b></h1></div>');
                    $(".chartul").append('<div><h1><i>Click on the artist or track name for more information</i></h1></div>');


                  
                    console.log(resp);
                 
                  

                    for (index in resp.tracks.track) {
                        var abc = "";
                        abc = resp.tracks.track[index].artist.name;
                        if (resp.tracks.track[index].artist.name != undefined) {
                            timg = resp.tracks.track[index].image[2]["#text"]
                            if (timg == "" || timg == undefined) {
                                timg = "../images/noimage.jpg";
                            }

                            $(".chartul").append('<li>Artist:<a href="searchartist.aspx?term=' + resp.tracks.track[index].artist.name + '" target= "_blank">' + resp.tracks.track[index].artist.name + '</a><img src="' + timg + '"/><span>Track:<a href="songsearch.aspx?term=' + resp.tracks.track[index].name + '" target= "_blank">' + resp.tracks.track[index].name + '</a></span></li>');
                        }
                        else {

                            $('.chartul').append('<div>No information found</div>');

                        }
                    }
           
                }
            });
        });
</script>
    </asp:Content>