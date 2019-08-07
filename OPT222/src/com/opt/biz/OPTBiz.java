package com.opt.biz;

import java.util.List;
import java.util.Map;

import com.opt.dto.BasketDto;
import com.opt.dto.CalendarDto;
import com.opt.dto.CouponDto;
import com.opt.dto.ItemDto;
import com.opt.dto.MemberDto;
import com.opt.dto.OrderListDto;
import com.opt.dto.PaymentDto;
import com.opt.dto.PostboxDto;
import com.opt.dto.VideoClipDto;
import com.opt.dto.VideoComment;

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
	public MemberDto emailChk(String email);	
	public MemberDto findId(String email);

	//비디오
	public List<VideoClipDto> selectVideoList();
	public List<VideoClipDto> videoListPage(int start, int end);
	public int videoCount(int no);
	public VideoClipDto videoSelectOne(int no);
	public List<VideoComment> videoCommentList(int no);
	
	
	// 관리자_유저관리
	public int adminUserUpdate(String id, String enabled, String role);
	// 관리자_상품관리
	public int adminItemUpdate(Map<String, String> update);
	// 관리자_결제내역
	public List<PaymentDto> paymentAllList();
	
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

	//일정관리
	public int insertCalendar(CalendarDto calendardto);
	public List<CalendarDto> Callist(int opt_no_seq);
	public CalendarDto CalllistOne(int cal_no_seq);
	public int updateCalendar(CalendarDto caldto);
	public int deleteCalendar(int cal_no_seq);
	
	//쪽지함
	public List<PostboxDto> recivePostboxList(String id);
	public List<PostboxDto> recivePostboxListPage(String id, int start, int end);
	public List<PostboxDto> sendPostboxList(int opt_no);
	public List<PostboxDto> sendPostboxListPage(int opt_no, int start, int end);
	public PostboxDto postboxDetail(int post_no);
	public int postboxRead(int post_no);
	public int readDel(int post_no);
	public int sendDel(int post_no);
	public int allDel(int post_no);
}
