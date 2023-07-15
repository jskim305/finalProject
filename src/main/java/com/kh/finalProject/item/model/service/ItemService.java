package com.kh.finalProject.item.model.service;

import java.util.List;

import com.kh.finalProject.item.model.vo.Item;

public interface ItemService {

	List<Item> selectPacList();

	Item selectOnePac(int itemNo);

	List<Item> selectitemList();

	Item selectOneitem(int itemNo);

	List<Item> findItemsByCategory(String category);

	int insertItem(Item item);

	void deleteItem(int itemNo);

	int insertPac(Item item);

	
	//	List<Item> selectPackageList();
}
