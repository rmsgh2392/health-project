package com.health.web.food;

import java.util.List;
import java.util.Map;
import java.util.function.Supplier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.health.web.util.Printer;

@RestController
@RequestMapping("/food")
public class FoodCtrl {
	@Autowired
	Map<String, Object> map;
	@Autowired
	Food food;
	@Autowired
	Printer printer;
	@Autowired
	FoodMapper foodMapper;
	
	@GetMapping("/{weight}")
	public List<Food> proteinCalc(@PathVariable String weight) {
		Supplier<List<Food>> s = ()-> foodMapper.selectAll();
		System.out.println(s.get());
		return s.get();
	}
}