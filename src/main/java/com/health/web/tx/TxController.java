package com.health.web.tx;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Supplier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.health.web.center.Center;
import com.health.web.pxy.CrawlingProxy;
import com.health.web.pxy.PageProxy;
import com.health.web.pxy.Proxy;
import com.health.web.pxy.Trunk;
import com.health.web.user.User;
import com.health.web.user.UserProxy;
import com.health.web.util.Printer;

@RestController
@RequestMapping("/tx")
public class TxController extends Proxy{
	
	@Autowired CrawlingProxy crawler;
	@Autowired TxService txService; @Autowired TxMapper txMapper;
	@Autowired Trunk<Object> trunk; @Autowired Printer printer; 
	@Autowired Center center;
	@Autowired PageProxy pager;
	
	@GetMapping("/crawling/center")
	public Map<?,?> centerCrawling(){
		printer.accept("헬스센터 크롤링 진입");
		txService.centerCrawling();
		trunk.clear();
		trunk.put("msg", "success");
		return trunk.get();
	}
	@GetMapping("/info/{currPage}")
	public Map<?,?> infoCenter(@PathVariable int currPage){
		printer.accept("센터 인포 들어옴");
		Function<PageProxy, String> function = t -> txMapper.countCenter(t);
		function.apply(pager);
		int blockSize = 5 , pageSize = 10;
		pager.setBlockSize(blockSize);
		pager.setPageSize(pageSize);
		pager.setCurrPage(currPage);
		pager.setRowCount(integer(function.apply(pager)));
		pager.paging();
		Function<PageProxy, List<Center>> f = t -> txMapper.info(t);
		trunk.put(Arrays.asList("page","center"),Arrays.asList(pager,f.apply(pager)));
		printer.accept("보내는 값 ::"  +trunk.get());
		return trunk.get();
	}
	@GetMapping("/")
	public Map<?,?> insertDummy(){
		printer.accept("더미값 넣기");
		UserProxy userProxy = new UserProxy();
		txService.insertUser(userProxy.makerUser());
		trunk.put("msg", "success");
		return trunk.get();
	}
}
