<%@ Page Title="" Language="C#" MasterPageFile="~/Default/defaultMaster.Master" AutoEventWireup="true" CodeBehind="CarDetails.aspx.cs" Inherits="KIA.Default.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid mt-5 py-5 px-5">
        <div class="container p-3">
            <asp:DetailsView ID="CarDetailsView" runat="server"
                AutoGenerateRows="false">

                <Fields>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="row mt-3 w-100">
                                <div class="col-md-7 border-end border-dark">
                                    <div class="row">
                                        <div class="col-12">
                                            <img src='<%# "/UploadImage/" + Eval("ImgPath") %>' class="img-fluid img-thumbnail" />
                                        </div>
                                        <div class="row pt-4 mx-2">
                                            <div class="col-md-12">
                                                <p class="text-center">Description :</p>
                                                <h5><%# Eval("Description") %> </h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4 py-2 ms-5 text-center">
                                    <div>
                                        <h3 class="text-center mb-3 display-3 border-bottom border-dark"><%# Eval("Name") %></h3>
                                    </div>

                                    <div class="mb-3 d-flex justify-content-between">
                                        Seating Capacity : 
                                    <h5><%# Eval("SeatingCapacity") %></h5>
                                    </div>

                                    <div class="mb-3 d-flex justify-content-between">
                                        Fuel Type :  
                                      <h5><%#Eval("FuelType") %></h5>
                                    </div>

                                    <div class="mb-3 d-flex justify-content-between">
                                        Fuel Efficiency : 
                                         <h5><%#Eval("FuelEfficiency") %></h5>
                                    </div>

                                    <div class="mb-3 d-flex justify-content-between">
                                        Top Speed : 
                                    <h5><%#Eval("TopSpeed") %></h5>
                                    </div>

                                    <div class="mb-3 d-flex justify-content-between">
                                        Engine : 
                                    <h5><%#Eval("EngineType") %></h5>
                                    </div>

                                    <div class="mb-3 d-flex justify-content-between">
                                        Color : 
                                       <h5><%#Eval("Colour") %></h5>
                                    </div>

                                    <div class="mb-3 d-flex justify-content-between">
                                        Release Year : 
                                     <h5><%# Eval("ReleaseYear") %></h5>
                                    </div>

                                    <div class="mb-3 d-flex justify-content-between">
                                        Price : 
                                    <h5><%# Eval("Price") %></h5>
                                    </div>
                                    <hr class="border-top border-dark" />
                                    <div class="mt-3">
                                        <asp:Button ID="btnBook" runat="server" Text="Book Now ->" CssClass="btn btn-dark w-100"  OnClick="btnBook_Click"/>
                                    </div>

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </div>
    </div>

</asp:Content>
