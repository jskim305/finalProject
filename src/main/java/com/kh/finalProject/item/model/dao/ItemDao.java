package com.kh.finalProject.item.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.finalProject.item.model.vo.Item;

@Mapper
public interface ItemDao {

	List<Item> selectPacList();

	Item selectOnePac(int itemNo);

	//상품 카테고리별 페이지 리스트 -->
	List<Item> selectitemList();

	List<Item> findlist1();

	List<Item> findlist2();

	List<Item> findlist3();

	Item selectOneitem(int itemNo);

	List<Item> findItemsByCategory(String category);

	int insertItem(Item item);
	
	int insertPac(Item item);

	void deleteItem(int itemNo);

		
}
