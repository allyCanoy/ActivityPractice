<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activityPayment.aspx.cs" Inherits="ActivityPractice.activityPayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Payment</title>

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
            margin:auto;width:500px;
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
        .auto-style9 {
            height: 45px;
        }
        .auto-style10 {
            height: 64px;
        }
        .auto-style11 {
            height: 57px;
        }
        .auto-style12 {
            height: 70px;
        }
        </style>
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
            <div class="container-2">
                <div class="container-2-3">
                    <h3>Payment</h3>
                    <table>
                        <!--------Total amount------->
                        <tr>
                            <td class="auto-style9"></td>
                            <td colspan="2" class="auto-style9">
                                <asp:Label ID="lblTotalAmount" runat="server" Text="Total Amount"></asp:Label>
                            </td>
                            <td class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td colspan="2" class="auto-style9">
                                <asp:TextBox ID="txtTotalAmount" runat="server" Height="30px" Width="300px" ReadOnly="True" BorderStyle="None" BorderColor="Black" BackColor="#CCCCCC"></asp:TextBox>
                            </td>
                        </tr>
                        <!----Amount received------>
                        <tr>
                            <td class="auto-style10"></td>
                            <td colspan="2" class="auto-style10">
                                <asp:Label ID="lblAmountReceived" runat="server" Text="Amount Received"></asp:Label>
                            </td>
                            <td class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td colspan="2" class="auto-style10">
                                <asp:TextBox ID="txtAmountReceived" runat="server" Height="30px" Width="300px"  BorderStyle="None" BorderColor="Black" ></asp:TextBox>
                            </td>
                        </tr>
                        <!--Change--->
                        <tr>
                            <td class="auto-style11"></td>
                            <td colspan="2" class="auto-style11">
                                <asp:Label ID="lblChange" runat="server" Text="Change"></asp:Label>
                            </td>
                            <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td colspan="2" class="auto-style11">
                                <asp:TextBox ID="txtChange" runat="server" Height="30px" Width="300px" ReadOnly="True" BorderStyle="None" BorderColor="Black" BackColor="#CCCCCC"></asp:TextBox>
                            </td>
                        </tr>
                        <!-----Payment Type------>
                        <tr>
                            <td class="auto-style12"></td>
                            <td colspan="2" class="auto-style12">
                                <asp:Label ID="lblPaymentType" runat="server" Text="Payment Type"></asp:Label>
                            </td>
                            <td class="auto-style12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td colspan="2" class="auto-style12">
                                <asp:RadioButton ID="isCash" runat="server" class="text_contain" Text=" Cash" GroupName="paymentType"/>
                                <asp:RadioButton ID="isCard" runat="server" class="text_contain" Text=" Card" GroupName="paymentType"/>
                            </td>
                        </tr>
                        <tr style="margin-top:5%;">
                            <td></td>
                        </tr>
                        <!------Buttons------>
                        <tr>
                            <td></td>
                            <td colspan="2">
                                <asp:Button ID="btnSavePayment" runat="server" Text="Save" 
                                    style="border:none; background-color:darkgreen; color:white; padding:7px 7px; font-size:13px; border-radius:2px; cursor:pointer; margin-left:20%;" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <!---------GRIDVIEW--------->
                    <div style="margin-left:2%; margin-right:5%;">
                        <asp:GridView ID="gvPayments" runat="server">

                        </asp:GridView>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
