package com.kh.finalProject.farm.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.finalProject.farm.model.vo.Farm;

@Mapper
public interface FarmDao {

	Farm selectFarmById(int farmId);
}
