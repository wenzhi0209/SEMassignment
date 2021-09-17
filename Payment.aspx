<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="SEMAssignment.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        .auto-style1 {
            width: 316px;
        }
        .auto-style2 {
            width: 400px;
            height: 26px;
            margin-bottom: 50px;
        }
        .auto-style4 {
            width: 325px;
        }
        .auto-style5 {
            height: 26px;
            width: 325px;
        }
        .tablestyle{
                display: inline-block;
                margin-top: -25.5%;
                margin-right: 37px;
                border-radius: 5px;
              background-color: #1b2838;
        }
        .auto-style6 {
              border-radius: 5px;
              background-color: #1b2838;
              padding: 20px;

         }
        .txtcolor{
            color:#c7d5e0;
        }
        .button {
              background-color: #4CAF50; /* Green */
              border: none;
              color: white;
              padding: 10px 32px;
              text-align: center;
              text-decoration: none;
              display: inline-block;
              font-size: 16px;
              cursor: pointer;
              margin-left:35%;
        }

        .button:hover {
          background-color: #3e8e41;
        }
        input[type=text] {
          color:white;
          background-color: #171a21;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <asp:Image ID="Image2" runat="server" style="display: block;margin: auto; width: 20em;" ImageUrl="~/PaymentPage.JPG"/>
           <br />
           <br />

    <p style="margin-left: 16%;">PAYMENT METHOD</p>
   
        <div id="div1" width="80%" style="  margin-left: -15%;">

            <table class="auto-style6" width="47%" align="center" border="0">
                <tr>
                    <td class="auto-style1" style="color:#c7d5e0;">Please select a payment method<br />
                        <asp:DropDownList ID="ddlPaymentMethod" runat="server" BackColor="#171A21" ForeColor="White" AutoPostBack="True">
                            <asp:ListItem>Visa</asp:ListItem>
                            <asp:ListItem>Master Card</asp:ListItem>
                            <asp:ListItem>American Express</asp:ListItem>
                            <asp:ListItem>Discover Noxus</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style2" style="color:#c7d5e0;">Card number<br />
                        <asp:TextBox ID="cardNoTxtBox" runat="server" Placeholder="Exp: 4111111111111111" Width="235px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RegularCardNo" runat="server" ControlToValidate="cardNoTxtBox" ForeColor="Red">Required</asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter valid card number!" ControlToValidate="cardNoTxtBox" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style5" style="color:#c7d5e0;">Expiration date and security code<br />
                        <asp:DropDownList ID="DropDownList2" runat="server" BackColor="#171A21" ForeColor="White">
                            <asp:ListItem Value="None">--</asp:ListItem>
                            <asp:ListItem>01</asp:ListItem>
                            <asp:ListItem>02</asp:ListItem>
                            <asp:ListItem>03</asp:ListItem>
                            <asp:ListItem>04</asp:ListItem>
                            <asp:ListItem>05</asp:ListItem>
                            <asp:ListItem>06</asp:ListItem>
                            <asp:ListItem>07</asp:ListItem>
                            <asp:ListItem Value="08"></asp:ListItem>
                            <asp:ListItem>09</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*" InitialValue="None" ControlToValidate="DropDownList2" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;
                        &nbsp;
                        <asp:DropDownList ID="DropDownList3" runat="server" BackColor="#171A21" ForeColor="White">
                            <asp:ListItem Value="None">----</asp:ListItem>
                            <asp:ListItem>2021</asp:ListItem>
                            <asp:ListItem>2022</asp:ListItem>
                            <asp:ListItem>2023</asp:ListItem>
                            <asp:ListItem>2024</asp:ListItem>
                            <asp:ListItem>2025</asp:ListItem>
                            <asp:ListItem>2026</asp:ListItem>
                            <asp:ListItem>2027</asp:ListItem>
                            <asp:ListItem>2028</asp:ListItem>
                            <asp:ListItem>2029</asp:ListItem>
                            <asp:ListItem>2030</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="None" ControlToValidate="DropDownList3" ForeColor="Red">*</asp:RequiredFieldValidator>
&nbsp;
                        &nbsp;
                        <asp:TextBox ID="cvvTxtBox" runat="server" Placeholder="123" Width="50px" ForeColor="White"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="cvvTxtBox" ForeColor="Red">Required</asp:RequiredFieldValidator></br>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter valid CVV!" ControlToValidate="cvvTxtBox" ForeColor="Red" ValidationExpression="^[\d]{3,3}$"></asp:RegularExpressionValidator>
                    </td>
                    
                </tr>

                <tr>
                    <td class="auto-style2" style="color:#c7d5e0;">BILLING INFORMATION</td>
                    <td class="auto-style5" style="color:#c7d5e0;">&nbsp;</td>
     
                </tr>
                <tr>
                    <td class="auto-style2" style="color:#c7d5e0; display: flex; width:240px;">
                        <table style="width: 100%;">
                            <tr>
                                <td style="width:48%; margin-right: 4%;">
                                    <span>First name</span>
                                    <br />
                                    <asp:TextBox ID="fnTxtBox" runat="server" Width="100px"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFn" runat="server" ControlToValidate="fnTxtBox" ForeColor="Red" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="fnTxtBox" ErrorMessage="Invalid input!" Display="Dynamic" ForeColor="Red" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                                    &nbsp
                                </td>
                                <td style="width:48%;">
                                    <span>Last name</span>
                                    <br />
                                    <asp:TextBox ID="lnTxtBox" runat="server" Width="100%"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredLn" runat="server" ControlToValidate="lnTxtBox" ForeColor="Red" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="lnTxtBox" Display="Dynamic" ErrorMessage="Invalid input!" ForeColor="Red" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                                &nbsp</td>
                            </tr>
                        </table>
<%--                        <div style="width:48%; margin-right: 4%; display: flex; flex-direction: column;">
                            
                        </div>
                        <div style="width:48%; display: flex; flex-direction: column;">

                        </div>--%>
                    </td>
                    <td class="auto-style5" style="color:#c7d5e0; position:relative; bottom: 10px;">City<br />
                        <asp:TextBox ID="cityTxtBox" runat="server" Width="200px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="cityTxtBox" ErrorMessage="Invalid input!" ForeColor="Red" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                    </td>
                  
                </tr>
             
                <tr>

                    <td class="auto-style2" style="color:#c7d5e0;">Delivery Address<br />
                        <asp:TextBox ID="deliveryAddressTxtBox" runat="server" Width="237px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredDeliveryAddress" runat="server" ControlToValidate="deliveryAddressTxtBox" ForeColor="Red">Required</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style5" style="color:#c7d5e0;">Zip or postal code<br />
                        <asp:TextBox ID="zipTxtBox" runat="server" Width="200px"></asp:TextBox>
                    </td>
           
                </tr>
                <tr>
                    <td class="auto-style2" style="color:#c7d5e0;">Country<br />
                        <asp:TextBox ID="countryTxtBox" runat="server" Width="235px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredCountry" runat="server" ControlToValidate="cardNoTxtBox" ForeColor="Red">Required</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="countryTxtBox" ErrorMessage="Please enter alphabetical characters only" ForeColor="Red" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style5" style="color:#c7d5e0;">Phone number<br />
                        <asp:TextBox ID="phoneTxtBox" runat="server" Placeholder="Exp: 0123456789" Width="200px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredPhoneNo" runat="server" ControlToValidate="phoneTxtBox" ForeColor="Red">Required</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="phoneTxtBox" ErrorMessage="Please enter a valid phone number" ForeColor="Red" ValidationExpression="^([0-9]{1}[0-9]{9})$"></asp:RegularExpressionValidator>
                    </td>
                   
                </tr>
                <tr style="color:#c7d5e0;">
                    <td class="auto-style2" style="color:#c7d5e0;" >
                         &nbsp;
                    </td>
               
                </tr>
                <tr style="color:#c7d5e0;">
                    <td class="auto-style2" style="color:#c7d5e0;" >
                        &nbsp;</td>
                <td class="auto-style2" style="color:#c7d5e0;" >
                        <asp:Button ID="Button1" CssClass="button" runat="server" Text="Continue" OnClick="Button1_CheckOut"/>
                    </td>
                </tr>
                <tr style="color:#c7d5e0;">
                    <td class="auto-style2" style="color:#c7d5e0;" >
                        &nbsp;</td>
                <td class="auto-style2" style="color:#c7d5e0;" >
                        &nbsp;</td>
                </tr>
            </table>
             
    <table class="tablestyle" width="22%" align="right">
      <tr>
        <th style="color:#c7d5e0;">PAYMENT METHODS<br />
            We accept the following secure payment methods:<br />
            <asp:Image ID="Image8" Width="50px" Height="40px" style="    background-color: white;" runat="server" ImageUrl="payment_img/visa.png"  />
            &nbsp;
            <asp:Image ID="Image9" Width="50px" Height="40px" style="    background-color: white;" runat="server" ImageUrl="payment_img/mastercard.png"/>
            &nbsp;
            <asp:Image ID="Image10" Width="50px" Height="40px" style="    background-color: white;" runat="server" ImageUrl="payment_img/American-Express.png"/>
            &nbsp;
            <asp:Image ID="Image1" Width="50px" Height="40px" style="    background-color: white;" runat="server" ImageUrl="payment_img/discover-novus.png"/>
            <br />
            <br />
            When you submit your payment information your data is protected by Secure Socket Layer(SSL) technology certified by a digital certificate.</th>
        
      </tr>
     
    </table>
    </div>
    </asp:Content>
