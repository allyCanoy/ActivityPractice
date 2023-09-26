<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activityCustomer.aspx.cs" Inherits="ActivityPractice.activityCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Customer</title>

    <!--Style sheet--->
    <style type="text/css">
        *{
            text-decoration:none; margin:0;padding:0;box-sizing:border-box;font-family:sans-serif;
        }
        .navbar{
            background-color:#393a3a;padding:15px;
        }
        .navdiv{
            display:flex; align-items:center; justify-content:space-between; margin-left:5%; margin-right:5%; padding-top:10px; padding-bottom:10px;
        }
        .logo a{
            font-size:35px; font-weight:400; color:white;
        }
        li{
            list-style:none; display:inline-block;
        }
        li a{
            color:white; font-size:16px; margin-right:25px;
        }
        .container-2{
            margin:auto; width:500px; max-width:90%;
        }
        .container-2 .container-2-3{
            margin-top:5%; width:100%; height:100%; padding:20px; background:#ebe8e8; border-radius:4px;
        }
        .container-2 .container-2-3 h3{
            text-align:center; margin-bottom:24px; color:#222;
        }
        .container-button{
            margin-top:3%;
        }
        .container-button .buttons{
            margin-left:60%;
        }
        .auto-style1 {
            width: 1400px;
        }
        .auto-style2 {
            width: 268435456px;
        }
    </style>

    <!--- Script to not accept numbers and other character inputs except .-, --->
    <script>
        function validateInput(event) {
            var allowedChars = /^[a-zA-Z,.\- ]+$/;
            var input = event.key;

            if (!allowedChars.test(input)) {
                event.preventDefault();
            }
        }

        ///BIRTHDATE
        function limitYearOfBirth() {
            var currentDate = new Date();
            var maxYear = currentDate.getFullYear();
            var txtBirth = document.getElementById('<%= txtBirth.ClientID%>');
            txtBirth.max = maxYear;
        }
        window.onload = function () {
            limitYearOfBirth();
        }
    </script>
</head>
<body>
    <!------------------ NAVIGATION BAR ------------------>
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
    <!---------- END NAVIGATION BAR ---------->
    <div class="container">
        <form id="form1" runat="server">
    <!---CUSTOMER INFORMATION FORM--->
            <div class="container-2">
                <div class="container-2-3">
                    <h3>Add New Customer</h3>
                    <asp:HiddenField ID="hfCustomer" runat="server" />
    <!---TABLE--->
                    <table>
                        <!--Customer Number-->
                        <tr>
                            <td>
                                <asp:Label ID="lblCustNum" runat="server" Text="Customer Number" Font-Size="Small"></asp:Label>
                            </td>
                            <td colspan="2">&nbsp;
                                <asp:Label ID="lblCustomerNumberID" runat="server" Text="customerNumber" Font-Size="Small"></asp:Label>
                            </td>
                        </tr>
                        <!---First Name--->
                        <tr>
                            <td>
                                <asp:Label ID="lblFname" runat="server" Text="First Name" Font-Size="Small"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtFname" runat="server" class="text_contain" BorderStyle="Solid" Height="25px" Width="180px" onkeypress="validateInput(event)"></asp:TextBox>
                            </td>
                        </tr>
                        <!---Middle Name--->
                        <tr>
                            <td>
                                <asp:Label ID="lblMname" runat="server" Text="Middle Name" Font-Size="Small"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtMname" runat="server" class="text_contain" BorderStyle="Solid" Height="25px" Width="180px" onkeypress="validateInput(event)"></asp:TextBox>
                            </td>
                        </tr>
                        <!---Last Name--->
                        <tr>
                            <td>
                                <asp:Label ID="lblLname" runat="server" Text="Last Name" Font-Size="Small"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtLname" runat="server" class="text_contain" BorderStyle="Solid" Height="25px" Width="180px" onkeypress="validateInput(event)"></asp:TextBox>
                            </td>
                        </tr>
                        <!---Birthdate--->
                        <tr>
                            <td>
                                <asp:Label ID="lblBirth" runat="server" Text="Birthdate" Font-Size="Small"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtBirth" runat="server" class="text_contain" TextMode="Date" BorderStyle="Solid" min="1900-01-01" Height="25px" Width="180px"></asp:TextBox>
                            </td>
                        </tr>
                        <!---Gender RADIO BUTTON--->
                        <tr>
                            <td>
                                <asp:Label ID="lblGen" runat="server" Text="Gender" Font-Size="Small"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:RadioButton ID="isFemale" runat="server" class="text_contain" Text=" Female" GroupName="gender" Font-Size="Small"/>
                                <asp:RadioButton ID="isMale" runat="server" class="text_contain" Text=" Male" GroupName="gender" Font-Size="Small"/>
                            </td>
                        </tr>
                        <!---Occupation--->
                        <tr>
                            <td>
                                <asp:Label ID="lblOcc" runat="server" Text="Occupation" Font-Size="Small"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtOcc" runat="server" class="text_contain" BorderStyle="Solid" Height="25px" Width="180px" onkeypress="validateInput(event)"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="margin-top:5%;">
                            <td></td>
                        </tr>
                        <!------Buttons------>
                        <tr>
                            <td></td>
                            <td colspan="2">
                                <asp:Button ID="btnSaveCustomer" runat="server" Text="Insert" 
                                    style="border:none; background-color:darkgreen; color:white; padding:7px 7px; font-size:13px; border-radius:2px; cursor:pointer; margin-left:3%;" OnClick="btnSaveCustomer_Click"/>
                                <asp:Button ID="btnDeleteCustomer" runat="server" Text="Delete" 
                                    style="border:none; background-color:red; color:white; padding:7px 7px; font-size:13px; border-radius:2px; cursor:pointer; margin-left:3%;" OnClick="btnDeleteCustomer_Click"/>
                            <asp:Button ID="btnClearCustomer" runat="server" Text="Clear" 
                                    style="border:none; background-color:#3840e5; color:white; padding:7px 7px; font-size:13px; border-radius:2px; cursor:pointer; margin-left:3%;" OnClick="btnClearCustomer_Click"/>
                            </td>
                        </tr>
                        <!--------MESSAGE--------->
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblSuccess" runat="server" ForeColor="Green" Font-Size="Small"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="auto-style2">
                                <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Size="Small"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <!------END TABLE------>
                </div>
            </div>
            <br />
            <!---GRIDVIEW----->
            <div style="margin-left:5%; margin-right:3%;" class="auto-style1">
                <asp:GridView ID="gvCustomer" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="5" GridLines="None" CellSpacing="3" Width="1100px">
                    <Columns>
                        <asp:BoundField DataField="customerNumber" HeaderText="Customer Number" />
                        <asp:BoundField DataField="firstName" HeaderText="First Name" />
                        <asp:BoundField DataField="middleName" HeaderText="Middle Name" />
                        <asp:BoundField DataField="lastName" HeaderText="Last Name" />
                        <asp:BoundField DataField="birthDate" HeaderText="Birthdate" dataformatstring="{0:MM/dd/yyyy}"/>
                        
                        <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>
                                <%# GetGenderText((bool)Eval("gender")) %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="occupation" HeaderText="Occupation" />
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

