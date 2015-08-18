<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Airlines Survey</title>
    <link href="stylesheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
     <div id="main">
        <div id="mainC">
            <div id="topHeader"></div>
                <div id="bodyC">
    <form id="form1" runat="server">
     <br />
    <br />
    <h1>ZAirlines Survey</h1>
    <br />
    <br />
    <p><b>Enter your Flight Number:</b></p>
    <asp:TextBox ID="flightNumber" runat="server" align="center"></asp:TextBox>
    <asp:RequiredFieldValidator ID="flightNumberValidate" runat="server"
                                                    ControlToValidate="flightNumber" Display="Dynamic">**Required field**</asp:RequiredFieldValidator><br />
    <asp:RegularExpressionValidator ID="maxFlight" 
            runat="server" Display="dynamic" 
            ControlToValidate="flightNumber" 
            ValidationExpression="^([\S\s]{0,10})$" 
            ErrorMessage="** Flight number should be no more than 10 digits **">
    </asp:RegularExpressionValidator>
    <p><b>Enter your Flight Date:</b></p>
    <asp:TextBox ID="Date" runat="server" align="center"></asp:TextBox>
    <asp:CompareValidator ID="compareDate" runat="server"
            ControlToValidate="Date" Operator="DataTypeCheck"
            Display="Dynamic" Type="Date">**You did not enter a
            valid date **</asp:CompareValidator>

    <p><b>Friendliness of customer staﬀ:</b></p>
    <asp:RadioButtonList ID="friendStaff" EnableViewState="true" runat="server" align="center">
    
    <asp:ListItem Value="Excellent" runat="server" Text="Excellent"></asp:ListItem>
    <asp:ListItem Value="Good" runat="server" Text="Good"></asp:ListItem>
    <asp:ListItem Value="Fair" runat="server" Text="Fair"></asp:ListItem>
    <asp:ListItem Value="Poor" runat="server" Text="Poor"></asp:ListItem>
    <asp:ListItem Value="No Opinion" runat="server" Text="No Opinion"></asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <p><b>Space for luggage storage:</b></p>
    <asp:RadioButtonList ID="spaceLuggage" EnableViewState="true" runat="server" align="center">
     
    <asp:ListItem Value="Excellent" runat="server" Text="Excellent"></asp:ListItem>
    <asp:ListItem Value="Good" runat="server" Text="Good"></asp:ListItem>
    <asp:ListItem Value="Fair" runat="server" Text="Fair"></asp:ListItem>
    <asp:ListItem Value="Poor" runat="server" Text="Poor"></asp:ListItem>
    <asp:ListItem Value="No Opinion" runat="server" Text="No Opinion"></asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <p><b>Comfort of seating</b></p>
     <asp:RadioButtonList ID="Comfort" EnableViewState="true" runat="server" align="center">
     
    <asp:ListItem Value="Excellent" runat="server" Text="Excellent"></asp:ListItem>
    <asp:ListItem Value="Good" runat="server" Text="Good"></asp:ListItem>
    <asp:ListItem Value="Fair" runat="server" Text="Fair"></asp:ListItem>
    <asp:ListItem Value="Poor" runat="server" Text="Poor"></asp:ListItem>
    <asp:ListItem Value="No Opinion" runat="server" Text="No Opinion"></asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <p><b>Cleanliness of aircraft</b></p>
   <asp:RadioButtonList ID="Cleanliness" EnableViewState="true" runat="server" align="center">
     
    <asp:ListItem Value="Excellent" runat="server" Text="Excellent"></asp:ListItem>
    <asp:ListItem Value="Good" runat="server" Text="Good"></asp:ListItem>
    <asp:ListItem Value="Fair" runat="server" Text="Fair"></asp:ListItem>
    <asp:ListItem Value="Poor" runat="server" Text="Poor"></asp:ListItem>
    <asp:ListItem Value="No Opinion" runat="server" Text="No Opinion"></asp:ListItem>
    </asp:RadioButtonList>
    
    <br />
    <p><b>Noise level of aircraft</b></p>
    <asp:RadioButtonList ID="Noise" EnableViewState="true" runat="server" align="center">
     
    <asp:ListItem Value="Excellent" runat="server" Text="Excellent"></asp:ListItem>
    <asp:ListItem Value="Good" runat="server" Text="Good"></asp:ListItem>
    <asp:ListItem Value="Fair" runat="server" Text="Fair"></asp:ListItem>
    <asp:ListItem Value="Poor" runat="server" Text="Poor"></asp:ListItem>
    <asp:ListItem Value="No Opinion" runat="server" Text="No Opinion"></asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <br />
    <br />
    <asp:Button ID="sendSurvey" runat="server" Text="Send" />
    
    </form>
    <asp:Literal ID="asms" runat="server" Visible="False" />

    <br />
    <br />
    </div>
  </div>
</div>
</body>
</html>
