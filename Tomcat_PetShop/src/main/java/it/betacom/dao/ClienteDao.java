package it.betacom.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import it.betacom.bean.Cliente;

public class ClienteDao {
	
	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop","root","qwerty");
		}catch(Exception e){System.out.println(e);}
		return con;
	}
	
	public static List<Cliente> getAllRecords(){
		List<Cliente> list=new ArrayList<Cliente>();
		
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select * from clienti");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Cliente c=new Cliente();
				c.setId(rs.getInt("idCliente"));
				c.setNome(rs.getString("nome"));
				c.setCognome(rs.getString("cognome"));
				c.setIndirizzo(rs.getString("indirizzo"));
				c.setCitta(rs.getString("citta"));
				c.setTelefono(rs.getString("telefono"));
				list.add(c);
			}
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	

	public static Cliente getRecordById(int id) {
	    Cliente c = null;
	    try {
	        Connection con = getConnection();
	        PreparedStatement ps = con.prepareStatement("SELECT * FROM clienti WHERE idCliente = ?");
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            c = new Cliente();
	            c.setId(rs.getInt("idCliente"));
	            c.setNome(rs.getString("nome"));
	            c.setCognome(rs.getString("cognome"));
	            c.setIndirizzo(rs.getString("indirizzo"));
	            c.setCitta(rs.getString("citta"));
	            c.setTelefono(rs.getString("telefono"));
	        }

	        // Chiudi la connessione e il ResultSet
	        rs.close();
	        ps.close();
	        con.close();

	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    return c;
	}

	
}
