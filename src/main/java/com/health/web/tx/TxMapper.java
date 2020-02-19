package com.health.web.tx;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.health.web.center.Center;
import com.health.web.pxy.PageProxy;

@Repository
public interface TxMapper {
	public List<Center> info(PageProxy param);
	public String countCenter(PageProxy param);
}
