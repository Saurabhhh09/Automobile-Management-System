<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="CarList.aspx.cs" Inherits="KIA.Admin.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-5 pt-5">
        <div class="row">
            <h1 class="text-center">Car List</h1>
            <div class="col-lg-12 table-responsive">
                <asp:GridView ID="CarListGridView" runat="server" CssClass="table table-bordered table-hover table-striped table-sm" AllowPaging="true" PageSize="6" OnPageIndexChanging="CarListGridView_PageIndexChanging" AutoGenerateColumns="false" OnRowDataBound="CarListGridView_RowDataBound">
                    <Columns>
                        <asp:BoundField HeaderText="Name" DataField="Name" HeaderStyle-CssClass="bg-dark text-white text-center" ItemStyle-CssClass="text-center" />
                        <asp:TemplateField HeaderText="Car Type" HeaderStyle-CssClass="bg-dark text-white text-center">
                            <ItemTemplate>
                                    <asp:GridView ID="CarTypeGridView" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered" ShowHeader="false">
                                        <Columns>
                                            <asp:BoundField DataField="Name"  ItemStyle-CssClass="text-center" ControlStyle-BorderStyle="None"/>
                                        </Columns>
                                    </asp:GridView>
                           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Fuel Type" DataField="FuelType" HeaderStyle-CssClass="bg-dark text-white text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField HeaderText="Seating Capacity" DataField="SeatingCapacity" HeaderStyle-CssClass="bg-dark text-white text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField HeaderText="Description" DataField="Description" HeaderStyle-CssClass="bg-dark text-white text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField HeaderText="Fuel Efficiency" DataField="FuelEfficiency" HeaderStyle-CssClass="bg-dark text-white text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField HeaderText="Manufacture Year" DataField="ReleaseYear" HeaderStyle-CssClass="bg-dark text-white text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField HeaderText="Colour" DataField="Colour" HeaderStyle-CssClass="bg-dark text-white text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField HeaderText="Top Speed" DataField="TopSpeed" HeaderStyle-CssClass="bg-dark  text-white text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField HeaderText="Engine Type" DataField="EngineType" HeaderStyle-CssClass="bg-dark text-white text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField HeaderText="Created At" DataField="CreatedAt" HeaderStyle-CssClass="bg-dark text-white text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField HeaderText="UpdatedAt" DataField="UpdatedAt" HeaderStyle-CssClass="bg-dark text-white text-center" ItemStyle-CssClass="text-center" />

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
