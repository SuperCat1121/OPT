package com.opt.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.opt.dto.ItemDto;
import com.opt.dto.CouponDto;
import com.opt.dto.MemberDto;
import com.opt.dto.OrderListDto;
import com.opt.dto.PaymentDto;

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

	public List<ItemDto> itemList() {
		SqlSession session = null;
		List<ItemDto> list = new ArrayList<ItemDto>();
		session = getsqlSessionFactory().openSession(false);
		list = session.selectList(namespace + "itemList");
		return list;
	}
	
	public List<PaymentDto> paymentList() {
		SqlSession session = null;
		List<PaymentDto> list = new ArrayList<PaymentDto>();
		session = getsqlSessionFactory().openSession(false);
		list = session.selectList(namespace + "paymentList");
		return list;
	}

	public int adminUserUpdate(String id, String enabled, String role) {
		SqlSession session = null;
		session = getsqlSessionFactory().openSession(false);
		Map<String, Object> update = new HashMap<String, Object>();
		update.put("seq", id);
		update.put("enabled", enabled);
		update.put("role", role);
		int res = session.update(namespace + "adminUserUpdate", update);
		if(res > 0) {
			session.commit();
		}
		return res;
	}

	public ItemDto itemSelect(int no){
		SqlSession session = null;
		ItemDto dto = new ItemDto();
		try {
			session = getsqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace + "itemSelect", no);
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
	
	public int itemCount(int no){
		SqlSession session = null;
		int res = 0;
		try {
			session = getsqlSessionFactory().openSession(false);
			res = session.update(namespace + "itemCount", no);
			if(res > 0) {
				session.commit();
			}else {
				session.rollback();
			}
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	public List<ItemDto> itemSearch(String keyword, String msg) {		
		SqlSession session = null;
		List<ItemDto> list = new ArrayList<ItemDto>();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("msg", msg);
		try {
			session = getsqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "searchItem", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	public List<ItemDto> itemSearchPage(String keyword, String msg, int start, int end) {		
		SqlSession session = null;
		List<ItemDto> list = new ArrayList<ItemDto>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("msg", msg);
		map.put("start", start);
		map.put("end", end);
		try {
			session = getsqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "searchItemPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	public List<ItemDto> itemPage(int start, int end) {
		SqlSession session = null;
		List<ItemDto> list = new ArrayList<ItemDto>();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		try {
			session = getsqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "itemPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public List<CouponDto> couponList(int no) {
		SqlSession session = null;
		List<CouponDto> list = new ArrayList<CouponDto>();
		try {
			session = getsqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "couponList", no);
		} catch (Exception e) {
			e.printStackTrace();
		}	finally {
			session.close();
		}
		return list;
	}
	
}
