package com.opt.biz;

import java.util.List;

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
	// AdminPage Branche Merge ===========
	public List<ItemDto> itemList();
	public List<PaymentDto> paymentList();
	// ===================================
	public int adminUserUpdate(int opt_no_seq, String enabled, String role);
}
