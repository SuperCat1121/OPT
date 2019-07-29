package com.opt.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.opt.dto.ItemDto;
import com.opt.dto.MemberDto;

public class OPTDao extends SqlMapConfig {

	private String namespace = "optmapper.";
	
	public MemberDto login(String id, String pw) {
		SqlSession session = null;
		MemberDto res = new MemberDto();
		
		HashMap<String, Object> login = new HashMap<String, Object>();
		login.put("id", id);
		login.put("pw", pw);
		session = getsqlSessionFactory().openSession(false);
		res = session.selectOne(namespace + "login", login);
		
		
		return res;
	}
	
	
	public List<MemberDto> selectList() {

		SqlSession session = null;
		List<MemberDto> list = new ArrayList<MemberDto>();

		session = getsqlSessionFactory().openSession(false);
		list = session.selectList(namespace + "selectList");

		return list;
	}
	
	public List<ItemDto> itemList() {
		SqlSession session = null;
		List<ItemDto> list = new ArrayList<ItemDto>();
		
		session = getsqlSessionFactory().openSession(false);
		list = session.selectList(namespace + "itemList");
		
		return list;
	}
	
}
