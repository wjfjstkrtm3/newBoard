package com.movie.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MovieDaoImpl implements MovieDao {

	@Autowired
	private SqlSession sqlsession;
	
	
	

	
	
}
