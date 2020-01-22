package com.example.spring03.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring03.domain.GoodsViewVO;
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
}
