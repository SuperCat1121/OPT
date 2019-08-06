package com.opt.biz;

import java.util.List;
import java.util.Map;

import com.opt.dao.OPTDao;
import com.opt.dto.BasketDto;
import com.opt.dto.CalendarDto;
import com.opt.dto.CouponDto;
import com.opt.dto.ItemDto;
import com.opt.dto.MemberDto;
import com.opt.dto.OrderListDto;
import com.opt.dto.PaymentDto;
import com.opt.dto.PostboxDto;


public class OPTBizImpl implements OPTBiz {

	private OPTDao dao = new OPTDao();
	
	@Override
	public List<MemberDto> selectList() {
		return dao.selectList();
	}

	@Override
	public MemberDto selectOne(int opt_no_seq) {
		return null;
	}

	@Override
	public int insert(MemberDto dto) {
		return 0;
	}

	@Override
	public int update(MemberDto dto) {
		return 0;
	}

	@Override
	public int delete(int opt_no_seq) {
		return 0;
	}

	@Override
	public MemberDto login(String id, String pw) {
		return dao.login(id, pw);
	}

	@Override
	public int pay_count(int num) {
		return dao.pay_count(num);
	}

	@Override
	public int coupon_count(int num) {
		return dao.coupon_count(num);
	}
	
	@Override
	public List<OrderListDto> orderList(int no){
		return dao.orderList(no);
	}

	// 관리자_유저관리
	@Override
	public int adminUserUpdate(String id, String enabled, String role) {
		return dao.adminUserUpdate(id, enabled, role);
	}
	
	// 관리자_상품관리
	@Override
	public int adminItemUpdate(Map<String, String> update) {
		return dao.adminItemUpdate(update);
	}
	
	// 관리자_그래프
	@Override
	public List<PaymentDto> paymentAllList() {
		return dao.paymentAllList();
	}
	
	@Override
	public List<ItemDto> itemList() {
		return dao.itemList();
	}
	
	@Override
	public List<PaymentDto> paymentList() {
		return dao.paymentList();
	}

	@Override
	public ItemDto itemSelect(int no) {
		return dao.itemSelect(no);
	}

	@Override
	public int itemCount(int no) {
		return dao.itemCount(no);
	}

	@Override
	public List<ItemDto> itemSearch(String keyword, String msg) {
		return dao.itemSearch(keyword, msg);
	}

	@Override
	public List<ItemDto> itemPage(int start, int end) {
		return dao.itemPage(start, end);
	}

	@Override
	public List<ItemDto> itemSearchPage(String keyword, String msg, int start, int end) {
		return dao.itemSearchPage(keyword, msg, start, end);
	}
	
	//쿠폰리스트
	@Override
	public List<CouponDto> couponList(int no) {
		return dao.couponList(no);
	}
	
	//장바구니 상품등록
	@Override
	public int insertBasket(BasketDto basketDto) {
		return dao.insertBasket(basketDto);
	}
	
	//일정관리 일정등록
	@Override
	public int insertCalendar(CalendarDto calendardto) {
		return dao.insertCalendar(calendardto);
	}
	
	
	
	
	//받은쪽지함 리스트
	@Override
	public List<PostboxDto> recivePostboxList(String id) {
		return dao.recivePostboxList(id);
	}
	
	
	//받은쪽지함 리스트 페이징처리
	@Override
	public List<PostboxDto> recivePostboxListPage(String id, int start, int end) {
		return dao.recivePostboxListPage(id, start, end);
	}
	
	
	//보낸쪽지함 리스트
	@Override
	public List<PostboxDto> sendPostboxList(int opt_no) {
		return dao.sendPostboxList(opt_no);
	}
	
	//보낸쪽지함 리스트 페이징처리
	@Override
	public List<PostboxDto> sendPostboxListPage(int opt_no, int start, int end) {
		return dao.sendPostboxListPage(opt_no, start, end);
	}

	//쪽지 상세페이지
	@Override
	public PostboxDto postboxDetail(int post_no) {

		return dao.postboxDetail(post_no);
	}
	
	//쪽지 확인여부
	@Override
	public int postboxRead(int post_no) {
		
		return dao.postboxRead(post_no);
	}
	
	//받은 쪽지 삭제
	@Override
	public int readDel(int post_no) {

		return dao.reciveDel(post_no);
	}
	
	
	//보낸 쪽지 삭제
	@Override
	public int sendDel(int post_no) {

		return dao.sendDel(post_no);
	}
	
	
	//받은쪽지, 보낸쪽지 삭제된 경우 DB에서 삭제
	@Override
	public int allDel(int post_no) {
		
		return dao.allDel(post_no);
	}
	
	
}
