package br.com.academia.dao;

import br.com.academia.factory.ConnectionFactory;
import br.com.academia.model.Aluno;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AlunoDAO {

    public void inserir(Aluno a) throws Exception {
        String sql = "INSERT INTO aluno (nome, cpf, plano, data_matricula) VALUES (?, ?, ?, ?)";

        try (Connection con = ConnectionFactory.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, a.getNome());
            stmt.setString(2, a.getCpf());
            stmt.setString(3, a.getPlano());
            stmt.setDate(4, a.getDataMatricula());

            stmt.executeUpdate();
        }
    }

    public List<Aluno> listar() throws Exception {
        String sql = "SELECT * FROM aluno";
        List<Aluno> lista = new ArrayList<>();

        try (Connection con = ConnectionFactory.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Aluno a = new Aluno();
                a.setId(rs.getInt("id"));
                a.setNome(rs.getString("nome"));
                a.setCpf(rs.getString("cpf"));
                a.setPlano(rs.getString("plano"));
                a.setDataMatricula(rs.getDate("data_matricula"));

                lista.add(a);
            }
        }

        return lista;
    }

    public Aluno buscarPorId(int id) throws Exception {
        String sql = "SELECT * FROM aluno WHERE id = ?";
        Aluno a = null;

        try (Connection con = ConnectionFactory.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    a = new Aluno();
                    a.setId(rs.getInt("id"));
                    a.setNome(rs.getString("nome"));
                    a.setCpf(rs.getString("cpf"));
                    a.setPlano(rs.getString("plano"));
                    a.setDataMatricula(rs.getDate("data_matricula"));
                }
            }
        }

        return a;
    }

    public void atualizar(Aluno a) throws Exception {
        String sql = "UPDATE aluno SET nome = ?, cpf = ?, plano = ?, data_matricula = ? WHERE id = ?";

        try (Connection con = ConnectionFactory.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, a.getNome());
            stmt.setString(2, a.getCpf());
            stmt.setString(3, a.getPlano());
            stmt.setDate(4, a.getDataMatricula());
            stmt.setInt(5, a.getId());

            stmt.executeUpdate();
        }
    }

    public void deletar(int id) throws Exception {
        String sql = "DELETE FROM aluno WHERE id = ?";

        try (Connection con = ConnectionFactory.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}