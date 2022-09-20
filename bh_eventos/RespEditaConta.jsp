<%@page import="model.Cliente"%>
<%@page import="dao.ClienteDao"%>
<% 
	Cliente cliente = new Cliente();
	cliente.setNome(request.getParameter("nome"));
	cliente.setCpf(request.getParameter("cpf"));
	cliente.setEmail(request.getParameter("email"));
	cliente.setContato(request.getParameter("contato"));
	cliente.setSenha(request.getParameter("senha"));
	cliente.setFormaPagamento(request.getParameter("forma_de_agamento"));
	try{
		ClienteDao dao  = new ClienteDao();
		dao.UpdateCliente(cliente);
	}catch(Exception e){
		out.print(e);
	}
	response.sendRedirect("index.html");
%>