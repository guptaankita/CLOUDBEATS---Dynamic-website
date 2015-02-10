<%@ Page MasterPageFile="~/Project/Myprojectmasterpage.master" Language="C#" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
        <!--THIS PAGE OPENS UP WHEN USER CLICKS ON 'SEARCH ARTIST' TAB-->

   
            </asp:Content>

        <asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">

        <h1>Enter the artist name in the text box</h1>
        <div id="searchDiv">

    <input type="text" id="textbox" class="textartist" />
    <input type="button" id="mybutton" class="btnfetchdetails" value="Enter"  />
                                     </div>
   
   <ul class="artistsearch"></ul>

     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="../javascript/jquery-1.11.0.js"></script>
    <script type="text/javascript">


        $(document).ready(function () {
            document.getElementById("mybutton").onclick = function () {

                var text = $(".textartist").val();
                if (/^[A-Za-z\s]+$/.test(text)) {
                    location.href = "searchartist.aspx?term=" + text;

                }
                else {
                    $('.artistsearch').append('<div><span>Enter a valid artist name</span></div>');
                }
            }
            $('.textartist').keydown(function (e) {
                var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                if (key == 13) {
                    e.preventDefault();
                    var text = $(".textartist").val();
                    if (/^[A-Za-z\s]+$/.test(text)) {
                        location.href = "searchartist.aspx?term=" + text;

                    }
                    else {
                        $('.artistsearch').append('<div><span>Enter a valid artist name</span></div>');
                    }

                }
            });


        });


        </script>

        </asp:Content>
  