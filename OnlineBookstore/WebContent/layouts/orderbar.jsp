<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<% 
	String dowhat=(String)request.getAttribute("dowhat");//当前书籍搜索方式

	String key=(String)request.getAttribute("key");//当前搜索的关键字
	String type=(String)request.getAttribute("type");//当前搜索的类别
	String refer=(String)request.getAttribute("refer");//当前排序参照列
	int pageCount=(Integer)request.getAttribute("pageCount"); //分页数
	int pageNow=(Integer)request.getAttribute("pageNow"); //当前页数
	int pageFrom=(Integer)request.getAttribute("pageFrom"); //页码起始数
	int pageTo=(Integer)request.getAttribute("pageTo"); //页码终止数
%>

<div class="searchdiv1">
	
	<!-------- 显示排序条 -------->
	<%
		//判断当前选中的排序方式，设置高亮状态
		String[] orderRefers={"Bid","Bsalednum DESC","Bcommentnum DESC","Bprice","Bid DESC"};
		String[] orderNames={"默认排序↓","销量↓","评分↓","价格↓","新品↓"};
		
		for(int i=0;i<orderRefers.length;i++)
		{
			if(orderRefers[i].equals(refer))
			{
				%>
				<a href="SearchClServlet?dowhat=<%=dowhat%>&key=<%=key%>&type=<%=type%>&way=byPageFirst&refer=<%=refer%>&pageCount=<%=pageCount%>&pageNow=1&pageFrom=1&pageTo=1" class="aseleted"><%=orderNames[i]%></a>
				<%
			}
			else
			{
				%>
				<a href="SearchClServlet?dowhat=<%=dowhat%>&key=<%=key%>&type=<%=type%>&way=byPageFirst&refer=<%=orderRefers[i]%>&pageCount=<%=pageCount%>&pageNow=1&pageFrom=1&pageTo=1"><%=orderNames[i]%></a>
				<%	
			}
		}
	%>
	
	<!-------- 显示前后翻页块 -------->
	<%
		if(pageNow < pageCount)
		{
			%>
			<!-- 后一页 -->
			<a href="SearchClServlet?dowhat=<%=dowhat%>&key=<%=key%>&type=<%=type%>&way=byPageNext&refer=<%=refer%>&pageCount=<%=pageCount%>&pageNow=<%=pageNow%>&pageFrom=<%=pageFrom%>&pageTo=<%=pageTo%>">&gt;</a>
			<%
		}
	%>
	<span><%=pageNow %>/<%=pageCount %></span>
	<% 
		if(pageNow > 1)
		{	
			%>
			<!-- 前一页 -->
			<a href="SearchClServlet?dowhat=<%=dowhat%>&key=<%=key%>&type=<%=type%>&way=byPageLast&refer=<%=refer%>&pageCount=<%=pageCount%>&pageNow=<%=pageNow%>&pageFrom=<%=pageFrom%>&pageTo=<%=pageTo%>">&lt;</a> <!-- 前一页 -->
			<%
		}
	%>

</div>