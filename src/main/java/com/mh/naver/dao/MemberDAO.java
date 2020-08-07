package com.mh.naver.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.activation.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mh.naver.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	JdbcTemplate jdbcTemplate;	
		
	public MemberDTO selectOne(MemberDTO oldmd) {
		
		List<MemberDTO> list = jdbcTemplate.query("select * from member where email=?", new RowMapper<MemberDTO>() {		
			
			@Override
			public MemberDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				MemberDTO memberDTO = new MemberDTO(rs.getInt(1),
						rs.getString(2), 
						rs.getString(3), 
						rs.getString(4), 
						rs.getString(5));
				return memberDTO;
			}
		}, oldmd.getEmail());
		
		return list.isEmpty() ? null : list.get(0);			
	}
	
	public List<MemberDTO> selectAll() {
		List<MemberDTO> list = jdbcTemplate.query("select * from member", new RowMapper<MemberDTO>() {
			@Override
			public MemberDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				MemberDTO memberDTO = new MemberDTO(
						rs.getInt(1),
						rs.getString(2), 
						rs.getString(3), 
						rs.getString(4), 
						rs.getString(5));
				System.out.println("memberDTO = " + memberDTO);
				return memberDTO;
			}
		});
		
		return list;
	}
	
	public void insert(final MemberDTO md) {		
		
		KeyHolder keyholder = new GeneratedKeyHolder();				
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement("insert into member " + 
						"(EMAIL, PASSWORD, NAME, REGDATE) " + 
						"values " + 
						"(?, ?, ?, now())", new String[] {"ID"});
				pstmt.setString(1, md.getEmail());
				pstmt.setString(2, md.getPassword());
				pstmt.setString(3, md.getRegdate());
			
				return pstmt;
			}
		}, keyholder);
	}
	
	public void update(MemberDTO md) {
		jdbcTemplate.update("update member set password=?, name=? where email=?",
				md.getPassword(),
				md.getName(),
				md.getEmail());		
	}
	
	public void delete(MemberDTO md) {
		jdbcTemplate.update("delete from member where email = ?", md.getEmail());		
	}
}
