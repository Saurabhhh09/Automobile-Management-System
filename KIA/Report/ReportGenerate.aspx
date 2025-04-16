<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportGenerate.aspx.cs" Inherits="KIA.Report.ReportGenerate" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Report" OnClick="Button1_Click"/>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" InternalBorderStyle="Solid" InternalBorderColor="204, 204, 204" InternalBorderWidth="1px" ToolBarItemBorderStyle="Solid" ToolbarDividerColor="" ToolBarItemBorderColor="" ToolBarItemBorderWidth="1px" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderWidth="1px" ToolbarHoverBackgroundColor="" ToolBarItemHoverBackColor="" HighlightBackgroundColor="" ToolBarItemPressedHoverBackColor="153, 187, 226" SplitterBackColor="" ToolbarForegroundDisabledColor="" LinkDisabledColor="" ToolbarForegroundColor="" LinkActiveColor="" ToolbarHoverForegroundColor="" LinkActiveHoverColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" ClientIDMode="AutoID">
                <LocalReport ReportPath="C:\\Users\\Saurabh\\source\\repos\\KIA Automobile Management System\\KIA\\Report\\report.rdlc"></LocalReport>
            </rsweb:ReportViewer>
        </div>
    </form>
</body>
</html>
