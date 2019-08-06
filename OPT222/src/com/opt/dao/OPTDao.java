package com.opt.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.opt.dto.ItemDto;
import com.opt.dto.BasketDto;
import com.opt.dto.CalendarDto;
import com.opt.dto.CouponDto;
import com.opt.dto.MemberDto;
import com.opt.dto.OrderListDto;
import com.opt.dto.PaymentDto;
import com.opt.dto.PostboxDto;

public class OPTDao extends SqlMapConfig {

	private String namespace = "optmapper.";
	
	// 로그인
	public MemberDto login(String id, String pw) {
		SqlSession session = null;
		MemberDto res = new MemberDto();
		
		HashMap<String, Object> login = new HashMap<String, Object>();
		login.put("id", id);
		login.put("pw", pw);
		try {
			session = getsqlSessionFactory().openSession(false);
			res = session.selectOne("LoginMapper.login", login);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	// 유저 리스트
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
	
	// 결제 개수
	public int pay_count(int num) {
		SqlSession session = null;
		int count = 0;
		try {
			session = getsqlSessionFactory().openSession(false);
			count = session.selectOne("PayMapper.pay_count",num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}
	
	// 쿠폰 개수
	public int coupon_count(int num) {
		SqlSession session = null;
		int count = 0;
		try {
			session = getsqlSessionFactory().openSession(false);
			count = session.selectOne("CouponMapper.coupon_count", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}
	
	// 주문 리스트
	public List<OrderListDto> orderList(int no){
		SqlSession session = null;
		List<OrderListDto> list = new ArrayList<OrderListDto>();
		try {
			session = getsqlSessionFactory().openSession();
			list = session.selectList("OrderMapper.order_list", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	// 상품 리스트
	public List<ItemDto> itemList() {
		SqlSession session = null;
		List<ItemDto> list = new ArrayList<ItemDto>();
		session = getsqlSessionFactory().openSession(false);
		list = session.selectList("ItemMapper.itemList");
		return list;
	}
	
	// 결제 리스트
	public List<PaymentDto> paymentList() {
		SqlSession session = null;
		List<PaymentDto> list = new ArrayList<PaymentDto>();
		session = getsqlSessionFactory().openSession(false);
		list = session.selectList("PayMapper.paymentList");
		session.close();
		return list;
	}

	// 관리자_유저관리
	public int adminUserUpdate(String id, String enabled, String role) {
		SqlSession session = null;
		session = getsqlSessionFactory().openSession(false);
		Map<String, Object> update = new HashMap<String, Object>();
		update.put("id", id);
		update.put("enabled", enabled);
		update.put("role", role);
		int res = session.update("AdminMapper.adminUserUpdate", update);
		if(res > 0) {
			session.commit();
		}
		session.close();
		return res;
	}
	
	// 관리자_상품관리
	public int adminItemUpdate(Map<String, String> update) {
		SqlSession session = null;
		session = getsqlSessionFactory().openSession(false);
		int res = session.update("AdminMapper.adminItemUpdate", update);
		if(res > 0) {
			session.commit();
		}
		session.close();
		return res;
	}
	
	// 관리자_결제리스트
	public List<PaymentDto> paymentAllList() {
		SqlSession session = null;
		session = getsqlSessionFactory().openSession(false);
		List<PaymentDto> list = session.selectList("PayMapper.paymentAllList");
		return list;
	}
	
	// 선택한 상품 정보 출력
	public ItemDto itemSelect(int no){
		SqlSession session = null;
		ItemDto dto = new ItemDto();
		try {
			session = getsqlSessionFactory().openSession(false);
			dto = session.selectOne("ItemMapper.itemSelect", no);
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
	
	// 상품 조회수 하나씩 올림
	public int itemCount(int no){
		SqlSession session = null;
		int res = 0;
		try {
			session = getsqlSessionFactory().openSession(false);
			res = session.update("ItemMapper.itemCount", no);
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
	
	// 상품 검색 리스트
	public List<ItemDto> itemSearch(String keyword, String msg) {		
		SqlSession session = null;
		List<ItemDto> list = new ArrayList<ItemDto>();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("msg", msg);
		try {
			session = getsqlSessionFactory().openSession(false);
			list = session.selectList("ItemMapper.searchItem", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	// 상품 검색리스트 페이징 처리
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
			list = session.selectList("ItemMapper.searchItemPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	// 상품 리스트 페이징처리
	public List<ItemDto> itemPage(int start, int end) {
		SqlSession session = null;
		List<ItemDto> list = new ArrayList<ItemDto>();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		try {
			session = getsqlSessionFactory().openSession(false);
			list = session.selectList("ItemMapper.itemPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	// 보유 쿠폰 리스트
	public List<CouponDto> couponList(int no) {
		SqlSession session = null;
		List<CouponDto> list = new ArrayList<CouponDto>();
		try {
			session = getsqlSessionFactory().openSession(false);
			list = session.selectList("CouponMapper.couponList", no);
		} catch (Exception e) {
			e.printStackTrace();
		}	finally {
			session.close();
		}
		return list;
	}
	
	// 장바구니에 상품 추가
	public int insertBasket(BasketDto basketDto) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getsqlSessionFactory().openSession(false);
			res = session.insert("BasketMapper.insertBasket", basketDto);
			
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
	
	//일정 등록
	public int insertCalendar(CalendarDto calendardto) {
	
		SqlSession session = null;
		int res = 0;
		try {
			session = getsqlSessionFactory().openSession(false);
			res = session.insert("CalMapper.insertCal" , calendardto);
			
			if(res > 0) {
				session.commit();
			}else {
				session.rollback();
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}
	
	// 받은 쪽지함 리스트
	public List<PostboxDto> recivePostboxList(String id) {
		
		SqlSession session = null;
		List<PostboxDto> list = new ArrayList<PostboxDto>();
		
		try {
			session = getsqlSessionFactory().openSession(false);
			list = session.selectList("PostboxMapper.postboxReciveList", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();			
		}
		
		
		return list;
	}
	
	// 받은 쪽지함 리스트 페이징처리
	public List<PostboxDto> recivePostboxListPage(String id, int start, int end) {
		
		SqlSession session = null;
		List<PostboxDto> list = new ArrayList<PostboxDto>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);		
		map.put("start", start);
		map.put("end", end);
		
		try {
			session = getsqlSessionFactory().openSession(false);
			list = session.selectList("PostboxMapper.postboxReciveListPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return list;
	}
	
	// 보낸 쪽지함 리스트
	public List<PostboxDto> sendPostboxList(int opt_no) {
		
		SqlSession session = null;
		List<PostboxDto> list = new ArrayList<PostboxDto>();
		
		try {
			session = getsqlSessionFactory().openSession(false);
			list = session.selectList("PostboxMapper.sendPostboxList", opt_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();			
		}
		
		
		return list;
	}
	
	// 보낸 쪽지함 리스트 페이징처리
	public List<PostboxDto> sendPostboxListPage(int opt_no, int start, int end) {
		
		SqlSession session = null;
		List<PostboxDto> list = new ArrayList<PostboxDto>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("opt_no", opt_no);		
		map.put("start", start);
		map.put("end", end);
		
		try {
			session = getsqlSessionFactory().openSession(false);
			list = session.selectList("PostboxMapper.sendPostboxListPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
				
		return list;
	}
	
	// 쪽지 상세페이지
	public PostboxDto postboxDetail(int post_no) {
		
		SqlSession session = null;
		PostboxDto dto = new PostboxDto();
		
		try {
			session = getsqlSessionFactory().openSession(false);
			dto = session.selectOne("PostboxMapper.postboxDetail", post_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
				
		return dto;
		
	}
	
	// 쪽지 확인여부
	public int postboxRead(int post_no) {
		
		SqlSession session = null;
		int res = 0;

		
		try {
			session = getsqlSessionFactory().openSession(false);
			res = session.update("PostboxMapper.postboxRead", post_no);
			
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
	
	// 받은 쪽지 삭제
	public int reciveDel(int post_no) {
		
		SqlSession session = null;
		int res = 0;

		
		try {
			session = getsqlSessionFactory().openSession(false);
			res = session.update("PostboxMapper.readDel", post_no);
			
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
	
	// 보낸 쪽지 삭제
	public int sendDel(int post_no) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getsqlSessionFactory().openSession(false);
			res = session.update("PostboxMapper.sendDel", post_no);
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
	
	//받은쪽지, 보낸쪽지 삭제된 경우 DB에서 삭제
	public int allDel(int post_no) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getsqlSessionFactory().openSession(false);
			res = session.delete("PostboxMapper.allDel", post_no);
			
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
	
}
