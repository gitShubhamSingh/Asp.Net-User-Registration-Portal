<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalenderUserControl.ascx.cs" Inherits="UserRegistration.UsrControl.CalenderUserControl" %>
<style>
    .pad{margin:10px;}
</style>
<asp:TextBox ID="tbDateOfBirth" runat="server"  Enabled="false" placeholder="Date Of Birth" style="border-top:0px;border-right:0px;border-left:0px;padding-bottom:10px;background:none;border-bottom:1px solid #000;"></asp:TextBox> 
 &nbsp;&nbsp;
<asp:LinkButton ID="btnSelectDate" runat="server" ValidationGroup="grp1" OnClick="btnSelectDate_Click"><i class="fa fa-calendar" style="color:#ff5733;font-size:25px;"></i></asp:LinkButton>
<asp:RequiredFieldValidator ID="rfvDateOfBirth" runat="server" ControlToValidate="tbDateOfBirth" ErrorMessage="<b>*</b>" ForeColor="Red" ValidationGroup="grpSignUp"></asp:RequiredFieldValidator> 
<br />
   <asp:Panel ID="panel1" runat="server">                     
        <asp:Label ID="lblYear" runat="server" Text="Year : "></asp:Label>
        <asp:DropDownList ID="ddlYear" runat="server" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" CssClass="pad" AutoPostBack="True"></asp:DropDownList>&nbsp;&nbsp;
        <asp:Label ID="lblMonth" runat="server" Text="Month : "></asp:Label>
        <asp:DropDownList ID="ddlMonth" runat="server" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged" CssClass="pad" AutoPostBack="True"></asp:DropDownList>
        <br />
        <asp:Calendar ID="cld1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="cld1_SelectionChanged" Width="220px">
            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
            <WeekendDayStyle BackColor="#CCCCFF" />
        </asp:Calendar>
    </asp:Panel>

          