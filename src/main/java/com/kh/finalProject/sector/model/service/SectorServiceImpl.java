package com.kh.finalProject.sector.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.sector.model.dao.SectorDao;

@Service
public class SectorServiceImpl implements SectorService {

	@Autowired
	private SectorDao sectorDao;
}
