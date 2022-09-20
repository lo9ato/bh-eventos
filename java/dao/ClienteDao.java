package dao;
import util.Conexao;
import model.Cliente;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ClienteDao {
	public boolean InsereCliente(Cliente cliente) {
        Conexao con = null;
        try {
            con = new Conexao();
            con.executeUpdate("INSERT INTO tb_clientes (nome, cpf, email, contato, senha, forma_pagamento) \n"
            		        + "VALUES('"+cliente.getNome()+"', '"+cliente.getCpf()+"', '"+cliente.getEmail()+"',"
            		        + " '"+cliente.getContato()+"', '"+cliente.getSenha()+"', '"+cliente.getFormaPagamento()+"');");
            return true;
        } catch (SQLException e) {
            System.out.println("deu errado inserirClientes()");
            return false;
        }
	}
	public Cliente ListarCliente(String email, String senha) {
        Conexao con = null;
        try {
            con = new Conexao();
            ResultSet rs = con.executeQuery("SELECT * FROM tb_clientes \n "
            		+ "WHERE email = '"+email+"' and senha =  '"+senha+"'");
            rs.next();     
            Cliente cliente = new Cliente();
            cliente.setIdCliente(rs.getString("id_cliente"));
            cliente.setNome(rs.getString("nome"));
            cliente.setCpf(rs.getString("cpf"));   
            cliente.setEmail(rs.getString("email"));
            cliente.setContato(rs.getString("contato"));
            cliente.setFormaPagamento("forma_pagamento");
            return cliente;
        }catch (SQLException e) {
            return null;
        }
	}
    public boolean DeleteCliente(String email, String senha) {
        Conexao con = null;
        try {
            con = new Conexao();
            con.executeUpdate("DELETE FROM tb_clientes WHERE email = '"+email+"' and senha= '"+senha+"'");
            return true;
        } catch (SQLException e) {
            return false;
        }
    }
    private int ReturnId(String email,String senha) {
        Conexao con = null;
        try {
            con = new Conexao();
            ResultSet rs = con.executeQuery("select id_cliente FROM tb_clientes WHERE email = '"+email+"' and senha= '"+senha+"'");
            rs.next();
            Integer id = rs.getInt("id_cliente");
            return id;
        } catch (SQLException e) {
            return -1;
        }
    }
    public boolean UpdateCliente(Cliente cliente) {
    	 Integer id = this.ReturnId(cliente.getEmail(), cliente.getSenha());
    	 Conexao con = null;
         try {
             con = new Conexao();
             con.executeUpdate("UPDATE tb_clientes SET "
             		+ "nome='"+cliente.getNome()+"', cpf='"+cliente.getCpf()+"',"
             		+ " email='"+cliente.getEmail()+"', contato='"+cliente.getContato()+"',"
             		+ " senha='"+cliente.getSenha()+"', forma_pagamento='"+cliente.getFormaPagamento()+"'"
             		+ " WHERE id_cliente="+id+";\n"
             		+ "");
             
             return true;
         } catch (SQLException e) {
             return false;
         }
    } 
}
