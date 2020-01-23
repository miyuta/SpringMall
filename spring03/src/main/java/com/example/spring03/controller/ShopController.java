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
		
		List<ReplyListVO> replyList = shopService.replyList(gdsnum);
		model.addAttribute("replyList", replyList);
	}
	
	@RequestMapping(value="/view", method = RequestMethod.POST)
	public String replyInsert(ReplyVO rep_insVO, HttpSession session) throws Exception {
		logger.info("insert reply");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		rep_insVO.setUserid(member.getUserid());
		
		shopService.replyInsert(rep_insVO);
		
		return "redirect:/shop/view?n=" + rep_insVO.getGdsnum();
	}
}
