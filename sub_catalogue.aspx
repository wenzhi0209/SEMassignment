<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="sub_catalogue.aspx.cs" Inherits="SEMAssignment.sub_catalogue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="subtitle" runat="server" style="margin-left:45%; font-size: 30px;"></asp:Label>
    <br />
    <br />
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <table style="margin-left:30%; border: 2px solid black; width: 50%;">
                <tr>
                    <td>
                        Product Name:
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton1_Click" CommandArgument='<%# Eval("product_id") %>'> <%# Eval("product_name") %>' </asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        Model:
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("product_stock_id") %>'></asp:Label>
                    </td>   
                </tr>
                <tr>
                     <td>
                        Image:
                    </td>
                    <td>
                        <asp:Image ID="Image1" runat="server" src='<%# Eval("product_image") %>' />
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [product_Id], [product_name], [product_stock_id], [product_image] FROM [Product] WHERE ([product_category] = @product_category)">
        <SelectParameters>
            <asp:QueryStringParameter Name="product_category" QueryStringField="prod_cat" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
    <asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
