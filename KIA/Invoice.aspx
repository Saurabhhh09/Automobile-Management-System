<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="KIA.Invoice" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Invoice</title>


</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:Button ID="btnHome" runat="server" Text="Home" PostBackUrl="~/Home/DemoHome.aspx" />
            </div>
            <div>
                <asp:Button ID="BtnInvoice" runat="server" Text="Download Print" OnClick="BtnInvoice_Click" />
            </div>
        </div>
        <div style="background-color: #eff1f2; width: 100%; overflow-x: hidden;" id="invoice" runat="server">
            <h1 style="text-align: center">KIA

              

            </h1>
            <hr />
            <div>
                <div style="padding-left: 20%">
                    <asp:DetailsView ID="CarDetailsView" runat="server"
                        AutoGenerateRows="false" Width="70%">

                        <Fields>
                            <asp:TemplateField ItemStyle-Width="100%">
                                <ItemTemplate>
                                    <table style="width: 100%">
                                        <tr>
                                            <td>Car Name:</td>
                                            <td><%# Eval("Name") %></td>
                                        </tr>
                                        <tr>
                                            <td>Fuel Type:</td>
                                            <td><%# Eval("FuelType") %></td>
                                        </tr>
                                        <tr>
                                            <td>Seating Capacity:</td>
                                            <td><%# Eval("SeatingCapacity") %></td>
                                        </tr>
                                        <tr>
                                            <td>Top Speed:</td>
                                            <td><%# Eval("TopSpeed") %></td>
                                        </tr>
                                        <tr>
                                            <td>Colour:</td>
                                            <td><%# Eval("Colour") %></td>
                                        </tr>
                                        <tr>
                                            <td>Fuel Efficiency:</td>
                                            <td><%# Eval("FuelEfficiency") %></td>
                                        </tr>
                                        <tr>
                                            <td>Engine Type:</td>
                                            <td><%# Eval("EngineType") %></td>
                                        </tr>
                                        <tr>
                                            <td>Release Year:</td>
                                            <td><%# Eval("ReleaseYear") %></td>
                                        </tr>
                                    </table>


                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                </div>
            </div>
            <div>
                <div style="padding-left: 20%">

                    <asp:DetailsView ID="UserDetailView" runat="server" AutoGenerateRows="false" Width="70%">
                        <Fields>
                            <asp:TemplateField ItemStyle-Width="100%">
                                <ItemTemplate>

                                    <table style="width: 100%;">
                                        <tr>
                                            <td>Name:</td>
                                            <td><%# Eval("Name") %></td>
                                        </tr>
                                        <tr>
                                            <td>Contact No:</td>
                                            <td><%# Eval("Contact_No") %></td>
                                        </tr>
                                        <tr>
                                            <td>Address:</td>
                                            <td><%# Eval("Address") %></td>
                                        </tr>
                                        <tr>
                                            <td>Pincode:</td>
                                            <td><%# Eval("PinCode") %></td>
                                        </tr>
                                        <tr>
                                            <td>Delivery Date:</td>
                                            <td><%# Eval("Delivery_Date") %></td>
                                        </tr>
                                        <tr>
                                            <td>Order Date:</td>
                                            <td><%# Eval("Date") %></td>
                                        </tr>
                                    </table>

                                    <%-- <div class="row w-100">

                                        <div class="mb-3 d-flex justify-content-between">
                                            Name : 
                                        <h5><%#Eval("Name") %></h5>
                                        </div>
                                        <div class="mb-3 d-flex justify-content-between">
                                            Contact No : 
                                        <h5><%#Eval("Contact_No") %></h5>
                                        </div>
                                        <div class="mb-3 d-flex justify-content-between">
                                            Address : 
                                        <h5><%#Eval("Address") %></h5>
                                        </div>
                                        <div class="mb-3 d-flex justify-content-between">
                                            Pincode : 
                                        <h5><%#Eval("PinCode") %></h5>
                                        </div>
                                        <div class="mb-3 d-flex justify-content-between">
                                            Order Date : 
                                        <h5><%#Eval("Date") %></h5>
                                        </div>
                                        <div class="mb-3 d-flex justify-content-between">
                                            Delivery Date : 
                                        <h5><%#Eval("Delivery_Date") %></h5>
                                        </div>
                                    </div>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>

                </div>
            </div>
            <div style="padding-left: 20%; padding-bottom: 10px;">

                <table style="width: 100%;">
                    <tr>
                        <td>Price:
                        </td>
                        <td>
                            <asp:Label ID="lblPrice" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Tax:
                        </td>
                        <td>
                            <asp:Label ID="lblTax" runat="server" Text="+ 28%"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Total Amount:
                        </td>
                        <td>
                            <asp:Label ID="lblAmount" runat="server"></asp:Label></td>
                    </tr>
                </table>

            </div>
            <hr />
            <div>
                <h2 style="text-align: center;">Thank You!</h2>
            </div>
        </div>
    </form>
</body>
</html>

