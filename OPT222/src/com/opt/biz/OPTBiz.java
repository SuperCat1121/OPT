package com.opt.biz;

import java.util.List;

import com.opt.dto.MemberDto;

public interface OPTBiz {
	public List<MemberDto> selectList();
	public MemberDto selectOne(int opt_no_seq);
	public int insert(MemberDto dto);
	public int update(MemberDto dto);
	public int delete(int opt_no_seq);
	public MemberDto login(String id, String pw);
}
