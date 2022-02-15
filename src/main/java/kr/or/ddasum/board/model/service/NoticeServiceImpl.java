package kr.or.ddasum.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddasum.board.model.dao.NoticeDAO;
import kr.or.ddasum.board.model.vo.Notice;
import kr.or.ddasum.member.model.vo.Detail;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO nDAO;


	@Override
	public Notice noticeDetail(int iNo) {

		return nDAO.noticeDetail(iNo);
	}

	@Override
	public int recordNoticeTotalCount() {
		return nDAO.recordNoticeTotalCount();

	}
	
	@Override
	public ArrayList<Notice> noticeMainPageview() {
		return nDAO.noticeMainPageview();
		
	}

	@Override
	public ArrayList<Notice> faqMainPageview() {
		return nDAO.faqMainPageview();
		
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectAllNotice(int currentPage, int recordCountPerPage) {
		return nDAO.selectAllNotice(currentPage, recordCountPerPage);
		
	}

	@Override
	public int faqTotalCount() {
		return nDAO.faqTotalCount();
	}

	@Override
	public ArrayList<HashMap<String, Object>> faqBoard(int currentPage, int recordCountPerPage) {
		return nDAO.faqBoard(currentPage, recordCountPerPage);
	}

	@Override
	public ArrayList<Notice> selectFixNotice() {
		return nDAO.selectFixNotice();
		
	}
	
	




	
	
	
}
