<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Postar.aspx.cs" Inherits="WebApplication5.Postar" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <script src="https://assets.what3words.com/sdk/v3/what3words.js?key=QX2Y7RZ3"></script>
    <script
        src="https://assets.what3words.com/sdk/v3/what3words.js?key=QX2Y7RZ3">
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap');
        a, a:visited, a:hover, a:active {
            color: #c45302;
            text-decoration: none;
        }

        #viewDiv {
            height: 450px;
            width: 800px;
        }

        #instruction {
            padding: 15px;
            background: white;
            color: black;
            border: 5px solid gold;
            font-family: sans-serif;
            font-size: 1.2em;
        }
        .auto-style2 {
            height: 100px;
        }
        .auto-style3 {
            height: 120px;
        }
        .auto-style4 {
            height: 120px;
            width: 449px;
        }
        .auto-style5 {
            height: 100px;
            width: 449px;
        }
        .auto-style7 {
            width: 70%;
            height: 324px;
        }
        .auto-style8 {
            width: 100%;
            height: 368px;
        }
          .textbox {
            border: 1px solid #c4c4c4;
            font-size: 13px;
            padding: 4px 4px 4px 4px;
            border-radius: 4px;
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            box-shadow: 0px 0px 8px #d9d9d9;
            -moz-box-shadow: 0px 0px 8px #d9d9d9;
            -webkit-box-shadow: 0px 0px 8px #d9d9d9;
        }

            .textbox:focus {
                outline: none;
                border: 1px solid #7bc1f7;
                box-shadow: 0px 0px 8px #7bc1f7;
                -moz-box-shadow: 0px 0px 8px #7bc1f7;
                -webkit-box-shadow: 0px 0px 8px #7bc1f7;
            }

        .example_e {
            border: none;
            background: #404040;
            color: #ffffff !important;
            font-weight: 100;
            padding: 20px;
            text-transform: uppercase;
            border-radius: 6px;
            display: inline-block;
            transition: all 0.3s ease 0s;
        }

            .example_e:hover {
                color: #404040 !important;
                font-weight: 700 !important;
                letter-spacing: 3px;
                background: none;
                -webkit-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.57);
                -moz-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.57);
                transition: all 0.3s ease 0s;
            }
    </style>

    <link rel="stylesheet" href="https://js.arcgis.com/4.11/esri/css/main.css" />
    <script src="https://js.arcgis.com/4.11/"></script>

    <script>
        require([
            "esri/tasks/Locator",
            "esri/Map",
            "esri/views/MapView",
            "esri/Graphic"
        ], function (Locator, Map, MapView, Graphic) {
            var locatorTask = new Locator({
                url:
                    "https://geocode.arcgis.com/arcgis/rest/services/World/GeocodeServer"
            });

            var map = new Map({
                basemap: "topo-vector"
            });

            var view = new MapView({
                container: "viewDiv",
                map: map,
                center: [-8.61099, 41.14961], // longitude, latitude
                zoom: 18
            });

            view.ui.add("instruction", "bottom-left");

            var point = {
                type: "point",
                longitude: -8.61099,
                latitude: 41.14961
            };

            var simpleMarkerSymbol = {
                type: "simple-marker",
                color: [226, 119, 40],  // orange
                outline: {
                    color: [255, 255, 255], // white
                    width: 1
                }
            };

            var pointGraphic = new Graphic({
                geometry: point,
                symbol: simpleMarkerSymbol
            });

            view.graphics.add(pointGraphic);

            view.popup.autoOpenEnabled = false;
            view.on("click", function (event) {

                var lat = Math.round(event.mapPoint.latitude * 100000) / 100000;
                var lon = Math.round(event.mapPoint.longitude * 100000) / 100000;

                view.popup.open({
                    title: "Reverse geocode: [" + lon + ", " + lat + "]",
                    location: event.mapPoint
                });

                document.getElementById("instruction").innerHTML = "Lon: " + lon + " / Lat: " + lat;

                document.getElementById("lat").value = lat;
                document.getElementById("lng").value = lon;

                locatorTask
                    .locationToAddress(event.mapPoint)
                    .then(function (response) {
                        view.popup.content = response.address;
                        document.getElementById("endereco").value = response.address;
                    })
                    .catch(function (error) {
                        view.popup.content = "endereço não encontrado";
                    });
            });
            what3words.api.convertTo3wa({ lat: lat, lng: lng }).then(function (response) {

            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />

            <div id="viewDiv" style="margin: auto; box-shadow:20px; margin-top: 10px; width: 50%; padding: 10px;">
            </div>
            <div id="instruction" style="margin: auto; width: 50%; padding: 10px;">
                clicar no mapa para obter Lat/Lng e endereço
            </div>
            <div style="margin: auto; box-shadow:20px; text-align: center; padding: 10px;" class="auto-style7">
                <table class="auto-style8">
                    <tr>
                        <td class="auto-style4">
                            <br />
                Latitude
                            <br />
            <br />
                <asp:TextBox runat="server" CssClass="textbox" ID="lat" Width="100px" meta:resourcekey="latResource1" />
                <br />
                <br />
                Longitudebr />
            Longitude<br />
                            <br />
                &nbsp;<asp:TextBox runat="server" CssClass="textbox" ID="lng" Width="100px" meta:resourcekey="lngResource1" />
                        </td>
                        <td class="auto-style3">
                            <br />
                Endereço
                            <br />
            <br />
                <asp:TextBox runat="server" ID="endereco" CssClass="textbox" Width="350px" meta:resourcekey="enderecoResource1" />
                <br />
                <br />
                Nome<br />
                            <br />
                <asp:TextBox ID="TextBoxNOME" CssClass="textbox" runat="server"></asp:TextBox>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">
                <br />
                Legenda<br />
                            <br />
                <asp:TextBox runat="server" ID="TextLegenda" CssClass="textbox" TextMode="MultiLine" Rows="10" meta:resourcekey="MyBoxResource1" Height="140px" Width="367px" />
                        </td>
                        <td class="auto-style2">Foto<br />
                            <br />
                &nbsp;<asp:FileUpload ID="FileUpload1" runat="server" accept="image/x-png,image/gif,image/jpeg" meta:resourcekey="FileUpload1Resource1" />
                <br />
                <br />
                Fotos adicionais<br />
                            <br />
                <asp:FileUpload ID="FileUpload2" runat="server" AllowMultiple="True" />
                        </td>
                    </tr>
                </table>
         
            </div>
                <ul>
                    <li style="list-style-type: none; float:right"><asp:Button ID="Button1" runat="server" Text="Enviar" CssClass="example_e" OnClick="Button1_Click" meta:resourcekey="Button1Resource1" Height="45px" /></li>
                    <li style="list-style-type: none; float:left"><asp:Button ID="Button2" runat="server" CssClass="example_e" Text="VOLTAR" OnClick="Button2_Click1" Height="45px"/></li>
                </ul>
            <p>
                &nbsp;</p>
            <p>
                &nbsp;</p>
        </div>
    </form>
</body>

</html>
