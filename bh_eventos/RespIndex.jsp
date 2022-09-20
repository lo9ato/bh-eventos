<%@page import="model.Cliente"%>
<%@page import="dao.ClienteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String email = request.getParameter("email");
	String senha = request.getParameter("senha");
	System.out.print(senha);
	ClienteDao dao     = new ClienteDao();
	Cliente cliente = dao.ListarCliente(email, senha);
	System.out.print(cliente);
	if (cliente == null){
		System.out.print("passou por aqui");
		response.sendRedirect("index.html");
	}else{

%>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Configuracoes Do Cliente</title>
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <body>
    <main>
      <div class="box">
        <div class="inner-box">
          <div class="forms-wrap">
            <form action="RespDeletaConta.jsp" class="sign-in-form">
              <div class="logo">
                <h4>BH eventos</h4>
              </div>

              <div class="heading">
                <h2>Deseja deletar seua conta?</h2>
                <h6>Deseja apenas editar?</h6>
                <a href="#" class="toggle">Edite sua conta</a>
              </div>

              <div class="actual-form">
                <div class="input-wrap">
                  <input type="text"  name = "email" value = "<%=cliente.getEmail()%>" class="input-field" required/>
                  <label>Email</label>
                </div>

                <div class="input-wrap">
                  <input type="password" class="input-field"  name = 'senha' required />
                  <label>Senha</label>
                </div>

                <input type="submit" value="Deleta Conta" class="sign-btn" />

              </div>
            </form>

            <form action="RespEditaConta.jsp" class="sign-up-form">
              <div class="logo">
                <h4>BH eventos</h4>
              </div>

              <div class="heading">
                <h2>Edite sua conta</h2>
                <h6>Deseja deletar sua conta?</h6>
                <a href="#" class="toggle">click aqui</a>
              </div>

              <div class="actual-form">
                <div class="input-wrap">
                  <input type="text" value = "<%=cliente.getNome()%>" id = "nome" name = "nome" class="input-field" required/>
                  <label>Nome</label>
                </div>

                <div class='input-wrap'>
                    <input type='number' class='input-field'  id = 'cpf' name = 'cpf' placeholder=" apenas numeros" required />
                    <label>C.P.F</label>
                </div>
                  
                <div class='input-wrap'>
                    <input type="email" class='input-field' value = "<%=cliente.getEmail()%>" id = 'email' name = 'email' required />
                    <label>Email</label>
                </div>
                  
                <div class='input-wrap'>
                    <input type="number" class='input-field' value = "<%=cliente.getContato()%>" id = 'contato' name = 'contato' required />
                    <label>Contato</label>
                </div>
                  
               <div class='input-wrap'>
                    <input class='input-field' value = "<%=cliente.getFormaPagamento()%>" id = 'forma_de_pagamento' name = 'forma_de_pagamento' required />
                    <label>Forma De Pagamento</label>
                </div>
              
                <div class='input-wrap'>
                    <input type='password' class='input-field' id = 'senha' name = 'senha' required />
                    <label>Senha</label>
                </div>
              
                <input type="submit" value="Registre-se" class="sign-btn" />

              </div>
            </form>
          </div>

         <div class="carousel">

            <div class="text-slider">
              <div class="text-wrap">
                <div class="text-group">
                  <h2>Edite ou delete sua conta</h2>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <script src="app.js"></script>
  </body>
</html>
<%
}
%>