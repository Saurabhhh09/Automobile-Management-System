<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="KIA.Admin.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-5 p-5">
        <div class="row py-5">
            <div class="col-12 col-sm-12 col-md-5 col-lg-5 border-end border-dark">
                <h1 class="text-center">Your Profile</h1>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-person-workspace text-primary" viewBox="0 0 16 16">
                                                <path d="M4 16s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-5.95a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5" />
                                                <path d="M2 1a2 2 0 0 0-2 2v9.5A1.5 1.5 0 0 0 1.5 14h.653a5.4 5.4 0 0 1 1.066-2H1V3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v9h-2.219c.554.654.89 1.373 1.066 2h.653a1.5 1.5 0 0 0 1.5-1.5V3a2 2 0 0 0-2-2z" />
                                            </svg>
                                        </center>
                                        <center class="mt-2">
                                            Account Status : <span class="btn btn-success rounded-pill">
                                                <asp:Label ID="lblStatus" Text="" runat="server"></asp:Label></span></center>
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col">
                                        <label><strong>Name:</strong></label>
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label><strong>Email:</strong></label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <label><strong>Password:</strong></label>
                                        <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <label><strong>Contact No:</strong></label>
                                        <asp:TextBox ID="txtCont" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <hr class="border-bottom border-dark" />
                                <div class="row">
                                    <center>
                                        <h4>Chagne Password</h4>
                                    </center>
                                    <asp:TextBox ID="ChangePass" runat="server" CssClass="form-control" placeholder="Change Password"></asp:TextBox>
                                </div>

                                <center>
                                    <asp:Button ID="btn" runat="server" Text="Update" CssClass="btn btn-primary my-2" OnClick="btn_Click" />
                                </center>
                            </div>
                        </div>
                        
                    </div>

                </div>
            </div>


            <div class="col-sm-12 col-md-7 col-lg-7 col-12">

                <div class="row">
                    <div class="col-12">
                        <h1 class="my-4 text-center">Welcome To <span style="color: blue;">Admin</span> Dashboard</h1>
                    </div>
                </div>

                <!-- Overview Cards -->
                <div class="row text-center mb-4">
                    <div class="col-md-4">
                        <div class="card bg-primary text-white">
                            <div class="card-body">
                                <h5>Total Vehicles</h5>
                                <asp:Label ID="lblVehicles" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card bg-primary text-white">
                            <div class="card-body">
                                <h5>Total Users</h5>
                                <asp:Label ID="lblUsers" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card bg-primary text-white">
                            <div class="card-body">
                                <h5>Total Sales</h5>
                                <asp:Label ID="lblOrders" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Management Sections -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card mb-4">
                            <div class="card-header bg-dark text-white">
                                <h5>Show Rooms</h5>
                            </div>
                            <div class="card-body">
                                <p>View, add, or update Show Rooms.</p>
                                <a href="ShowRoomDetails.aspx" class="btn btn-secondary">View</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card mb-4">
                            <div class="card-header bg-dark text-white">
                                <h5>Car Type</h5>
                            </div>
                            <div class="card-body">
                                <p>Add New Type of Car.</p>
                                <a href="AddCarType.aspx" class="btn btn-secondary">Add</a>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-6">
                        <div class="card mb-4">
                            <div class="card-header bg-dark text-white">
                                <h5>Car's List</h5>
                            </div>
                            <div class="card-body">
                                <p>View Car's Detail.</p>
                                <a href="CarList.aspx" class="btn btn-secondary">View</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card mb-4">
                            <div class="card-header bg-dark text-white">
                                <h5>Test Drive</h5>
                            </div>
                            <div class="card-body">
                                <p>View and Approve Test Drive.</p>
                                <a href="TestDriveDetails.aspx" class="btn btn-secondary">View Apply</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card mb-4">
                            <div class="card-header bg-dark text-white">
                                <h5>Carousel</h5>
                            </div>
                            <div class="card-body">
                                <p>Add Video in Carousel to change home page UI.</p>
                                <a href="AddCarouselPage.aspx" class="btn btn-secondary">Add</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
