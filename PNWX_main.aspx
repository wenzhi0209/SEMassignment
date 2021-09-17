<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PNWX_main.aspx.cs" Inherits="SEMAssignment.PNWX_main" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>PNWX MainPage</title>
    <style>
        #slide_show {
            height: 500px;
            overflow: hidden;
        }

        FxF_con {
            overflow: hidden;
        }

        .parent {
            display: flex;
            flex-direction: column;
            width: 80%;
            min-height: 700px;
            max-width: 1100px;
            min-width: 700px;
            background: #fff;
            margin: 0 auto;
        }

        .row {
            flex: 1;
            display: flex;
            margin-top: 1%;
            margin-bottom: 1%;
        }

        .column {
            flex: 1;
            box-sizing: border-box;
            border: solid black 2px;
        }

            .column + .column {
                margin-left: 2%;
            }

        #slide_show_con {
            position: relative;
            width: 100%;
            min-width: 700px;
            max-width: 1300px;
            height: 500px;
            margin: 40px auto;
            background-color: #CAF0F8;
        }

        .arrowBtnSec {
            position: absolute;
            left: 80%;
            top: 80%;
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

        .slideShow {
            display: none;
            padding-top: 30px;
        }

        .slideCon {
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
            height: 100%;
        }

            .imageSec img {
                display: block;
                width: 98%;
                max-width: 450px;
            }

        .textSec {
            width: 56%;
            margin-left: 3%;
        }

        .comName {
            font-family: "Times New Roman", Times, serif;
            font-weight: bolder;
            font-size: 40px;
        }

        .productName {
            font-weight: bolder;
            font-size: 20px;
        }

        .description {
            font-size: 14px;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
        }

        .cartBtn {
            padding:0;
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

        .viewBtn {
            display: block;
            box-sizing: border-box;
            height: 60px;
            width: 150px;
            font-size: 18px;
            text-align: center;
            line-height: 56px;
            color: black;
            text-decoration: none;
            border: black solid 2px;
            cursor: pointer;
            background-color: #CAF0F8;
        }

        .buttonSec {
            display: flex;
            flex-direction: row;
        }

        .cart_icon_div
        {
            display:flex;
            flex-direction: row;
	        flex-wrap: nowrap;
	        justify-content: center;
	        align-items: center;
	        align-content: center;
            height:100%;
            width:26%;
        }

        .cart_icon {
            display:block;
            height: 30px;
            width: 30px;
        }

        .cart_text{
            width:60%;
            padding-right:6%;
            padding-left:6%;
            height:100%;
            line-height:56px;
            background-color:#CAF0F8;

        }

        .viewBtn:hover {
            background-color: #03045E;
            color: white;
        }

        .cartBtn:hover .cart_text{
            background-color: #03045E;
            color: white;
        }


        .colSec {
            height: 100%;
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: space-between;
            align-items: center;
            align-content: center;
            padding: 0 2%;
        }

        .colText {
            width: 60%;
            padding: 0 1%;
        }

        .colIMG {
            width: 38%;
            padding: 0 1%
        }

            .colIMG img {
                max-width: 200px;
                width: 90%;
            }

        .colTitle {
            font-size: 22px;
            font-weight: bolder;
        }

        .colDesc {
            font-size: 16px;
        }

        .discoverLink {
            text-decoration: underline;
            display:block;
            box-sizing:border-box;
            font-size: larger;
            font-weight: bolder;
            text-decoration-thickness: 2px;
        }

        .colSec a:link {
            color:black;
        }

        .colSec a:visited {
            color:black;
        }

        .colSec a:hover {
            color:#03045E;
            text-decoration-thickness: 4px;
        }

        .colSec a:active {
            color:black;
        }
    </style>

    <script>

        //run the backend code
        function cartTest(id, name) {
            var r = confirm("Confirm add this product into cart ?")
            if (r == true) {
                PageMethods.Add_to_Cart_Click(id, name, getResult);
            }
            else {
                alert("Operation cancelled");
            }
            
        }
        //retrive the return value from backend code
        function getResult(result) {
            alert(result);
        }
    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="mainpage_con">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <!--slide show box container-->
        <div id="slide_show_con">
            <asp:PlaceHolder ID="slideHolder" runat="server"></asp:PlaceHolder>

            <div class="arrowBtnSec">
                <button class="btnLeftRight" onclick="plusDivs(-1); return false;">&#10094;</button>
                <button class="btnLeftRight" onclick="plusDivs(1); return false;">&#10095;</button>
            </div>
        </div>

        <!--4*4 box container-->
        <div class="FxF_con">
            <div class="parent">
                <div class="row">
                    <div class="column">

                        <div class="colSec">
                            <div class="colText">
                                <div class="colTitle">Equipments</div>
                                <div class="colDesc">See the X-Ray / Radiology / Medical Equipment now</div>
                                <br />
                                <a class="discoverLink" href="sub_catalogue.aspx?prod_cat=Equipment">Discover Now</a>
                            </div>

                            <div class="colIMG">
                                <img src="productImage/ProtecOPTIMAXTableTopFilmProcessor.jpg" />
                            </div>
                        </div>
                    </div>
                    <div class="column">

                        <div class="colSec">
                            <div class="colText">
                                <div class="colTitle">Accessories</div>
                                <div class="colDesc">See the X-Ray / Radiology Accessories now</div>
                                <br />
                                <a class="discoverLink" href="sub_catalogue.aspx?prod_cat=Accesories">Discover Now</a>
                            </div>

                            <div class="colIMG">
                                <img src="productImage/DeluxeBlanketWarmingCabinet.jpg" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="column">
                        <div class="colSec">
                            <div class="colText">
                                <div class="colTitle">Supplies</div>
                                <div class="colDesc">See the X-Ray Consumable Supplies now</div>
                                <br />
                                <a class="discoverLink" href="sub_catalogue.aspx?prod_cat=Supplies">Discover Now</a>
                            </div>

                            <div class="colIMG">
                                <img src="productImage/HandSanitizer.jpg" />
                            </div>
                        </div>
                    </div>
                    <div class="column">
                        <div class="colSec">
                            <div class="colText">
                                <div class="colTitle">Parts</div>
                                <div class="colDesc">See the X-Ray Parts/Components now</div>
                                <br />
                                <a class="discoverLink" href="sub_catalogue.aspx?prod_cat=Parts">Discover Now</a>
                            </div>

                            <div class="colIMG">
                                <img src="productImage/ReplacementCollimatorLampsClearance.jpg" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="script" runat="server">
    <script language="javascript">
        var slideIndex = 1;
        showDivs(slideIndex);

        function plusDivs(n) {
            showDivs(slideIndex += n);
        }

        function showDivs(n) {
            var i;
            var x = document.getElementsByClassName("slideShow");
            if (n > x.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = x.length }
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            x[slideIndex - 1].style.display = "block";
        }
    </script>
</asp:Content>