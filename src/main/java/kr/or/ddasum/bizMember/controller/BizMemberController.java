package kr.or.ddasum.bizMember.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddasum.bizMember.model.service.BizMemberService;
import kr.or.ddasum.bizMember.model.vo.BizGoods;
import kr.or.ddasum.bizMember.model.vo.Calculater;
import kr.or.ddasum.member.model.vo.BizMember;
import kr.or.ddasum.member.model.vo.Detail;

@Controller
public class BizMemberController {
	
	@Autowired
	private BizMemberService bService;
		
	@RequestMapping(value="/bizMember/bizManage.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView bizManage(@SessionAttribute BizMember bizMember, HttpServletRequest request, ModelAndView mav) {
		BizMember bm = bService.bizManage(bizMember);
		
		mav.addObject("bizMember", bm);
		mav.setViewName("/bizMember/bizManage");

		return mav;
		
	}	
	
	@RequestMapping(value="/BizMember/goodsManage.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView goodsManage(@RequestParam(defaultValue ="1") int currentPage,
								@SessionAttribute BizMember bizMember,
								HttpServletRequest request,
								BizGoods bizGoods,
								ModelAndView mav
								, @RequestParam(value="nowPage", required=false)String nowPage
								, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int bizNo = bizMember.getBizNo();
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int recordBizTotalCount = bService.recordBizTotalCount(bizNo);
		int pageTotalCount = (int)Math.ceil(recordBizTotalCount/(double)recordCountPerPage);
		int startNavi = currentPage - (currentPage - 1) % naviCountPerPage;
		int endNavi = startNavi + naviCountPerPage - 1;
		endNavi = endNavi > pageTotalCount ? pageTotalCount : endNavi;
		
		ArrayList<HashMap<String, Object>> list = bService.goodsManageList(bizNo, currentPage, recordCountPerPage);
		ArrayList<Integer> navi = new ArrayList<>();
		for (int i = startNavi; i <= endNavi; i++) {
			navi.add(i);
		}
		
		
		mav.addObject("recordBizTotalCount", recordBizTotalCount);
		mav.addObject("list", list);
		mav.addObject("currentPage", currentPage);
		mav.addObject("navi", navi);
		mav.addObject("preNavi", startNavi > 1 ? startNavi - 1 : 0 );
		mav.addObject("nextNavi", pageTotalCount > endNavi ? endNavi + 1 : 0 );
		
		String gopage = "";
		if("SP".equals(bizMember.getAuthorityId())) {
			gopage = "/bizMember/goodsManage";
			
		} else if("DC".equals(bizMember.getAuthorityId())) {
			
			gopage = "/bizMember/goodsManage_dc";
		}
		
		
		mav.setViewName(gopage);

		
		return mav;

	}	
	
	@RequestMapping(value="/BizMember/bizReserv.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView bizReserv(@RequestParam(defaultValue ="1" ) int currentPage, 
								HttpServletRequest request, 
								Detail detail,
								ModelAndView mav, 
								@SessionAttribute BizMember bizMember){
		int bizNo = bizMember.getBizNo();
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int detailTotalCount = bService.detailTotalCount(bizNo);
		int pageTotalCount = (int)Math.ceil(detailTotalCount/(double)recordCountPerPage);
		int startNavi = currentPage - (currentPage - 1) % naviCountPerPage;
		int endNavi = startNavi + naviCountPerPage - 1;
		endNavi = endNavi > pageTotalCount ? pageTotalCount : endNavi;
		
		ArrayList<Detail> list = bService.bizReserv(currentPage, recordCountPerPage, bizNo);
		ArrayList<Integer> navi = new ArrayList<>();
		for (int i = startNavi; i <= endNavi; i++) {
			navi.add(i);
		}	
		mav.addObject("detailTotalCount", detailTotalCount);
		mav.addObject("list", list);
		mav.addObject("currentPage", currentPage);
		mav.addObject("navi", navi);
		mav.addObject("preNavi", startNavi > 1 ? startNavi - 1 : 0 );
		mav.addObject("nextNavi", pageTotalCount > endNavi ? endNavi + 1 : 0 );
		mav.setViewName("/bizMember/bizReserv");
		
		return mav;			
		

		
	}		
	
	@RequestMapping(value="/BizMember/calculateManage.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView calculate(@RequestParam(defaultValue ="1" ) int currentPage, 
								HttpServletRequest request, 
								Detail detail,
								ModelAndView mav, 
								@SessionAttribute BizMember bizMember){

		int bizNo = bizMember.getBizNo();
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int detailTotalCount = bService.detailTotalCount(bizNo);
		int pageTotalCount = (int)Math.ceil(detailTotalCount/(double)recordCountPerPage);
		int startNavi = currentPage - (currentPage - 1) % naviCountPerPage;
		int endNavi = startNavi + naviCountPerPage - 1;
		endNavi = endNavi > pageTotalCount ? pageTotalCount : endNavi;
		
		ArrayList<Detail> list = bService.calculateManage(currentPage, recordCountPerPage, bizNo);
		ArrayList<Integer> navi = new ArrayList<>();
		for (int i = startNavi; i <= endNavi; i++) {
			navi.add(i);
		}	
		mav.addObject("detailTotalCount", detailTotalCount);
		mav.addObject("list", list);
		mav.addObject("currentPage", currentPage);
		mav.addObject("navi", navi);
		mav.addObject("preNavi", startNavi > 1 ? startNavi - 1 : 0 );
		mav.addObject("nextNavi", pageTotalCount > endNavi ? endNavi + 1 : 0 );
		
		String gopage = "";
		if("SP".equals(bizMember.getAuthorityId())) {
			gopage = "/bizMember/calculateManage";
			
		} else if("DC".equals(bizMember.getAuthorityId())) {
			
			gopage = "/bizMember/calculateManage_dc";
		}
		
		
		mav.setViewName(gopage);

		
		return mav;		
	}		
	
	
	
	
	
	
	@RequestMapping(value="/BizMember/goodDetail.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String goodDetail() {
		
		return "bizMember/goodDetail";
		
	}	

	@RequestMapping(value="/BizMember/goodDetail_dc.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String goodDetail_dc() {
		
		return "bizMember/goodDetail_dc";
		
	}	
	
	
	@RequestMapping(value="/bizMember/goodModify.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView goodModify(@SessionAttribute BizMember bizMember, 
								@RequestParam String menuNo,
								ModelAndView mav) {
		System.out.println("통신: 성공");
		BizGoods bg = bService.goodModify(Integer.parseInt(menuNo));
		System.out.println("bg1: "+bg);
		mav.addObject("BizGoods", bg);
		mav.setViewName("/bizMember/goodModify");
		
		return mav;
	}
	
	@RequestMapping(value="/bizMember/goodModify_dc.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView goodModify_dc(@SessionAttribute BizMember bizMember, 
								@RequestParam String menuNo,
								ModelAndView mav) {
		BizGoods bg = bService.goodModify_dc(Integer.parseInt(menuNo));
		mav.addObject("BizGoods", bg);
		mav.setViewName("/bizMember/goodModify_dc");
		
		return mav;
	}
	
	
	
	
	
	@RequestMapping(value="/BizMember/logout.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/bizMember/updateBizManage.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView updateBizMemeber(@SessionAttribute BizMember bizMember, HttpServletRequest request, ModelAndView mav) {

		
		BizMember bm = bService.bizManage(bizMember);
		
		mav.addObject("bizMember", bm);
		mav.setViewName("/bizMember/updateBizManage");
		
		return mav;
	}
	
	@RequestMapping(value="/bizMember/updateBiz.do", method={RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String updateBiz(BizMember bizMemberVo,
							@SessionAttribute BizMember bizMember, 
							HttpSession session,
							@RequestParam String bizImage,
							HttpServletResponse response) throws IOException{
		String bizId = bizMember.getBizId();

		System.out.println(bizImage);
		BizMember bz = new BizMember();
		bz.setBizImage(bizImage);
		bz.setCeoName(bizMemberVo.getCeoName());
		bz.setBizName(bizMemberVo.getBizName());
		bz.setBizEmail(bizMemberVo.getBizEmail());
		bz.setBizPhone(bizMemberVo.getBizPhone());
		bz.setRestaurant(bizMemberVo.getRestaurant());
		bz.setAddress(bizMemberVo.getAddress());
		bz.setBizTime(bizMemberVo.getBizTime());
		bz.setBizCount(bizMemberVo.getBizCount());
		bz.setBizId(bizId); //session

		int result = bService.updateBiz(bz);
		
		String rst = "";
		if (result > 0) {
			rst = "true";
		} else {
			rst = "false";
		}
		
		return rst;
	}
	
	
	@RequestMapping(value="/bizMember/withDraw.do", method = RequestMethod.POST)
	@ResponseBody
	public String withDraw(HttpServletRequest request,  
						@SessionAttribute BizMember bizMember,
						HttpSession session) {

		String bizId = bizMember.getBizId();
		
		int result = bService.updateWithdraw(bizId);
		
		String rst = "";
		if (result > 0) {
			rst = "true";
		} else {
			rst = "false";
		}
		
		return rst;
	}
	
	@RequestMapping(value="/bizMember/suportChange.do", method = RequestMethod.POST)
	@ResponseBody
	public String suportChange(	@SessionAttribute BizMember bizMember) {
		
		String authorityId = bizMember.getAuthorityId();
		
		if("SP".contentEquals(authorityId))
		{
			authorityId = "DC";
		} 
		else if("DC".equals(authorityId))
		{
			authorityId = "SP";
		}

		BizMember bg = new BizMember();
		bg.setBizId(bizMember.getBizId());
		bg.setAuthorityId(authorityId);
		
		int result = bService.suportChange(bg);
		
		
		String rst = "";
		if (result > 0) {
			rst = "true";
		} else {
			rst = "false";
		}
		
		return rst;
	}
	
	
	@RequestMapping(value="/bizMember/addGood.do", method=RequestMethod.POST)
	@ResponseBody
	public String addGood(BizGoods bizGoodsVo,
						@SessionAttribute BizMember bizMember, 
						HttpServletResponse response,
						@RequestParam String menuName,
						@RequestParam String menuInfo,
						@RequestParam int originalPrice,
						@RequestParam int dcPrice

						) throws IOException{

		int bizNo = bizMember.getBizNo();
		String authorityId = bizMember.getAuthorityId();
		String restaurant = bizMember.getRestaurant();
		
		
		BizGoods bg = new BizGoods();
		bg.setMenuName(bizGoodsVo.getMenuName());
		bg.setMenuInfo(bizGoodsVo.getMenuInfo());
		bg.setOriginalPrice(bizGoodsVo.getOriginalPrice());
		bg.setDcPrice(bizGoodsVo.getDcPrice());
		
		bg.setBizNo(bizNo);
		bg.setAuthorityId(authorityId);
		bg.setRestaurant(restaurant);
		; //session
		
		
		int result = bService.addGood(bg);
		
		String rst = "";
		if (result > 0) {
			rst = "true";
		} else {
			rst = "false";
		}
		return rst;
	}	
	
	
	@RequestMapping(value="/bizMember/GoodMo.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView GoodMo(
						@RequestParam int menuNo,
						@RequestParam String menuName,
						@RequestParam String menuInfo,
						@RequestParam int originalPrice,
						ModelAndView mav){
		
		BizGoods bg = new BizGoods();
		bg.setMenuNo(menuNo);
		bg.setMenuName(menuName);
		bg.setMenuInfo(menuInfo);
		bg.setOriginalPrice(originalPrice);

		int result = bService.GoodMo(bg);
		if (result > 0) {
			mav.addObject("msg", "상품 수정 성공");
			mav.addObject("/bizMember/goodsManage.do");
		} else {
			mav.addObject("msg", "상품 수정 실패");
			mav.addObject("/bizMember/goodsManage.do");
		}
		mav.setViewName("commons/msg");
		return mav;

	}


	@RequestMapping(value = "/excelConvert", method = RequestMethod.GET)
	public ModelAndView excelConvert(Locale locale, 
									@RequestParam(defaultValue ="1" ) int currentPage, 
									HttpServletRequest request, 
									Detail detail,
									@SessionAttribute BizMember bizMember) {
								
		int bizNo = bizMember.getBizNo();
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int detailTotalCount = bService.detailTotalCount(bizNo);
		int pageTotalCount = (int)Math.ceil(detailTotalCount/(double)recordCountPerPage);
		int startNavi = currentPage - (currentPage - 1) % naviCountPerPage;
		int endNavi = startNavi + naviCountPerPage - 1;
		endNavi = endNavi > pageTotalCount ? pageTotalCount : endNavi;
		
		ArrayList<Detail> list = bService.calculateManage(currentPage, recordCountPerPage, bizNo);
		ArrayList<Integer> navi = new ArrayList<>();
		for (int i = startNavi; i <= endNavi; i++) {
			navi.add(i);
		}	
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("detailTotalCount", detailTotalCount);
		mv.addObject("list", list);
		mv.setViewName("/bizMember/excelConvert");
		
		return mv;
	}
	
	
	
	
	
}
