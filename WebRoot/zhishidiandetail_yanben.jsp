<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html lang="zh-CN">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
    <title>֪ʶ��</title>
    <link href="qtimages/lib/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="qtimages/css/index.css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<script language=javascript src='js/popup.js'></script>
<script language=javascript> 
function hsgpinglun(nbiao,nid){ 
popheight=450;
pop('hsgpinglun.jsp?biao='+nbiao+'&id='+nid,'��������',550,250) ;
}
</script> 
<%

	String id=request.getParameter("id");
	HashMap mqt = new CommDAO().getmap(id,"zhishidian");
	
	if(request.getParameter("dztp")!=null)
	{
		String sqldz="";
		if(request.getParameter("dztp").equals("d"))
		{
			sqldz="update zhishidian set dianzan_d=dianzan_d+1 where id="+id;
		}
		if(request.getParameter("dztp").equals("c"))
		{
			sqldz="update zhishidian set dianzan_c=dianzan_c+1 where id="+id;
		}
		 new CommDAO().commOper(sqldz); 
	}
     %>
<body>
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
    <section id="introduce">
        <div class="container">
			<div class="head text-center">
                    <h3>֪ʶ��</h3>
            </div>
          
		  
   <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
      <tr>
		 <td width='11%' height='50px;'>��ţ�</td><td width='39%' height='50px;'><%=mqt.get("bianhao")%></td>
                                <td colspan="4"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse" class="newsline">
                                  <tr>
                                    <td width="30" align="center" bgcolor="CCFFFF">���</td>
                                    <td width="471" bgcolor='#CCFFFF'>��������</td>
                                    <td width="88" bgcolor='#CCFFFF'>����</td>
                                    <td width="88" bgcolor='#CCFFFF'>������</td>
                                    <td width="138" align="center" bgcolor="CCFFFF">����ʱ��</td>
                                  </tr>
                                  <% 
							String sql =  "select * from pinglun where xinwenID='"+id+"' and biao='zhishidian' ";
							sql+=" order by id desc";
							int i=0;
							 for(HashMap map:new CommDAO().select(sql)){
							 i++;
							 %>
                                  <tr>
                                    <td width="30" align="center" bgcolor='#CCFF99'><%=i%></td>
                                    <td width="471" bgcolor='#CCFF99'><%=map.get("pinglunneirong")%></td>
                                    <td width="88" bgcolor='#CCFF99'><%=map.get("pingfen")%></td>
                                    <td width="88" bgcolor='#CCFF99'><%=map.get("pinglunren")%></td>
                                    <td width="138" align="center" bgcolor="CCFF99"><%=map.get("addtime")%></td>
                                  </tr>
                                  <%
								  }
								   %>
                                </table></td>
                                </tr><tr><td colspan=4 align=center height='50px;'><input type=button name=Submit5 value=���� class='hsgqiehuanshitu' onClick="javascript:history.back()" />
    
  </table>	
						  
        </div>
    </section>
	<%@ include file="qtdown.jsp"%>
<%@ include file="qtuserlog.jsp"%>
    <script src="qtimages/lib/jquery/jquery.min.js"></script>
    <script src="qtimages/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="qtimages/js/index.js"></script>

</body> 
</html>

<!--yoxudixtu-->