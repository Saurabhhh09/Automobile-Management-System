<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="EditCarDetails.aspx.cs" Inherits="KIA.Admin.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid mt-5 pt-5">
        <div class="row" style="min-height: 60vh;">
            <div class="col-md-4 col-sm-12" style="background-color: #eff1f2;">
                <div class="container-fluid">
                    <h1 class="fw-bolder mt-5 mb-5 text-center">Search Car By Name</h1>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:TextBox ID="txtSearch" runat="server" placeholder="Search Car Name" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-5">
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-secondary w-100" OnClick="btnSearch_Click" />
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-md-8 col-sm-12">
                <h1 class="fw-bolder mt-5 mb-3 text-center">Edit Car Details</h1>
                <div class="mb-5">
                    <h5 class="text-center">
                        <asp:Label ID="lblMsg" runat="server" Text="" Visible="false"></asp:Label></h5>
                    <asp:DetailsView ID="dvCarDetails" runat="server"
                        AutoGenerateRows="false" DataKeyNames="Id" OnItemUpdating="dvCarDetails_ItemUpdating"  
                        OnItemCommand="dvCarDetails_ItemCommand" OnModeChanging="dvCarDetails_ModeChanging" OnItemDeleting="dvCarDetails_ItemDeleting">
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
                                            <div class="mb-3 d-flex justify-content-between">
                                                Name :
                                                <h6><%# Eval("Name") %></h6>
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
                                            <div class="mb-3 d-flex">
                                                <asp:LinkButton ID="Edit" runat="server" CommandName="Edit" CssClass="btn btn-secondary me-2">Edit</asp:LinkButton>
                                                <asp:LinkButton ID="Delete" runat="server" CssClass="btn btn-secondary" OnClientClick="return confirm('are you sure to delete Data.')" CommandName="Delete">Delete</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>


                                <EditItemTemplate>
                                    <div class="row mt-3 w-100">
                                        <div class="col-md-7 border-end border-dark">
                                            <div class="row">
                                                <div class="col-12">
                                                    <asp:Image runat="server" ID="UpdImg" ImageUrl='<%# "/UploadImage/" + Eval("ImgPath") %>' CssClass="img-fluid img-thumbnail"/>
                                                    <asp:FileUpload ID="UplImg" runat="server" />
                                                    <span class="text-danger">(Upload only jpeg/jpg/png format and size less than 1MB.)</span>
                                                </div>
                                                <div class="row pt-4 mx-2">
                                                    <div class="col-md-12">
                                                        <p class="text-center">Description :</p>
                                                        <asp:TextBox ID="txtDescription" runat="server"
                                                            Text='<%# Bind("Description") %>' CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 py-2 ms-5 text-center">
                                            <div class="mb-3 d-flex justify-content-between">
                                                Name :
                            
                                                <asp:TextBox ID="txtName" runat="server"
                                                    Text='<%# Bind("Name") %>' CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="mb-3 d-flex justify-content-between">
                                                Seating Capacity : 
                            
                                                <asp:TextBox ID="txtSeatingCapacity" runat="server"
                                                    Text='<%# Bind("SeatingCapacity") %>' CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="mb-3 d-flex justify-content-between">
                                                Fuel Type :  
                            
                                                <asp:TextBox ID="txtFuelType" runat="server"
                                                    Text='<%# Bind("FuelType") %>' CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="mb-3 d-flex justify-content-between">
                                                Fuel Efficiency : 
                            
                                                <asp:TextBox ID="txtFuelEfficiency" runat="server"
                                                    Text='<%# Bind("FuelEfficiency") %>' CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="mb-3 d-flex justify-content-between">
                                                Top Speed : 
                            
                                                <asp:TextBox ID="txtTopSpeed" runat="server"
                                                    Text='<%# Bind("TopSpeed") %>' CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="mb-3 d-flex justify-content-between">
                                                Engine : 
                            
                                                <asp:TextBox ID="txtEngineType" runat="server"
                                                    Text='<%# Bind("EngineType") %>' CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="mb-3 d-flex justify-content-between">
                                                Color : 
                            
                                                <asp:TextBox ID="txtColour" runat="server"
                                                    Text='<%# Bind("Colour") %>' CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="mb-3 d-flex justify-content-between">
                                                Release Year : 
                            
                                                <asp:TextBox ID="txtReleaseYear" runat="server"
                                                    Text='<%# Bind("ReleaseYear") %>' CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="mb-3 d-flex justify-content-between">
                                                Price : 
                            
                                                <asp:TextBox ID="txtPrice" runat="server"
                                                    Text='<%# Bind("Price") %>' CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="mb-3 d-flex">
                                                <asp:LinkButton ID="Update" runat="server" CommandName="Update" CssClass="btn btn-secondary me-2">Update</asp:LinkButton>
                                                <asp:LinkButton ID="Cancel" runat="server" CommandName="Cancel" CssClass="btn btn-secondary">Cancel</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </EditItemTemplate>
                            </asp:TemplateField>

                        </Fields>
                    </asp:DetailsView>

                </div>
            </div>
        </div>
    </div>


</asp:Content>
