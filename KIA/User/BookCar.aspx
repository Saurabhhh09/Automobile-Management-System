<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="BookCar.aspx.cs" Inherits="KIA.User.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row mt-5 pt-5">
        <div class="col-lg-8 col-md-10 col-sm-12 col-12 mt-3 mx-auto" style="background-color: #eff1f2">
            <center>
                <h1>Personal Details</h1>
            </center>
            <div class="form">

                <div class="row">
                    <div class="col-lg-10 col-md-10  col-sm-12">
                        <label>Name:</label>
                        <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Enter Name"></asp:TextBox>

                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-10 col-md-7 col-sm-12">
                        <label>Address:</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address" TextMode="MultiLine"></asp:TextBox>

                    </div>

                </div>

                <div class="row">
                    <div class="col-lg-4 col-md-5 col-sm-12">
                        <label>Pin Code:</label>
                        <asp:TextBox ID="txtPinCode" runat="server" CssClass="form-control" placeholder="Enter Pin Code"></asp:TextBox>

                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-lg-10 col-sm-10">
                        <label>Contact No.</label>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" placeholder="Enter Contact No."></asp:TextBox>
                    </div>

                </div>


             
                <center>
                    <h1>Car Detail</h1>
                </center>
                <div class="form">

                    <div class="row">
                        <div class="col-lg-10 col-md-12  col-sm-12">
                            <label>Car Name:</label>
                            <asp:TextBox runat="server" ID="txtCar" CssClass="form-control" ReadOnly="true"></asp:TextBox>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-10 col-md-12 col-sm-12">
                            <label>Price:</label>
                            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>

                        </div>

                    </div>

                    <div class="row">
                        <div class="col-lg-10 col-md-12 col-sm-12">
                            <label>Total Amount:(28% GST include)</label>
                            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>

                        </div>
                    </div>

                    <div class="row">


                        <div class="col-lg-10 col-sm-10">
                            <label>Delivery Date:</label>
                            <asp:TextBox ID="txtDeliveryDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row my-3">
                        <divv class="col-lg-12">
                            <asp:Button ID="btnConfirm" runat="server" Text="Booking Confirm" CssClass="btn btn-dark" OnClick="btnConfirm_Click"/>
                        </divv>
                    </div>

                </div>

            </div>
        </div>

    </div>

 

</asp:Content>
