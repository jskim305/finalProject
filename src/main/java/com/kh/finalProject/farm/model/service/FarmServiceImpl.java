package com.kh.finalProject.farm.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.farm.model.dao.FarmDao;
import com.kh.finalProject.farm.model.vo.Farm;

@Service
public class FarmServiceImpl implements FarmService {

	@Autowired
	FarmDao farmDao;

	@Override
	public Farm selectFarmById(int farmId) {
		return farmDao.selectFarmById(farmId);
	}	
}
