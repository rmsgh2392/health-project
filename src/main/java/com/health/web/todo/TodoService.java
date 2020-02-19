package com.health.web.todo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Supplier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.health.web.pxy.Proxy;
import com.health.web.util.Printer;

@Service
public class TodoService extends Proxy{
	@Autowired TodoMapper todoMapper;
	@Autowired Printer printer;
	
	public void diet(Todo param) {
		Consumer<Todo> consumer = t -> todoMapper.insertTodo(t);
		consumer.accept(param);
		
	}
	public List<Todo> findYoosan() {
		Supplier<List<HashMap<String, String>>> supplier = ()-> todoMapper.findYoosan();
		supplier.get();
		return null;
	}
	public List<Map<String, String>> calKcal(Todo param,String gender) {
		String totalW = "", Mbasic = "2500" , Fbasic = "2000";
		totalW = string(integer(param.getExistw()) - integer(param.getGoalw()));
		int totalC ,dayC , result = 0;
		totalC =  integer(totalW) * 7300;
		printer.accept("뺴야될 몸무게" + totalW);
		Supplier<List<HashMap<String, String>>> supplier = null;
		List<Map<String,String>> list = null;
		dayC = (gender.equals("male") || gender.equals("female")) ?  
		(totalC - integer(Mbasic) * integer(param.getGoald())) / integer(param.getGoald())  : (totalC - integer(Fbasic)) / integer(param.getGoald());
		System.out.println(dayC);
		switch (param.getGoald()) {
		case "7": 
		    supplier = ()-> todoMapper.findKcal();
			list = new ArrayList<>();
			System.out.println(supplier.get());
			for(Map<String ,String> map : supplier.get()) {
				int gg =  dayC / supplier.get().size();
				result = gg / integer(map.get("KCAL")) * integer(map.get("TIMES"));
				map.put("result",string(result));
				map.put("tcal",string(totalC));
				map.put("dcal",string(dayC));
				list.add(map);
			}
			break;
		case "30":
			supplier = ()-> todoMapper.findKcal();
			list = new ArrayList<>();
			for(Map<String ,String> map : supplier.get()) {
				int gg =  dayC / supplier.get().size();
				System.out.println(gg);
				result = gg / integer(map.get("KCAL")) * integer(map.get("TIMES"));
				map.put("result",string(result));
				map.put("tcal",string(totalC));
				map.put("dcal",string(dayC));
				list.add(map);
			}
			break;
		case "15" : 
			supplier = ()-> todoMapper.findKcal();
			list = new ArrayList<>();
			for(Map<String ,String> map : supplier.get()) {
				int gg =  dayC / supplier.get().size();
				result = gg / integer(map.get("KCAL")) * integer(map.get("TIMES"));
				map.put("result",string(result));
				map.put("tcal",string(totalC));
				map.put("dcal",string(dayC));
				list.add(map);
			}
			break;
		}
		System.out.println("list 값 : " + list);
		return list;
	}
}
