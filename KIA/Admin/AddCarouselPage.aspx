<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddCarouselPage.aspx.cs" Inherits="KIA.Admin.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="" id="testDrive">
        <div class="container-fluid mt-5 pt-5">
            <div class="row">
                <div class="col-lg-5 col-md-12 col-sm-12 col-12" id="leftContact" style="background-color: #eff1f2;">
                    <div class="container text-center">
                        <h1 class="fw-bolder mt-5 display-1">Add Video</h1>
                        <p class="fw-semibold my-5 px-5">
                            Video for Edit Home Page.
                        </p>
                        <div class="mb-4">
                            <p class="fw-bold">Choose Car for Video.</p>
                            <asp:DropDownList ID="DpModel" runat="server" CssClass="p-3 px-5"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Choose Car Model." ControlToValidate="DpModel" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7 col-md-12 col-sm-12 col-12">
                    <div class="container mt-5">
                        <p class="mt-5 fw-medium">All fields are required.</p>
                        <hr class="border border-dark">
                        <h5 class="fw-bold mt-4 mb-4">Upload Video Here.</h5>
                        <div class="form">
                            <div class="row">

                                <div class="form-group mb-3 col-lg-12">
                                    <label for="txtDescription" class="form-label">Description:</label>
                                    <asp:TextBox ID="txtDescription" runat="server" class="form-control" placeholder="Description for Video"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Description." ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtDescription"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group mb-3 col-lg-12">
                                    <label for="txtTitle" class="form-label">Title:</label>
                                    <asp:TextBox ID="txtTitle" runat="server" class="form-control" placeholder="Title for Video"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Title." ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group mb-3 col-lg-12">
                                    <label for="UplVideo" class="form-label">Upload Video:</label>
                                    <asp:FileUpload ID="UplVideo" runat="server" CssClass="form-group"/>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Upload Video." ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="UplVideo"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-lg-6 mb-5">
                                    <asp:Button ID="btnAddVdo" runat="server" Text="Add" CssClass="btn btn-secondary w-100" OnClick="btnAddVdo_Click"/>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
