package it.betacom.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import it.betacom.bean.Utente;

public class UtenteDao {

	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop","root","qwerty");
		}catch(Exception e){System.out.println(e);}
		return con;
	}

	public static List<Utente> getAllRecords(){
		List<Utente> list=new ArrayList<Utente>();

		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select * from psutenti");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Utente u =new Utente();
				u.setId(rs.getInt("id"));
				u.setNome(rs.getString("nome"));
				u.setCognome(rs.getString("cognome"));
				u.setUsername(rs.getString("username"));
				u.setEmail(rs.getString("email"));
				u.setDatadinascita(rs.getString("datadinascita"));
				u.setCellulare(rs.getString("cellulare"));
				u.setPassword(rs.getString("password"));
				u.setRuolo(rs.getString("ruolo"));
				u.setStato(rs.getString("stato"));
				list.add(u);
			}
		}catch(Exception e){System.out.println(e);}
		return list;
	}
    public static boolean changeUserStatus(int userId, String newStatus) {
        boolean success = false;

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE psutenti SET stato = ? WHERE id = ?");
            ps.setString(1, newStatus);
            ps.setInt(2, userId);

            int righeAggiornate = ps.executeUpdate();
            success = righeAggiornate > 0;

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return success;
    }

    public static boolean updatePassword(int userId, String newPassword) {
        boolean success = false;

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE psutenti SET password = ? WHERE id = ?");
            ps.setString(1, newPassword);
            ps.setInt(2, userId);

            int righeAggiornate = ps.executeUpdate();
            success = righeAggiornate > 0;

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return success;
    }

    public static boolean updateEmail(int userId, String newEmail) {
        boolean success = false;

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE psutenti SET email = ? WHERE id = ?");
            ps.setString(1, newEmail);
            ps.setInt(2, userId);

            int righeAggiornate = ps.executeUpdate();
            success = righeAggiornate > 0;

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return success;
    }

    public static boolean updateCellulare(int userId, String newCellulare) {
        boolean success = false;

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE psutenti SET cellulare = ? WHERE id = ?");
            ps.setString(1, newCellulare);
            ps.setInt(2, userId);

            int righeAggiornate = ps.executeUpdate();
            success = righeAggiornate > 0;

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return success;
    }

}
