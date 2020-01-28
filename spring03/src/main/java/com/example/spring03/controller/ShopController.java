package com.example.spring03.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
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
import com.example.spring03.domain.OrderDetailsVO;
import com.example.spring03.domain.OrderVO;
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
	
	@ResponseBody
	@RequestMapping(value="/cartDelete", method = RequestMethod.POST)
	public int cartDelete(HttpSession session, @RequestParam(value="chBox[]") List<String> chArr, CartVO cart_delVO) throws Exception {
		logger.info("post cart delete");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userid = member.getUserid();
		
		int result = 0;
		int cartNum = 0;
		
		if(member != null) {
			cart_delVO.setUserid(userid);
			
			for(String i : chArr) {
				cartNum = Integer.parseInt(i);
				cart_delVO.setCartnum(cartNum);
				shopService.cartDelete(cart_delVO);
			}
			result = 1;
		}
		return result;
	}
	
	//주문
	@RequestMapping(value="/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO ord_insVO, OrderDetailsVO ord_detVO) throws Exception {
		logger.info("post order");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userid = member.getUserid();
		
		Calendar cal= Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for (int i = 1; i <= 6; i++) {
			subNum += (int)(Math.random() * 10 );
		}
		
		String orderId = ymd + "_" + subNum;
		
		ord_insVO.setOrderid(orderId);
		ord_insVO.setUserid(userid);
		
		shopService.orderInsert(ord_insVO);
		
		ord_detVO.setOrderid(orderId);
		shopService.orderDetails(ord_detVO);
		
		shopService.orderAftDel(userid);
		
		return "redirect:/shop/orderList";
	}
	
	@RequestMapping(value="/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, OrderVO ord_listVO, Model model) throws Exception {
		logger.info("get order list");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserid();
		
		ord_listVO.setUserid(userId);
		
		List<OrderVO> orderList = shopService.orderList(userId);
		
		model.addAttribute("orderList", orderList);
	}
}
