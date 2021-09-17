<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PaymentSummary.aspx.cs" Inherits="SEMAssignment.PaymentSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title></title>
    <style>
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Image ID="Image4" runat="server" style="display: block;margin: auto; width: 20em;" ImageUrl="~/ConfirmationPage.JPG"/>
    <br />
    <br />
    <table style="width: 20%; margin-left: 25%;float: left;position: relative;bottom: 32px;">
                <tr>
                    <td style="align-content:center">
                        <asp:Image ID="Image1" runat="server" Width="250px" Height="300px" style="position: relative;top: 25px;" ImageUrl="payment_img/order-confirmation.jpg"/></td>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td><p style="margin-left: 20%;position: relative;bottom: 20px;">Order Confirmed<br /> <p style="font-size: small;text-align: center;position: relative;bottom: 30px;right: 25px;">Dear <asp:Label ID="lblfName" runat="server"></asp:Label>,&nbsp your order have been confirmed, please wait and an email will be sent to you as an receipt.</p></p></td>

                </tr>
                <tr>
                    <td>&nbsp;</td>

                </tr>
            </table>
            <table style="padding: 15px 0;width: 30%;position: relative;left: 5%;">
                <tr >
                    <td><asp:Image ID="Image2" runat="server" Height="15px" Width="15px" ImageUrl="payment_img/small-clock.png"/>&nbsp 10 days delivery</td>
                    <td><asp:Image ID="Image3" runat="server" Height="15px" Width="15px" ImageUrl="payment_img/shipped.png"/>&nbsp DHL Express</td>
                </tr>
                </table>
            <table style="width: 30%;position: relative;left: 5%;">
                <tr >
                    <td><asp:DataList ID="DataList1" runat="server" Style="background-color: #f8f8f8;width: 100%;" OnItemDataBound="DataList1_ItemDataBound">
    <ItemTemplate>
        <div class="container"
            Style="    display: flex;flex-direction: row;height: 180px;align-items: center;width: 110%;margin-left: 5%;"
            ID="testseste">
           <div style="width: 30%;
                    height: 70%;
                    display:flex;
                    align-items: center;
                    box-shadow: grey 2px 2px 2px 2px;
                    background-color:white;">
                <asp:Image ID="Image1" runat="server" 
                    ImageUrl='<%#SafeEval(Container.DataItem, "image")%>'
                    Style="width: 100%;
                        height: 100%;
                        object-fit: contain;"/>
            </div>
            <div style="display: flex;
                    flex-direction: column;
                    justify-content: flex-start;       
                    padding-left: 20px;
                    width: 50%;
                    height: 70%;">
                <asp:Label ID="lblName" runat="server" Text='<%#SafeEval(Container.DataItem, "product_name")%>' Style="font-size: 20px;"></asp:Label>
                <asp:Label ID="lblPrice" runat="server" Text='<%# "Unit Price: " + String.Format("RM {0:n}", decimal.TryParse(SafeEval(Container.DataItem, "product_stock_price").ToString(), out decimal res)? res : 0) %>' Style="font-size: 12px;"></asp:Label>
                <div ID="quantityDetailsDiv" runat="server">
                    <asp:Label ID="lblQty1" runat="server" Text="Quantity: " Style="font-size: 12px;"></asp:Label>
                    <asp:Label ID="txtboxQty" runat="server" Text='<%# SafeEval(Container.DataItem, "qty") %>' style="width: 40px;display: inline; font-size: 12px;"
                        AutoPostBack="True"
                        CausesValidation="True" ValidationGroup="qtyValidationGroup">
                    </asp:Label>
                </div>
                <asp:Label ID="lblSubTotal" runat="server" Text='<%# "Subtotal: " + String.Format("RM {0:n}", decimal.TryParse(SafeEval(Container.DataItem, "subtotal").ToString(), out decimal res)? res : 0) %>' Style="font-size: 12px;"></asp:Label>
            </div>
        </div>
    </ItemTemplate>
    <SeparatorTemplate>
        <hr style="border: 0;
            height: 1px;
            background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));" />
    </SeparatorTemplate>
</asp:DataList></td>
                </tr>
                </table>
    <table style="width: 30%;margin-left: 50%;left: 5%;">
                <tr>
                    <td><br /></td>
                </tr>
                <tr>
                    <td style="color:gray;">Shipping Cost</td>
                    <td>RM &nbsp<asp:Label ID="lblShippingCost" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="color:gray;">Packaging</td>
                    <td>RM &nbsp<asp:Label ID="lblPackaging" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr >
                    <td style="color:gray; border-top:2px solid; border-bottom:2px solid;">Grand Total </td>
                    <td style="border-top:2px solid; border-bottom:2px solid;">RM &nbsp 
                        <asp:Label ID="lblTotalPrice" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr >
                    <td><br /></td>
                  
                </tr>
                <tr>
                    <td style="color:gray; width: 40%;">Payment Date</td>
                    <td>
                        <asp:Label ID="lblDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td style="color:gray; width: 40%;">Payment Method</td>
                    <td>
                        <asp:Label ID="lblPaymentMethod" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td style="color:gray; width: 40%;">Credit Card No.</td>
                    <td>
                        <asp:Label ID="lblCreditCardNo" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td style="color:gray; width: 40%;">Country</td>
                    <td>
                        <asp:Label ID="lblCountry" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td style="color:gray; width: 40%;">Shipping Address</td>
                    <td>
                        <asp:Label ID="lblAddress" runat="server"></asp:Label></td>
                </tr>
            </table>

 </asp:Content>
