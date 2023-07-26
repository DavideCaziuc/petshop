package it.betacom.bean;

public class Animale {
	
	private int id,matricola, idCliente;
	private double prezzo;
	private String nome_animale,data_acquisto,tipo_animale;
	
	public Animale() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public int getMatricola() {
		return matricola;
	}

	public void setMatricola(int matricola) {
		this.matricola = matricola;
	}

	public String getNome_animale() {
		return nome_animale;
	}

	public void setNome_animale(String nome_animale) {
		this.nome_animale = nome_animale;
	}

	public String getData_acquisto() {
		return data_acquisto;
	}

	public void setData_acquisto(String data_acquisto) {
		this.data_acquisto = data_acquisto;
	}

	public String getTipo_animale() {
		return tipo_animale;
	}

	public void setTipo_animale(String tipo_animale) {
		this.tipo_animale = tipo_animale;
	}
	
	
	
	


}
