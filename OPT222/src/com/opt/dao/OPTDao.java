package com.opt.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.opt.dto.MemberDto;
import com.opt.dto.OrderListDto;

public class OPTDao extends SqlMapConfig {

	private String namespace = "optmapper.";
	
	public MemberDto login(String id, String pw) {
		SqlSession session = null;
		MemberDto res = new MemberDto();
		
		HashMap<String, Object> login = new HashMap<String, Object>();
		login.put("id", id);
		login.put("pw", pw);
		try {
			session = getsqlSessionFactory().openSession(false);
			res = session.selectOne(namespace + "login", login);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return res;
	}
	
	
	public List<MemberDto> selectList() {

		SqlSession session = null;
		List<MemberDto> list = new ArrayList<MemberDto>();

		try {
			session = getsqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}
	public int pay_count(int num) {
		
		SqlSession session = null;
		int count = 0;
		
		try {
			session = getsqlSessionFactory().openSession(false);
			count = session.selectOne(namespace + "pay_count",num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return count;
	}
	public int coupon_count(int num) {
		
		SqlSession session = null;
		int count = 0;
		
		try {
			session = getsqlSessionFactory().openSession(false);
			count = session.selectOne(namespace + "coupon_count", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return count;
	}
	public List<OrderListDto> orderList(int no){
		
		SqlSession session = null;
		List<OrderListDto> list = new ArrayList<OrderListDto>();
		
		try {
			session = getsqlSessionFactory().openSession();
			list = session.selectList(namespace + "order_list", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
}
