package com.opt.biz;

import java.util.List;

import com.opt.dao.OPTDao;
import com.opt.dto.ItemDto;
import com.opt.dto.MemberDto;
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
	public List<ItemDto> itemList() {
		return dao.itemList();
	}

	@Override
	public List<PaymentDto> paymentList() {
		return dao.paymentList();
	}
}
