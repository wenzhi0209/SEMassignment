<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product_details.aspx.cs" Inherits="SEMAssignment.Product_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .product_type_con {
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: space-between;
            align-items: center;
            align-content: center;
            width: 80%;
            height: 500px;
            margin: 0 auto;
        }

        .imageSec {
            width: 39%;
        }

            .imageSec .productIMG {
                display: block;
                width: 80%;
                margin: 0 auto;
                max-width: 450px;
            }

        .textSec {
            width: 59%;
        }

        #product_type_con {
            width: 90%;
            min-width: 700px;
            max-width: 1300px;
            height: 500px;
            margin: 40px auto;
            background-color: #CAF0F8;
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: space-between;
            align-items: center;
            align-content: center;
        }

        .imageSec {
            width: 39%;
        }

            .imageSec img {
                width: 95%;
                max-width: 450px;
            }

        .textSec {
            width: 59%;
        }

        .prodName {
            display: block;
            padding-right: 5%;
            font-weight: bolder;
            font-size: 46px;
            margin: 20px auto;
        }

        .prodPrice {
            font-size: 30px;
            margin: 20px auto;
        }

        .typeText {
            font-size: 20px;
            margin: 20px auto;
        }

        .radioBtn label {
            display: inline-block;
            box-sizing: border-box;
            background-color: white;
            color: black;
            padding: 10px 20px;
            font-size: 16px;
            border: 2px solid #444;
            border-radius: 4px;
            cursor: pointer;
        }

        .radioBtn input {
            display: none;
        }

        .typeSec .radioBtn label:hover {
            border-color: #03045E;
        }

        .radioBtn input:focus + label {
        }

        .radioBtn input:checked + label {
            background-color: #03045E;
            color: white;
        }

        #product_desc_con {
            width: 80%;
            min-width: 700px;
            max-width: 1300px;
            margin: 40px auto;
        }

        #infoSelection {
            font-size: 30px;
            color: #03045E;
            text-align: center;
        }

        .title {
            display: block;
            font-size: 24px;
            font-weight: bolder;
            padding-left: 5%;
            margin-top: 50px;
            margin-bottom: 10px;
        }

        .text {
            display: block;
            font-size: 16px;
            font-weight: lighter;
            padding-left: 8%;
        }

        .operationSec {
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: space-around;
            align-items: center;
            align-content: center;
            width: 500px;
            margin-top: 40px;
        }

        .qtyOpe {
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: center;
            align-items: center;
            align-content: center;
            width: 140px;
        }

        .qtyBtn {
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: center;
            align-items: center;
            align-content: center;
            text-align: center;
            font-weight: bolder;
            font-size: 36px;
            border: 0;
            padding: 0;
            height: 40px;
            width: 40px;
            cursor: pointer;
            background-color: #CAF0F8;
            color: black;
            box-sizing: border-box;
            border: 2px solid #03045E;
        }

            .qtyBtn:hover {
                background-color: #03045E;
                color: white;
            }

        .qtyDis {
            display: block;
            text-align: center;
            font-weight: bolder;
            font-size: 24px;
            border: 0;
            padding: 0;
            height: 40px;
            width: 50px;
            line-height: 40px;
            box-sizing: border-box;
            border: 2px solid #03045E;
        }

        .cartBtnASP {
            padding: 0;
            box-sizing: border-box;
            font-size: 18px;
            height: 60px;
            width: 180px;
            line-height: 60px;
            font-size: 18px;
            color: black;
            text-decoration: none;
            border: black solid 2px;
            cursor: pointer;
            background-color: #03045E;
        }

        .cartBtn {
            padding: 0;
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: space-between;
            align-items: center;
            align-content: center;
            box-sizing: border-box;
            font-size: 18px;
            height: 60px;
            width: 180px;
            line-height: 60px;
            font-size: 18px;
            color: black;
            text-decoration: none;
            border: black solid 2px;
            cursor: pointer;
            background-color: #03045E;
        }

        .buttonSec {
            display: flex;
            flex-direction: row;
        }

        .cart_icon_div {
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: center;
            align-items: center;
            align-content: center;
            height: 100%;
            width: 26%;
        }

        .cart_icon {
            display: block;
            height: 30px;
            width: 30px;
        }

        .cart_text {
            width: 60%;
            padding-right: 6%;
            padding-left: 6%;
            height: 100%;
            line-height: 56px;
            background-color: #CAF0F8;
        }

        .cartBtn:hover .cart_text {
            background-color: #03045E;
            color: white;
        }

        #relate_product_con {
            width: 90%;
            min-width: 700px;
            max-width: 1300px;
            margin: 40px auto;
            margin-top: 80px;
        }

        .secTitle {
            font-size: 30px;
            color: #03045E;
            text-align: center;
        }

        #relate_product_con a {
            text-decoration: none;
            color: black;
        }

            #relate_product_con a:link {
                text-decoration: none;
                color: black;
            }

            #relate_product_con a:visited {
                text-decoration: none;
                color: black;
            }

            #relate_product_con a:hover {
                text-decoration: none;
                color: black;
            }

            #relate_product_con a:active {
                text-decoration: none;
                color: black;
            }

        .rpContainer {
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: space-between;
            align-items: center;
            align-content: center;

        }

        .rpProd {
            width: 20%;
            height: 400px;
            box-sizing: border-box;
            border: 1px solid black;
            box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1), 0 3px 10px 0 rgba(0, 0, 0, 0.1);
        }

            .rpProd:hover {
                border: 4px solid #03045E;
            }

        .rpImageSec {
            width: 100%;
            height: 60%;
            margin: 4% auto;
        }

            .rpImageSec img {
                display: block;
                height: 100%;
                margin: 0 auto;
            }

        .rpNameSec {
            display: block;
            width: 90%;
            margin: 2% auto;
            font-size: 18px;
            font-weight: bold;
        }

        .rpPrice {
            display: block;
            width: 90%;
            margin: 2% auto;
            font-size: 16px;
        }

        .hideRelate {
            display: none;
        }

        .btnLeftRight {
            height: 60px;
            width: 60px;
            font-weight: bolder;
            font-size: larger;
            color: black;
            background-color: #CAF0F8;
            transition: 0.3s;
            cursor: pointer;
        }

            .btnLeftRight:hover {
                transition: ease-in-out;
                transition: 0.3s;
                height: 60px;
                width: 60px;
                font-weight: bolder;
                color: white;
                background-color: #03045E;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="product_details_con">

        <div id="product_type_con">
            <div class="imageSec">
                <asp:Image ID="productIMG" class="productIMG" runat="server" ImageUrl="~/productImage/test.png" />
            </div>
            <div class="textSec">
                <asp:Label ID="productName" CssClass="prodName" runat="server" Text=""></asp:Label>

                <asp:PlaceHolder ID="priceHolder" runat="server"></asp:PlaceHolder>

                <div class="typeText">Choose Type/Model</div>

                <!--Using Loop to load the type selection-->
                <div class="typeSec">
                    <asp:PlaceHolder ID="typeHolder" runat="server"></asp:PlaceHolder>
                </div>

                <div class="operationSec">
                    <div class="qtyOpe">
                        <button onclick="decreaseCount(event, this); return false;" class="qtyBtn">-</button>
                        <input type="text" value="1" id="qtyNeed" name="qtyNeed" class="qtyDis" />
                        <button onclick="increaseCount(event, this); return false;" class="qtyBtn">+</button>
                    </div>
                    <div class="buttonSec">
                        <button class="cartBtn" runat="server" onserverclick="Add_to_Cart_Click">
                            <div class="cart_icon_div">
                                <img class="cart_icon" src="icon\shopping-cart-white.png" />
                            </div>
                            <div class="cart_text">Add to Cart</div>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div id="product_desc_con">

            <div id="infoSelection">
                Detail
            </div>
            <hr style="width: 100%; margin: 25px auto;" />

            <div id="detailShow">

                <asp:Label ID="prodDescT" CssClass="title" runat="server" Text="Product Description"></asp:Label>
                <asp:PlaceHolder ID="prodDescHolder" runat="server"></asp:PlaceHolder>

                <asp:Label ID="prodSpecT" CssClass="title" runat="server" Text="Specification"></asp:Label>
                <asp:PlaceHolder ID="prodSpecHolder" runat="server"></asp:PlaceHolder>
            </div>

            <div id="featureShow">

                <asp:Label ID="prodFBT" CssClass="title" runat="server" Text="Features & Benefits"></asp:Label>
                <asp:PlaceHolder ID="prodFBHolder" runat="server"></asp:PlaceHolder>
            </div>
        </div>

        <div id="relate_product_con">
            <div class="secTitle">Product Suggestion</div>
            <hr style="width: 70%; margin: 25px auto;" />
            <!--Change to auto generate-->

            <div class="rpContainer">
                <button class="btnLeftRight" type="button" onclick="plusDivsRP(-1); return false;">&#10094;</button>
                <asp:PlaceHolder ID="rProdHolder" runat="server"></asp:PlaceHolder>
                <button class="btnLeftRight" type="button" onclick="plusDivsRP(1); return false;">&#10095;</button>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [product_name], [product_category] FROM [Product] WHERE ([product_Id] = @product_Id)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="P0010" Name="product_Id" QueryStringField="para" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>

        var rpIndex = 1;
        showDivsRP(rpIndex);

        function plusDivsRP(n) {
            showDivsRP(rpIndex += n);
        }

        function showDivsRP(n) {
            var i;
            var x = document.getElementsByClassName("rpProd");

            slideNum = x.length / 4;

            if (slideNum == 1) {
                var y = document.getElementsByClassName("btnLeftRight");
                y[0].style.opacity = 0;
                y[0].style.disabled = true;
                y[1].style.opacity = 0;
                y[1].style.disabled = true;
                y[0].style.cursor = "default";
                y[1].style.cursor = "default";
            }

            if (n > slideNum) { rpIndex = 1 }
            if (n < 1) { rpIndex = slideNum }

            for (i = 0; i < slideNum; i++) {
                x[i * 4].style.display = "none";
                x[i * 4 + 1].style.display = "none";
                x[i * 4 + 2].style.display = "none";
                x[i * 4 + 3].style.display = "none";
            }
            x[(rpIndex - 1) * 4].style.display = "block";
            x[(rpIndex - 1) * 4 + 1].style.display = "block";
            x[(rpIndex - 1) * 4 + 2].style.display = "block";
            x[(rpIndex - 1) * 4 + 3].style.display = "block";

        }

        function increaseCount(a, b) {
            var input = b.previousElementSibling;
            var value = parseInt(input.value, 10);
            value = isNaN(value) ? 0 : value;
            value++;
            input.value = value;
        }

        function decreaseCount(a, b) {
            var input = b.nextElementSibling;
            var value = parseInt(input.value, 10);
            if (value > 1) {
                value = isNaN(value) ? 0 : value;
                value--;
                input.value = value;
            }
        }
    </script>
</asp:Content>