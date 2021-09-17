<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="shopping_cart.aspx.cs" Inherits="SEMAssignment.shopping_cart" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .checkout_btn {
            background-color:#CCFFFF;
            Height:30pt;
            Width:100pt;
            Font-Size:Large;
            float:right;
            margin-right:15%;
        }
        .checkout_btn:hover {
            background-color:#03045e;
            color:white;
            Height:30pt;
            Width:100pt;
            Font-Size:Large;
        }
    </style>
    <script>

        //run the backend code
        function confirmation() {
            return confirm("Are you sure you want to continue checkout? ");
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>

    <asp:Image ID="Image1" runat="server" style="display: block;margin: auto; width: 20em;" ImageUrl="~/CheckoutPage.JPG"/>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" CellPadding="4"  ForeColor="#333333" GridLines="None" EmptyDataText="There are no data records to display." Style="margin-left:10%; width:80%; text-align: center;">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="sequence" HeaderText="No." />
            <asp:BoundField DataField="product_name" HeaderText="Product Name" SortExpression="product_name" />
            <asp:ImageField DataImageUrlField="image" HeaderText="Product Image" ControlStyle-Width="100px"/>
            <asp:BoundField DataField="product_stock_price" HeaderText="Unit Price" SortExpression="product_stock_price" />
            <asp:BoundField DataField="qty" HeaderText="Quantity" />
            <asp:BoundField DataField="subtotal" HeaderText="Sub Total" />
            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="?DelID={0}" HeaderText="Action" Text="delete" />
            
        </Columns>
        <EditRowStyle BackColor="#2461BF"  />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>

    <h2 style="margin-left:78%">Total: RM <asp:Label ID="total_label" runat="server" ></asp:Label></h2>
    <div style="margin-left:12%">
        
        <!----> 
        <asp:Button ID="Button1" runat="server" Text="Checkout"  CssClass="checkout_btn" OnClick="Button1_Click"  OnClientClick="return confirmation();" />

          <!--  --> 
        <!--
       <a href="Payment.aspx">
            PostBackUrl="~/Payment.aspx"
           <button id="button1" class="checkout_btn">Checkout</button>

       </a>
            -->
    </div>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
