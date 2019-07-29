package com.opt.biz;

import java.util.List;

import com.opt.dto.MemberDto;
import com.opt.dto.OrderListDto;

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
}
