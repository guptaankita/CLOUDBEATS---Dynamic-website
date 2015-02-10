<%@ Page MasterPageFile="~/Project/Myprojectmasterpage.master" Language="C#" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
          <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js">
</script>
    <script>
        function onload() {
            var div = $("div");
            div.animate({ height: '300px', opacity: '0.4' }, "slow");
            div.animate({ width: '300px', opacity: '0.8' }, "slow");
            div.animate({ height: '100px', opacity: '0.4' }, "slow");
            div.animate({ width: '100px', opacity: '0.8' }, "slow");



        };
         </script>
  
</asp:Content>

 <asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <div onclick="onload()"><p >Music is a moral law. 
      It gives soul to the universe, wings to the mind, flight to the imagination, and charm and gaiety to life and to everything.</p>
        </div>
    
        
</asp:Content>