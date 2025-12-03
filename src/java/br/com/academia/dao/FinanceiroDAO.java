package br.com.academia.dao;

import br.com.academia.factory.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FinanceiroDAO {

    private Connection conn;

    public FinanceiroDAO() throws Exception {
        this.conn = ConnectionFactory.getConnection();
    }

    public int getTotalAlunos() throws Exception {
        String sql = "SELECT COUNT(*) FROM aluno";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        rs.next();
        return rs.getInt(1);
    }

    public double getTotalReceita() throws Exception {
        String sql =
            "SELECT SUM(" +
            "   CASE " +
            "      WHEN plano = 'BÁSICO' THEN 80 " +
            "      WHEN plano = 'PRATA' THEN 109 " +
            "      WHEN plano = 'OURO' THEN 120 " +
            "   END" +
            ") FROM aluno";

        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        rs.next();
        return rs.getDouble(1);
    }

    public int getQtdPlano(String plano) throws Exception {
        String sql = "SELECT COUNT(*) FROM aluno WHERE plano = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, plano);
        ResultSet rs = stmt.executeQuery();
        rs.next();
        return rs.getInt(1);
    }
}