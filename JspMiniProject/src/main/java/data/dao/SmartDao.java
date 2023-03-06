package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import data.dto.SmartDto;
import mysql.db.DbConnect;

public class SmartDao {
	DbConnect db = new DbConnect();
	//insert
	public void insertSmart(SmartDto dto)
	{
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into smartboard(writer,subject,content,writeday) values(?,?,?,now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	//페이징처리 list
	
	//전체갯수
	
	//num에 대한 하나의 dto
	
	
}
