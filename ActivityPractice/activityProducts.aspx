<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activityProducts.aspx.cs" Inherits="ActivityPractice.activityProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Products</title>

    <!--Style sheet--->
    <style type="text/css">
        *{
            text-decoration:none;margin:0;padding:0;box-sizing:border-box;font-family:sans-serif;
        }
        .navbar{
            background-color:#393a3a;padding:15px;
        }
        .navdiv{
            display:flex;align-items:center;justify-content:space-between;margin-left:5%;margin-right:5%;padding-top:10px;padding-bottom:10px;
        }
        .logo a{
            font-size:35px;font-weight:400;color:white;
        }
        li{
            list-style:none;display:inline-block;
        }
        li a{
            color:white;font-size:16px;margin-right:25px;
        }
        .container-2{
            margin:auto;width:500px;max-width:90%;
        }
        .container-2 .container-2-3{
            width:100%;height:100%;padding:20px;background:#ebe8e8;border-radius:4px;margin-top:5%;
        }
        .container-2 .container-2-3 h3{
            text-align:center;margin-bottom:24px;color:#222;
        }
        /*Checkbox*/
        #chkBox{
            margin-top:3px;width: 20px;height: 20px;
        }
        #lblChkBox{
            margin-top:7px;
        }
        .auto-style1 {
            width: 474px;
        }
        .auto-style2 {
            width: 131px;
        }
        .auto-style4 {
            width: 131px;
            height: 76px;
        }
        .auto-style5 {
            height: 76px;
        }
    </style>

    <!--- Scripts for input validations --->
    <script>
        // function that does not accept numbers and other character inputs except .-, *this is for description
        function validateInput(event) {
            var allowedChars = /^[a-zA-Z,.\-()'` ]+$/;
            var input = event.key;

            if (!allowedChars.test(input)) {
                event.preventDefault();
            }
        }
        // function to input uppercase letters only
        function uppercaseInput() {
            var upperInput = document.getElementById('<%= txtCodeID.ClientID %>').value;
            var upperCinput = upperInput.toUpperCase();
            document.getElementById('<%= txtCodeID.ClientID %>').value = upperCinput;
        }
        // function for no spacing
        function noSpace(event) {
            if (event.keyCode === 32) {
                event.preventDefault();
            }
        }

        
        
    </script>
</head>
<body style="height: 400px">
    <!---NAVIGATION BAR---->
    <nav class="navbar">
        <div class="navdiv">
            <div class="logo"></div>
            <ul>
                <li><a href="activityCustomer.aspx">Customer</a></li>
                <li><a href="activityProducts.aspx">Products</a></li>
                <li><a href="activityPaymentDetails.aspx">Payment Details</a></li>
                <li><a href="activityPayment.aspx">Payment</a></li>
                <!--<li><a href="index.aspx" style="color:red;">Logout</a></li>-->
            </ul>
        </div>
    </nav>

    <div class="container">
        <form id="form1" runat="server">
            <!---CUSTOMER INFORMATION FORM--->
            <div class="container-2">
                <div class="container-2-3">
                    <h3>Add New Product</h3>
                    <asp:HiddenField ID="hfProdCode" runat="server" />
                    <table class="auto-style1">
                        <!--Product Code-->
                        <tr>
                            <td class="auto-style2"><asp:Label ID="lblCodeNum" runat="server" Text="Code"></asp:Label></td>
                            <td colspan="2">
                                <asp:TextBox ID="txtCodeID" runat="server" class="text_contain" BorderStyle="Solid" Height="35px" Width="259px" onkeypress="validateInput(event)" onkeyup="uppercaseInput()" onkeydown="noSpace(event)"></asp:TextBox>
                            </td>
                        </tr>
                        <!---Product Description--->
                        <tr>
                            <td class="auto-style4"><asp:Label ID="lblDesc" runat="server" Text="Description"></asp:Label></td>
                            <td colspan="2" class="auto-style5">
                                <asp:TextBox ID="txtDesc" runat="server" class="text_contain" BorderStyle="Solid" Height="70px" Width="258px" TextMode="MultiLine" onkeypress="validateInput(event)"></asp:TextBox>
                            </td>
                        </tr>
                        <!---Product Amount--->
                        <tr>
                            <td class="auto-style2"><asp:Label ID="lblAmount" runat="server" Text="Amount"></asp:Label></td>
                            <td colspan="2">
                                <asp:TextBox ID="txtAmount" runat="server" onkeypress ="numbersOnly(event)" class="text_contain" BorderStyle="Solid" Height="35px" Width="259px" ></asp:TextBox>
                            </td>
                        </tr>
                        <!---Is Active checkbox--->
                        <tr>
                            <td class="auto-style2"><asp:Label ID="lblChkBox" runat="server" Text="Is Active"></asp:Label></td>
                            <td colspan="2">
                                <asp:CheckBox ID="chkBox" BorderStyle="None" runat="server" Checked="True"/>
                            </td>
                        </tr>
                        <tr style="margin-top:5%;">
                            <td></td>
                        </tr>
                        <!-------Buttons-------->
                        <tr>
                            <td></td>
                            <td colspan="2">
                                <asp:Button ID="btnProSave" runat="server" Text="Insert" 
                                    style="border:none; background-color:darkgreen; color:white; padding:7px 7px; font-size:13px; border-radius:2px; cursor:pointer; margin-left:3%;" OnClick="btnProSave_Click"/>
                                <asp:Button ID="btnProDel" runat="server" Text="Delete" 
                                    style="border:none; background-color:red; color:white; padding:7px 7px; font-size:13px; border-radius:2px; cursor:pointer; margin-left:3%;" OnClick="btnProDel_Click"/>
                                <asp:Button ID="btnProClear" runat="server" Text="Clear" 
                                    style="border:none; background-color:dodgerblue; color:white; padding:7px 7px; font-size:13px; border-radius:2px; cursor:pointer; margin-left:3%;" OnClick="btnProClear_Click"/>
                            </td>
                        </tr>
                        <!-----Message------>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblSuccess" runat="server" Text="" ForeColor="Green"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <br />
            <!----Grid View------->
            <div style="margin-left:10%; margin-right:10%; margin-bottom:5%; padding:5px 5px 5px 5px;">
                <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" Width="985px" CellSpacing="1" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="code" HeaderText="Code" />
                        <asp:BoundField DataField="productDescription" HeaderText="Product Description" />
                        <asp:BoundField DataField="amount" HeaderText="Amount" />
                        <asp:BoundField DataField="isActive" HeaderText="Is Active" />
                        <asp:BoundField DataField="createdDate" HeaderText="Created Date" dataformatstring="{0:yyyy-MM-dd HH:mm:ss}"/>
                        <asp:BoundField DataField="modifiedDate" HeaderText="Modified Date" dataformatstring="{0:yyyy-MM-dd HH:mm:ss}"/>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="lnk_OnClick">View</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#594B9C" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#33276A" /> 
               </asp:GridView>
            </div>  
        </form> 
    </div>
</body>
</html>
