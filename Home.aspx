<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 399px;
        }
        .auto-style4 {
            width: 403px;
            height: 318px;
        }
        .auto-style5 {
            width: 819px;
        }
        .auto-style6 {
            width: 819px;
            font-size: x-large;
        }
        .auto-style7 {
            width: 100%;
        }
        .auto-style9 {
            width: 819px;
            height: 137px;
        }
        .auto-style10 {
            width: 207px;
        }
        .auto-style11 {
            height: 26px;
        }
        .auto-style12 {
            height: 25px;
        }
        .auto-style13 {
            width: 191px;
        }
        .auto-style14 {
            height: 26px;
            width: 191px;
        }
        .auto-style15 {
            width: 135px;
        }
        .auto-style16 {
            height: 26px;
            width: 135px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style2">
                        <img alt="" class="auto-style4" src="Images/Lionheart%20marketing%20logo.png" /></td>
                    <td class="auto-style10">
                        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                        <asp:Button ID="Button3" runat="server" Text="Search" Height="21px" OnClick="Button3_Click" />
                        <asp:Button ID="Button4" runat="server" Height="23px" OnClick="Button4_Click" Text="Reset Search" />
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Log Out" OnClick="Button2_Click" Height="22px" />
                    </td>
                    <td>
                        <asp:Label ID="lblLoggedIn" runat="server" Text="Logged in -" BorderStyle="Solid"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <p>
            <asp:Label ID="lblCookie" runat="server" Text="Label"></asp:Label>
        </p>
        <table class="auto-style7">
            <tr>
                <td class="auto-style6">
                    <h2>My photos</h2>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Photo_Id" DataSourceID="SqlDataSource3" Visible="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Tag" HeaderText="Tag" SortExpression="Tag" />
                            <asp:BoundField DataField="Captured_By" HeaderText="Captured_By" SortExpression="Captured_By" />
                            <asp:BoundField DataField="Captured_Date" HeaderText="Captured_Date" SortExpression="Captured_Date" />
                            <asp:BoundField DataField="Geo_Location" HeaderText="Geo_Location" SortExpression="Geo_Location" />
                            <asp:BoundField DataField="Photo_Id" HeaderText="Photo_Id" InsertVisible="False" ReadOnly="True" SortExpression="Photo_Id" />
                            <asp:TemplateField HeaderText="Image" SortExpression="Image">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Image") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image3" runat="server" Height="220px" ImageUrl='<%# Eval("Image") %>' Width="300px" />
                                    <asp:LinkButton ID="LinkButton4" CommandArgument ='<%# Eval("Image") %>' runat="server" OnClick ="DownloadFile">Download</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Photo_Id], [Geo_Location], [Captured_Date], [Captured_By], [Tag], [Image] FROM [Photo_Data] WHERE (([Username] = @Username) AND ([Geo_Location] LIKE '%' + @Geo_Location + '%'))" DeleteCommand="DELETE FROM [Photo_Data] WHERE [Photo_Id] = @Photo_Id" InsertCommand="INSERT INTO [Photo_Data] ([Geo_Location], [Captured_Date], [Captured_By], [Tag], [Image]) VALUES (@Geo_Location, @Captured_Date, @Captured_By, @Tag, @Image)" UpdateCommand="UPDATE [Photo_Data] SET [Geo_Location] = @Geo_Location, [Captured_Date] = @Captured_Date, [Captured_By] = @Captured_By, [Tag] = @Tag, [Image] = @Image WHERE [Photo_Id] = @Photo_Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Photo_Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Geo_Location" Type="String" />
                            <asp:Parameter DbType="Date" Name="Captured_Date" />
                            <asp:Parameter Name="Captured_By" Type="String" />
                            <asp:Parameter Name="Tag" Type="String" />
                            <asp:Parameter Name="Image" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblCookie" Name="Username" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtSearch" Name="Geo_Location" PropertyName="Text" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Geo_Location" Type="String" />
                            <asp:Parameter DbType="Date" Name="Captured_Date" />
                            <asp:Parameter Name="Captured_By" Type="String" />
                            <asp:Parameter Name="Tag" Type="String" />
                            <asp:Parameter Name="Image" Type="String" />
                            <asp:Parameter Name="Photo_Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="Photo_Id" DataSourceID="SqlDataSource1">
                       
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Photo_Id" HeaderText="Photo_Id" InsertVisible="False" ReadOnly="True" SortExpression="Photo_Id" />
                            <asp:BoundField DataField="Geo_Location" HeaderText="Geo_Location" SortExpression="Geo_Location" />
                            <asp:BoundField DataField="Captured_Date" HeaderText="Captured_Date" SortExpression="Captured_Date" />
                            <asp:BoundField DataField="Captured_By" HeaderText="Captured_By" SortExpression="Captured_By" />
                            <asp:BoundField DataField="Tag" HeaderText="Tag" SortExpression="Tag" />
                            <asp:TemplateField HeaderText="Image" SortExpression="Image">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Image") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("Image") %>' Height="220px" Width="300px" />
                                    <asp:LinkButton ID="LinkButton3" CommandArgument ='<%# Eval("Image") %>' runat="server" OnClick ="DownloadFile">Download</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <EmptyDataTemplate>
                            <asp:Image ID="Image1" runat="server" Height="220px" ImageUrl='<%# Eval("Image") %>' Width="300px" />
                            <asp:LinkButton ID="LinkButton1" CommandArgument ='<%# Eval("Image") %>' runat="server" OnClick ="DownloadFile">Download</asp:LinkButton>
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Photo_Data] WHERE [Photo_Id] = @Photo_Id" InsertCommand="INSERT INTO [Photo_Data] ([Geo_Location], [Captured_Date], [Captured_By], [Tag], [Image]) VALUES (@Geo_Location, @Captured_Date, @Captured_By, @Tag, @Image)" SelectCommand="SELECT [Photo_Id], [Geo_Location], [Captured_Date], [Captured_By], [Tag], [Image] FROM [Photo_Data] WHERE ([Username] = @Username)" UpdateCommand="UPDATE [Photo_Data] SET [Geo_Location] = @Geo_Location, [Captured_Date] = @Captured_Date, [Captured_By] = @Captured_By, [Tag] = @Tag, [Image] = @Image WHERE [Photo_Id] = @Photo_Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Photo_Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Geo_Location" Type="String" />
                            <asp:Parameter DbType="Date" Name="Captured_Date" />
                            <asp:Parameter Name="Captured_By" Type="String" />
                            <asp:Parameter Name="Tag" Type="String" />
                            <asp:Parameter Name="Image" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblCookie" Name="Username" PropertyName="Text" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Geo_Location" Type="String" />
                            <asp:Parameter DbType="Date" Name="Captured_Date" />
                            <asp:Parameter Name="Captured_By" Type="String" />
                            <asp:Parameter Name="Tag" Type="String" />
                            <asp:Parameter Name="Image" Type="String" />
                            <asp:Parameter Name="Photo_Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Username] FROM [Authentication] WHERE ([Username] &lt;&gt; @Username)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblCookie" Name="Username" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style7">
            <tr>
                <td class="auto-style13"><strong>Upload photo:</strong></td>
                <td class="auto-style15">
                    <asp:FileUpload ID="fileUploadImage" runat="server" />
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    <strong>Share:</strong></td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style7">
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblGeo" runat="server" Text="Geolocation"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtGeo" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:Label ID="Label1" runat="server" Text="Photo_Id to share"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtPhotoId" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblCapDate" runat="server" Text="Captured_Date"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtCapDate" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:Label ID="Label2" runat="server" Text="Share with"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:DropDownList ID="ddlShare" runat="server" DataSourceID="SqlDataSource2" DataTextField="Username" DataValueField="Username">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">
                    <asp:Label ID="lblCapBy" runat="server" Text="Captured_By"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtCapBy" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style12">
                    &nbsp;</td>
                <td class="auto-style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTag" runat="server" Text="Tag"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTag" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnUpSave" runat="server" Height="21px" OnClick="btnUpSave_Click" Text="Save" Width="64px" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnShare" runat="server" OnClick="btnShare_Click" Text="Share" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="lblShareMessage" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
