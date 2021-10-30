<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Browser_Calculator.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
        <div><center>
            <table border="1">
                <tr>
                    <td style="text-align:center" ><asp:Label ID="lonoff" runat="server" Text="off" ForeColor="Red" ToolTip="show status of All Results"></asp:Label></td>
                    <td style="text-align:center"><h4>Browser Calculator</h4></td>

                </tr>

                <tr>
                   
                    <td style="text-align:center"></td>
                    <td style="text-align:center"><asp:TextBox ID="txtop1" runat="server" BorderStyle="Solid"></asp:TextBox></td>
                    <asp:RequiredFieldValidator ID="rfdop1" runat="server" ControlToValidate="txtop1" ErrorMessage="Please enter 1st operand" ValidationGroup="pop" Display="None"></asp:RequiredFieldValidator>

                </tr>

                 <tr>
                    
                    <td style="text-align:center"><asp:Label ID="label1" runat="server" Text=""></asp:Label></td>
                    <td style="text-align:center"><asp:TextBox ID="txtop2" runat="server" BorderStyle="Solid"></asp:TextBox></td>
                    <asp:RequiredFieldValidator ID="rfdop2" runat="server" ControlToValidate="txtop2" ErrorMessage="Please enter 2nd operand" ValidationGroup="pop" Display="None"></asp:RequiredFieldValidator>
                </tr>

                 <tr>
                    
                    <td style="text-align:center"><asp:Label ID="labelequal" runat="server" Text="=" Width="50px"></asp:Label></td>
                    <td style="text-align:center"><asp:TextBox ID="txtresult" runat="server" BorderStyle="Solid"></asp:TextBox></td>

                </tr>

            </table>
            <table border="1">
                <tr>
                    
                    <td style="text-align:center"><asp:Button ID="btndivide" runat="server" Text="/" Width="50px" OnClick="btndivide_Click" ValidationGroup="pop"/></td>
                    <td style="text-align:center"><asp:Button ID="btnplus" runat="server" Text="+" Width="50px" OnClick="btnplus_Click" ValidationGroup="pop"/></td>
                </tr>
                <tr>
                    <td style="text-align:center"><asp:Button ID="btnmultiply" runat="server" Text="*" Width="50px" OnClick="btnmultiply_Click" ValidationGroup="pop"/></td>
                    <td style="text-align:center"><asp:Button ID="btnminus" runat="server" Text="-" Width="50px" OnClick="btnminus_Click" ValidationGroup="pop"/></td>
                </tr>
                <tr>
                    
                    <td style="text-align:center"><asp:Button ID="btnfetch" runat="server" Text="All Results" ForeColor="Blue" Width="80px" OnClick="btnfetch_Click"/></td>
                    <td style="text-align:center"><asp:Button ID="btnclr" runat="server" Text="CLR" ForeColor="Blue" OnClick="btnclr_Click" Width="50px"/></td>
                </tr>
                </table>
                <table>
                <tr>
                    <td></td>
                    <td><asp:GridView ID="gv" runat="server" AutoGenerateColumns="false" OnRowCommand="gv_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Operand">
                                <ItemTemplate>
                                    <%#Eval("operand1") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                        <Columns>
                            <asp:TemplateField HeaderText="Operation">
                                <ItemTemplate>
                                    <%#Eval("operation") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                        <Columns>
                            <asp:TemplateField HeaderText="Operand">
                                <ItemTemplate>
                                    <%#Eval("operand2") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                        <Columns>
                            <asp:TemplateField HeaderText="Results">
                                <ItemTemplate>
                                    <%#Eval("result") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                        <Columns>
                            <asp:TemplateField HeaderText="Results">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtndelete" runat="server" Text="Delete" CommandName="_delete_" CommandArgument='<%#Eval("id") %>'></asp:LinkButton> 
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                        <Columns>
                            <asp:TemplateField HeaderText="Results">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnredo" runat="server" Text="Redo" CommandName="_redo_" CommandArgument='<%#Eval("id") %>'></asp:LinkButton> 
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                        </asp:GridView></td>
                </tr>
                    <asp:ValidationSummary ID="vs" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="pop" />
            </table>
            
             </center>
        </div>
    </form>
</body>
</html>
