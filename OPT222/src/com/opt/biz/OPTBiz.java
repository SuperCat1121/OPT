package com.opt.biz;

import java.util.List;

import com.opt.dto.BasketDto;
import com.opt.dto.CouponDto;
import com.opt.dto.ItemDto;
import com.opt.dto.MemberDto;
import com.opt.dto.OrderListDto;
import com.opt.dto.PaymentDto;

public interface OPTBiz {
	public List<MemberDto> selectList();
	public MemberDto selectOne(int opt_no_seq);
	public int insert(MemberDto dto);
	public int update(MemberDto dto);
	public int delete(int opt_no_seq);
	public MemberDto login(String id, String pw);
	public int pay_count(int num);
	public int coupon_count(int num);
	public List<OrderListDto> orderList(int no);
	public List<ItemDto> itemList();
	public List<PaymentDto> paymentList();
	public int adminUserUpdate(String id, String enabled, String role);
	
	//상품리스트
	public ItemDto itemSelect(int no);
	public int itemCount(int no);
	public List<ItemDto> itemSearch(String keyword, String msg);
	public List<ItemDto> itemPage(int start, int end);
	public List<ItemDto> itemSearchPage(String keyword, String msg, int start, int end);
	
	
	//쿠폰리스트
	public List<CouponDto> couponList(int no);
	
	//장바구니	
	public int insertBasket(BasketDto basketDto);

}
