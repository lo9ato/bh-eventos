<%@page import="dao.ClienteDao"%>
<% 
	ClienteDao dao = new ClienteDao();
	String email = request.getParameter("email");
	String senha = request.getParameter("senha");
	System.out.println(email);
	System.out.println(senha);
	dao.DeleteCliente(email, senha);
	response.sendRedirect("index.html");
%>