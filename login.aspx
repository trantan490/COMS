﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" Title="로그인이 필요합니다." %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <table width="100%">
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="width: 670px">
                <table style="width: 100%">
                    <tr>
                        <td class="contents_title" colspan="1">
                        </td>
                        <td colspan="2" class="contents_title">
                            Yêu cầu đăng nhập. (로그인이 필요합니다.)</td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td style="width: 150px">
                           ID (사번)</td>
                        <td>
                            <asp:TextBox ID="txtUpnid" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUpnid" Display="Dynamic"
                                ErrorMessage="Hãy nhập chính xác ID (사번을 정확히 입력하여 주십시요)">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td style="width: 150px">
                            Mật khẩu (비밀번호)</td>
                        <td>
                            <asp:TextBox ID="txtUpnpw" runat="server"  TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUpnpw" Display="Dynamic"
                                ErrorMessage="Hãy nhập chính xác mật khẩu (비밀번호를 입력하여 주십시요)">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="1">
                        </td>
                        <td colspan="1" style="width: 150px">
                            Lưu đăng nhập 
                            <br />
                            (아이디 기억)</td>
                        <td align="left">
                            <asp:CheckBox ID="chkPersistCookie" runat="server" /></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="1">
                        </td>
                        <td align="center" colspan="2">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="DarkBlue" />
                            <br />
                            <asp:Button ID="submit" runat="server" CssClass="button" OnClick="submit_Click" Text="Đăng nhập (로그인)" /></td>
                    </tr>
                </table>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

