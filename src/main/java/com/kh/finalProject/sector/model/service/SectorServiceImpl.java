package com.kh.finalProject.sector.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.sector.model.dao.SectorDao;
import com.kh.finalProject.sector.model.vo.Sector;

@Service
public class SectorServiceImpl implements SectorService {

	@Autowired
	private SectorDao sectorDao;

	
}
