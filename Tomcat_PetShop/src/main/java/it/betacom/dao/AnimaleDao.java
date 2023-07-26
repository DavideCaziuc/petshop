package it.betacom.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import it.betacom.bean.Animale;


public class AnimaleDao {

	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop","root","qwerty");
		}catch(Exception e){System.out.println(e);}
		return con;
	}
	
	public static List<Animale> getAllRecords(){
		List<Animale> list=new ArrayList<Animale>();
		
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select * from animali");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Animale a=new Animale();
				a.setId(rs.getInt("idAnimale"));
				a.setMatricola(rs.getInt("matricola"));
				a.setNome_animale(rs.getString("nomeAnimale"));
				a.setData_acquisto(rs.getString("dataAcquisto"));
				a.setPrezzo(rs.getDouble("prezzo"));
				a.setTipo_animale(rs.getString("tipoAnimale"));
				a.setIdCliente(rs.getInt("IDCLIENTE"));
				list.add(a);
			}
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	
	public static List<Animale> getAnimaliByClientId(int idCliente) {
	    List<Animale> list = new ArrayList<Animale>();

	    try {
	        Connection con = getConnection();
	        PreparedStatement ps = con.prepareStatement("SELECT * FROM animali WHERE IDCLIENTE = ?");
	        ps.setInt(1, idCliente); // Set the value for the parameter in the query
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Animale a = new Animale();
	            a.setId(rs.getInt("idAnimale"));
	            a.setMatricola(rs.getInt("matricola"));
	            a.setNome_animale(rs.getString("nomeAnimale"));
	            a.setData_acquisto(rs.getString("dataAcquisto"));
	            a.setPrezzo(rs.getDouble("prezzo"));
	            a.setTipo_animale(rs.getString("tipoAnimale"));
	            a.setIdCliente(rs.getInt("IDCLIENTE"));
	            list.add(a);
	        }
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    return list;
	}

	
}
