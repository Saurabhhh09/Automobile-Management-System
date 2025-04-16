<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddCarDetails.aspx.cs" Inherits="KIA.Admin.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 p-5">
        <h1 class="text-center pt-4">Add New Car</h1>
        <div class="form">

            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                        <h5>
                            <label for="txtName">Model Name:</label></h5>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Model name"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                        <h5>
                            <label for="DdCarType">Car Type:</label></h5>
                        <asp:DropDownList ID="DdCarType" runat="server" CssClass="form-control  w-100 form-select"></asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                        <h5>
                            <label for="txtTypeFuel">Fuel Type:</label></h5>
                        <asp:TextBox ID="txtTypeFuel" runat="server" CssClass="form-control" placeholder="Fuel Type"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                        <h5>
                            <label for="txtFuelEffeciency">Fuel Efficiency:</label></h5>
                        <asp:TextBox ID="txtFuelEffeciency" runat="server" CssClass="form-control" placeholder="Fuel Effeciency"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                        <h5>
                            <label for="txtSeating">Seating Capacity:</label></h5>
                        <asp:TextBox ID="txtSeating" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                        <h5>
                            <label for="txtDescription">Description:</label></h5>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Description" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                        <h5>
                            <label for="txtYear">Release Year:</label></h5>
                        <asp:TextBox ID="txtYear" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                        <h5>
                            <label for="txtPrice">Price:</label></h5>
                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Price"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                        <h5>
                            <label for="txtColor">Color:</label></h5>
                        <asp:TextBox ID="txtColor" runat="server" CssClass="form-control" placeholder="Color"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12 mb-3">
                    <div class="form-group">
                        <h5>
                            <label for="txtImage">Image:</label></h5>
                        <asp:FileUpload ID="UplImg" runat="server" CssClass="form-control" />
                        <span class="text-danger">(Upload only jpeg/jpg/png format and size less than 1MB.)</span>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                        <h5>
                            <label for="txtTopSpeed">Top Speed:</label></h5>
                        <asp:TextBox ID="txtTopSpeed" runat="server" CssClass="form-control" placeholder="Top Speed"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="form-group">
                        <h5>
                            <label for="txtEngineType">Engine Type:</label></h5>
                        <asp:TextBox ID="txtEngineType" runat="server" CssClass="form-control" placeholder="Engine Type"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-12 col-sm-12 text-center">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-rounded btn-outline-primary me-3 px-5" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-rounded btn-outline-danger px-5" OnClick="btnReset_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
