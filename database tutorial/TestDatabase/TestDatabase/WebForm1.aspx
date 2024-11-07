<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TestDatabase.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 525px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="student_id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="student_id" HeaderText="student_id" ReadOnly="True" SortExpression="student_id" />
                    <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
                    <asp:BoundField DataField="middle_name" HeaderText="middle_name" SortExpression="middle_name" />
                    <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
                    <asp:BoundField DataField="suffix" HeaderText="suffix" SortExpression="suffix" />
                    <asp:BoundField DataField="date_created" HeaderText="date_created" SortExpression="date_created" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:classdbConnectionString1 %>" DeleteCommand="DELETE FROM [student] WHERE [student_id] = @student_id" InsertCommand="INSERT INTO [student] ([student_id], [first_name], [middle_name], [last_name], [suffix], [date_created]) VALUES (@student_id, @first_name, @middle_name, @last_name, @suffix, @date_created)" SelectCommand="SELECT [student_id], [first_name], [middle_name], [last_name], [suffix], [date_created] FROM [student]" UpdateCommand="UPDATE [student] SET [first_name] = @first_name, [middle_name] = @middle_name, [last_name] = @last_name, [suffix] = @suffix, [date_created] = @date_created WHERE [student_id] = @student_id">
                <DeleteParameters>
                    <asp:Parameter Name="student_id" Type="Object" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="student_id" Type="Object" />
                    <asp:Parameter Name="first_name" Type="String" />
                    <asp:Parameter Name="middle_name" Type="String" />
                    <asp:Parameter Name="last_name" Type="String" />
                    <asp:Parameter Name="suffix" Type="String" />
                    <asp:Parameter DbType="DateTimeOffset" Name="date_created" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="first_name" Type="String" />
                    <asp:Parameter Name="middle_name" Type="String" />
                    <asp:Parameter Name="last_name" Type="String" />
                    <asp:Parameter Name="suffix" Type="String" />
                    <asp:Parameter DbType="DateTimeOffset" Name="date_created" />
                    <asp:Parameter Name="student_id" Type="Object" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
