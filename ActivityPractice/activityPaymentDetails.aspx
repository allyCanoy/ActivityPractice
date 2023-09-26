<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activityPaymentDetails.aspx.cs" Inherits="ActivityPractice.activityPaymentDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Payment Details</title>
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
            margin-left:15%;margin-right:15%;
        }
        .container-2 .container-2-3{
            height:100%;padding:20px;background:#ebe8e8;border-radius:4px;margin-top:3%;margin-left:10%;margin-right:10%;
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
        </style>

    <script>
        function disableDropdown() {
            var ddl = document.getElementById('<%= ddlCustomerList %>');
            ddl.disabled = true;
        }
    </script>
</head>
<body>
    <!---NAVIGATION BAR---->
    <nav class="navbar">
        <div class="navdiv">
            <div class="logo"></div>
            <ul>
                <li><a href="activityCustomer.aspx">Customer</a></li>
                <li><a href="activityProducts.aspx">Products</a></li>
                <li><a href="activityPaymentDetails.aspx">Payment Details</a></li>
                <li><a href="activityPayment.aspx">Payments</a></li>
                <!--<li><a href="index.aspx" style="color:red;">Logout</a></li>-->
            </ul>
        </div>
    </nav>

    <div class="container">
        <form id="form1" runat="server">
            <div class="container-2">
                <div class="container-2-3">
                    <h3>Payment Details</h3>
                    <table>
                        <!--Dropdown Customer List--->
                        <tr>
                            <td></td>
                            <td colspan="2">
                                <asp:Label ID="lblCustomer" runat="server" Text="Customer"></asp:Label>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td colspan="2">
                                <asp:DropDownList ID="ddlCustomerList" runat="server" Height="30px" Width="420px" AutoPostBack="True" OnSelectedIndexChanged="ddlCustomerList_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <!--Show Customer List not editable--->
                        <tr>
                            <td></td>
                            <td colspan="2">
                                <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name"></asp:Label>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td colspan="2">
                                <asp:TextBox ID="txtCustomerName" runat="server" Height="30px" Width="420px" ReadOnly="True" BorderStyle="None" BorderColor="Black" BackColor="#CCCCCC"></asp:TextBox>
                            </td>
                        </tr>
                        <!--Dropdown Product List--->
                        <tr>
                            <td></td>
                            <td colspan="2">
                                <asp:Label ID="lblProduct" runat="server" Text="Product"></asp:Label>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td colspan="2">
                                <asp:DropDownList ID="ddLProducts" runat="server" Height="30px" Width="420px" AutoPostBack="True" OnSelectedIndexChanged="ddLProducts_SelectedIndexChanged"></asp:DropDownList>
                            </td>
                        </tr>
                        <!-----Add product button----->
                        <tr>
                            <td></td>
                            <td colspan="2">
                                <asp:Label ID="lblProductName" runat="server" Text="Product Name"></asp:Label>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td colspan="2">
                                <asp:TextBox ID="txtProductName" runat="server" Height="30px" Width="420px" ReadOnly="True" BorderStyle="None" BorderColor="Black" BackColor="#CCCCCC"></asp:TextBox>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td colspan="2">
                                <asp:Button ID="btnAddProductTo" runat="server" OnClientClick="disableDropdown();" Text="Add Product" style="border:none; background-color:darkgreen; color:white; padding:7px 7px; font-size:13px; border-radius:2px; cursor:pointer;" OnClick="btnAddProductTo_Click" />
                            </td>
                        </tr>
                        <!--To show amount--->
                        <tr>
                            <td></td>
                            <td colspan="2">
                                <asp:Label ID="lblAmount" runat="server" Text="Amount"></asp:Label>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td colspan="2">
                                <asp:TextBox ID="txtAmount" runat="server" Height="30px" Width="420px" ReadOnly="True" BorderStyle="None" BorderColor="Black" BackColor="#CCCCCC"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <!---------GRIDVIEW --------->
                    <div style="margin-left:2%; margin-right:5%;">
                        <asp:GridView ID="gvPayDetails" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="5" GridLines="None" CellSpacing="3" Width="1100px">
                            <Columns>
                                <asp:BoundField DataField="code" HeaderText="Code" />
                                <asp:BoundField DataField="productDescription" HeaderText="Product Description" />
                                <asp:BoundField DataField="amount" HeaderText="Amount" />
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
                       
                </div>
            </div>
        </form>
    </div>
</body>
</html>
