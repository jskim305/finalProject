package com.kh.finalProject.farm.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.farm.model.dao.FarmDao;

@Service
public class FarmServiceImpl implements FarmService {

	@Autowired
	private FarmDao farmDao; 
}
