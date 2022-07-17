<%@ Control Language="VB" AutoEventWireup="false" CodeFile="statistical.ascx.vb"
    Inherits="usercontrol_statistical" %>
<div style="padding: 5px; border: 1px solid #ccc;margin-top:4px;margin-bottom:4px;">
    <table style="font-family: koodakAnd; font-size: 12px;">
        <tr>
            <td style="font-size: 15px;">
                آمار سایت
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_getAllDownloadApp" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_getAllVisitApp" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_getAllVisitWebsite" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_getAllCountApp" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_getAllCountGame" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_getAllCountProgram" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</div>
