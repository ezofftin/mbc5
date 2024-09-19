package com.mbc.jeju.mapper;

import java.util.ArrayList;
import java.util.List;

import com.mbc.jeju.domain.AdminDTO;
import com.mbc.jeju.domain.MemberDTO;


public interface AdminMapper {
	
	// 멤버 로그인 OK
	AdminDTO adminLogin(AdminDTO dto);

	// 어드민-멤버 리스트
	ArrayList<MemberDTO> adMemberList();
	
	// 어드민-멤버 삭제
	void adMemberDelete(int no);
	
	// 어드민-멤버 조회
	MemberDTO adminMemberInfo(int no);
	
	// 어드민-멤버 수정OK
	void adMemberUpdate(MemberDTO dto);

}
