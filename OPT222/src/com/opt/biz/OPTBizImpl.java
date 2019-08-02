package com.opt.biz;

import java.util.List;

import com.opt.dao.OPTDao;
import com.opt.dto.CouponDto;
import com.opt.dto.ItemDto;
import com.opt.dto.MemberDto;
import com.opt.dto.OrderListDto;
import com.opt.dto.PaymentDto;

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

	@Override
	public int adminUserUpdate(String id, String enabled, String role) {
		return dao.adminUserUpdate(id, enabled, role);
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
}
