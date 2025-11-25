package br.com.academia.model;

import java.sql.Date;

public class Aluno {

    private int id;
    private String nome;
    private String cpf;
    private String plano;
    private Date dataMatricula;

    public Aluno() {
    }

    public Aluno(int id, String nome, String cpf, String plano, Date dataMatricula) {
        this.id = id;
        this.nome = nome;
        this.cpf = cpf;
        this.plano = plano;
        this.dataMatricula = dataMatricula;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getPlano() {
        return plano;
    }

    public void setPlano(String plano) {
        this.plano = plano;
    }

    public Date getDataMatricula() {
        return dataMatricula;
    }

    public void setDataMatricula(Date dataMatricula) {
        this.dataMatricula = dataMatricula;
    }
}