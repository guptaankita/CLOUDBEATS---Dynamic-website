<%@ Page MasterPageFile="~/Project/Myprojectmasterpage.master" Language="C#" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
    <!--THIS PAGE OPENS UP WHEN USER CLICKS ON 'SEARCH TRACK' TAB-->
   
            </asp:Content>

<%--  --%>
        <asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">

       <h1>Enter the track name in the textbox</h1>
     <div id="searchDiv">

    <input type="text" id="textbox" class="textsong" />
    <input type="button" id="mybutton" class="btnfetchdetails" value="Track Search"  />
   </div>
   <ul class="songsearch"></ul>

     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="../javascript/jquery-1.11.0.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            document.getElementById("mybutton").onclick = function () {
             
                var text = $(".textsong").val();
                if (/^[A-Za-z\s]+$/.test(text)) {
                    location.href = "songsearch.aspx?term=" + text;
                }
                else {
                    $('.songsearch').append('<div style:"text-align=center"><b>Enter a valid track name</b></div>');
                }
            }
            $('.textsong').keydown(function (e) {
                var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                if (key == 13) {
                    e.preventDefault();
                    var text = $(".textsong").val();
                    if (/^[A-Za-z\s]+$/.test(text)) {
                        location.href = "songsearch.aspx?term=" + text;
                    }
                    else {
                        $('.songsearch').append('<div><b>Enter a valid track name</b></div>');
                    }

                     }
            });


        });
        </script>

        </asp:Content>
  