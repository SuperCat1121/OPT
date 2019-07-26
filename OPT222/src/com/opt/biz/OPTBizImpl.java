package com.opt.biz;

import java.util.List;

import com.opt.dao.OPTDao;
import com.opt.dto.MemberDto;

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

}
