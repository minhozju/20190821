<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditPassword.aspx.cs" Inherits="StudbManage.EditPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">    

<html xmlns="http://www.w3.org/1999/xhtml" >    
<head runat="server">    
    <title>无标题页</title>    
    <style type="text/css">
        .auto-style1 {
            color: #FF0066;
        }
    </style>
</head>   
<script type="text/javascript"><!--

    //CharMode函数      
    //测试某个字符是属于哪一类.      
    function CharMode(iN){      
        if (iN>=48 && iN <=57) //数字      
        return 1;      
        if (iN>=65 && iN <=90) //大写字母      
        return 2;      
        if (iN>=97 && iN <=122) //小写      
        return 4;      
        else      
        return 8; //特殊字符      
    }      
    //bitTotal函数      
    //计算出当前密码当中一共有多少种模式      
    function bitTotal(num){      
        modes=0;      
        for (i=0;i<4;i++){      
        if (num & 1) modes++;      
        num>>>=1;      
        }      
        return modes;      
    }      
    //checkStrong函数      
    //返回密码的强度级别      

    function checkStrong(sPW){      
        if (sPW.length<=5)      
        return 0; //密码太短      
        Modes=0;      
        for (i=0;i<sPW.length;i++){      
        //测试每一个字符的类别并统计一共有多少种模式.      
        Modes|=CharMode(sPW.charCodeAt(i));      
        }      
        return bitTotal(Modes);      
    }      

    //pwStrength函数      
    //当用户放开键盘或密码输入框失去焦点时,根据不同的级别显示不同的颜色      
    function pwStrength(pwd){      
        O_color="#e0f0ff";      
        L_color="#FF0000";      
        M_color="#FF9900";      
        H_color = "#33CC00";
        document.getElementById("HiddenField1").value = checkStrong(pwd);
        if (pwd==null||pwd==''){      
            Lcolor=Mcolor=Hcolor=O_color;      
        }      
        else   
        {      
            S_level=checkStrong(pwd);      
            switch(S_level)     
            {      
                case 0:      
                Lcolor=Mcolor=Hcolor=O_color;      
                case 1:      
                Lcolor=L_color;      
                Mcolor=Hcolor=O_color;      
                break;      
                case 2:      
                Lcolor=Mcolor=M_color;      
                Hcolor=O_color;      
                break;      
                default:      
                Lcolor=Mcolor=Hcolor=H_color;      
            }      
        }      

        document.getElementById("strength_L").style.background=Lcolor;      
        document.getElementById("strength_M").style.background=Mcolor;      
        document.getElementById("strength_H").style.background=Hcolor;      
        return;      
    }      
</script> 
      <body>    
    <form id="form1" runat="server">   
        <div class="auto-style1"><strong style="color: #000066; font-size: large">修改您的密码</strong></div>
    <div>    
        输入密码:<asp:TextBox ID="txtPassword" runat="server" onKeyUp="pwStrength(this.value)" onBlur="pwStrength(this.value)" ></asp:TextBox><br />    
        密码强度:    
        <table border="1" cellpadding="1"  cellspacing="1" style="width: 200px; display: inline; background-color:#e0f0ff">    
            <tr>    
                <td id="strength_L" style="width: 100px; height: 19px;" align="center">    
                    弱</td>    
                <td id="strength_M" style="width: 100px; height: 19px;" align="center">    
                    中</td>    
                <td id="strength_H" style="width: 100px; height: 19px;" align="center">    
                    强</td>    
            </tr>    
        </table>    
    </div>
        <div>
            <asp:Button ID="btnOK" CssClass="Button" runat="server" Text="提交" BorderStyle="Groove" OnClick="btnOK_Click"></asp:Button>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnReturn" CssClass="Button" runat="server" Text="返回" BorderStyle="Groove" OnClick="btnReturn_Click"></asp:Button>
        </div>
        <div>
            
            <asp:HiddenField ID="HiddenField1" runat="server" />
            
        </div>
        <div><asp:Label ID="lblTooltip" runat="server" style="font-size: 12pt; color: red; font-family: 宋体;"></asp:Label>
        </div>
    </form>    
</body>    
    </html>