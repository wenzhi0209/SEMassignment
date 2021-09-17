<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="SEMAssignment.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 437px;
        }
        .accordion {
              background-color: #eee;
              color: #444;
              cursor: pointer;
              padding: 18px;
              width: 100%;
              border: none;
              text-align: left;
              outline: none;
              font-size: 15px;
              transition: 0.4s;
            }

            .active, .accordion:hover {
              background-color: #ccc; 
            }

            .panel {
              padding: 0 18px;
              display: none;
              background-color: white;
              overflow: hidden;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div>
            <asp:Image ID="Image1" runat="server" Width="60%" Height="460px" style="display: block; margin-left: auto;margin-right: auto;" ImageUrl ="payment_img/medicalteam.jpg"/>
                       <table style="width: 80%;display: inline-table;margin-left: 10%;">
                <tr>
                    <td class="auto-style2"><h2>About Us </h2></td>

                </tr>

            </table>
            <table style="width: 80%;display: inline-table;margin-left: 10%;border:5px solid gray; border-bottom-color:white; border-top-color:white; border-right-color:white">
                <tr>
                    <td class="auto-style2" >Pacific Northwest X-Ray Inc provides x-ray equipment. The Company offers portable radiographic, cabinetry, eyewear, gloves, aprons, and other related products. Pacific Northwest X-Ray serves customers in the United States.</td>
                </tr>

            </table>
            <hr style="width: 80%;margin: 0 auto;"/>
            <table style="width: 80%;display: inline-table;margin-left: 10%; border:5px solid gray; border-top-color:white; border-bottom-color:white; border-top-color:white; border-right-color:white">
                <tr>
                    <td><p style="font-size:smaller">SECTOR</p><p style="font-size:medium">Health Care</p></td>
                    <td><p style="font-size:smaller">INDUSTRY</p><p style="font-size:medium">Health Care</p></td>
                    <td><p style="font-size:smaller">SUB-INDUSTRY</p><p style="font-size:medium">Medical Equipment & Devices</p></td>
                    <td><p style="font-size:smaller">Address</p><p style="font-size:medium">PO Box 625 Gresham, OR 97030 United States</p></td>
                    <td><p style="font-size:smaller">PHONE</p><p style="font-size:medium">1-503-667-3000</p></td>
                </tr>
            </table>
            <br />
            <br />
            <br />
             <br />
            <br />
            <h1 style="text-align:center">Services</h1>
                <br />
            <table style="width: 70%;margin-left: auto;margin-right: auto;">
                <tr>
                    <td style="text-align:center;">
                        <asp:Image ID="Image2" runat="server" Height="200px" Width="200px" ImageUrl="icon/icon1.png"/></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                    <td style="text-align:center;"><asp:Image ID="Image3" runat="server" Height="200px" Width="200px" ImageUrl="icon/icon2.png"/></td>
                    <td >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                    <td style="text-align:center;"><asp:Image ID="Image4" runat="server" Height="200px" Width="200px" ImageUrl="icon/icon3.png"/></td>
                </tr>
                <tr>
                    <td style="text-align:center;"><h3> Innovative Product</h3></td>
                    <td></td>
                    <td style="text-align:center;"><h3>Competitive Pricing</h3></td>
                    <td style="text-align:center;"></td>
                    <td style="text-align:center;"><h3> Web Hosting & Security</h3></td>
                </tr>
                <tr>
                    <td style="text-align:center;">We provide cutting-edge Name Brand product choices with complete and high quality product information. Innovative product is updated daily as old technology becomes obsolete.</td>
                    <td></td>
                    <td style="text-align:center;">We pass our bulk purchase savings onto you for the lowest market price on products. Our customers find that we offer a better value than their small local dealer can.</td>
                    <td></td>
                    <td style="text-align:center;">We provide co-location and web serving for other businesses. All systems are secure and UPS power protected, by auto-starting and transferring generation systems</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
           
            

        </div>
        
 </asp:Content>
