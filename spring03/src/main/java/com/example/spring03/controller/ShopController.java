package com.example.spring03.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.spring03.domain.CartListVO;
import com.example.spring03.domain.CartVO;
import com.example.spring03.domain.GoodsViewVO;
import com.example.spring03.domain.MemberVO;
import com.example.spring03.domain.ReplyListVO;
import com.example.spring03.domain.ReplyVO;
import com.example.spring03.service.ShopService;

@Controller
@RequestMapping(value="/shop/*")
public class ShopController {
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@Inject
	private ShopService shopService;
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void getshopList(@RequestParam("c") int catecode, @RequestParam("l") int level, Model model) throws Exception {
		logger.info("get shopList");
		
		List<GoodsViewVO> shopList = null;
		shopList = shopService.shopList(catecode, level);
		
		model.addAttribute("shopList", shopList);
	}
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public void getshopView(@RequestParam("n") int gdsnum, Model model) throws Exception {
		logger.info("get shopView");
		
		GoodsViewVO shopView = shopService.shopView(gdsnum);
		model.addAttribute("shopView", shopView);
	}
	
	/* @RequestMapping(value="/view", method = RequestMethod.POST)
	public String replyInsert(ReplyVO rep_insVO, HttpSession session) throws Exception {
		logger.info("insert reply");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		rep_insVO.setUserid(member.getUserid());
		
		shopService.replyInsert(rep_insVO);
		
		return "redirect:/shop/view?n=" + rep_insVO.getGdsnum();
	} */
	
	@ResponseBody
	@RequestMapping(value="/view/replyList", method = RequestMethod.GET)
	public List<ReplyListVO> getReplyList(@RequestParam("n") int gdsnum, Model model) throws Exception {
		logger.info("get reply list");
		
		List<ReplyListVO> replyList = shopService.replyList(gdsnum);
		return  replyList;
	}
	
	@ResponseBody
	@RequestMapping(value="/view/replyInsert", method = RequestMethod.POST)
	public void replyInsert(ReplyVO rep_insVO, HttpSession session) throws Exception {
		logger.info("insert reply");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		rep_insVO.setUserid(member.getUserid());
		
		shopService.replyInsert(rep_insVO);
	}
	
	@ResponseBody
	@RequestMapping(value="/view/replyDelete", method = RequestMethod.POST)
	public int getreplyList(ReplyVO rep_listVO, HttpSession session) throws Exception {
		logger.info("post delete reply");
		
		int result = 0;
		
		MemberVO member = (MemberVO)session.getAttribute("member");		//로그인한 세션 ID
		String userid = shopService.replyIdCheck(rep_listVO.getRepnum());		//데이터 베이스에서 가져온 ID
		
		if (member.getUserid().equals(userid)) {
			rep_listVO.setUserid(member.getUserid());
			shopService.replyDelete(rep_listVO);
			
			result = 1;
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/view/replyModify", method = RequestMethod.POST)
	public int replyModify(ReplyVO rep_upVO, HttpSession session) throws Exception {
		logger.info("post update reply");
		
		int result = 0;
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userid = shopService.replyIdCheck(rep_upVO.getRepnum());
		
		if(member.getUserid().equals(userid)) {
			rep_upVO.setUserid(member.getUserid());
			shopService.replyModify(rep_upVO);
			
			result = 1;
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/view/cartAdd", method = RequestMethod.POST)
	public int addCart(CartVO cart_insVO, HttpSession session) throws Exception {
		logger.info("post add cart");
		
		int result = 0;
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if (member != null) {
			cart_insVO.setUserid(member.getUserid());
			shopService.cartInsert(cart_insVO);
			result = 1;
		}
		return result;
	}
	
	@RequestMapping(value="/cartList", method = RequestMethod.GET)
	public void cartList(HttpSession session, Model model) throws Exception {
		logger.info("get cart list");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userid = member.getUserid();
		
		List<CartListVO> cartList = shopService.cartList(userid);
		
		model.addAttribute("cartList", cartList);
	}
}
