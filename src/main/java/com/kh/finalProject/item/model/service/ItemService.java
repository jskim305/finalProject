package com.kh.finalProject.item.model.service;

import java.util.List;

import com.kh.finalProject.item.model.vo.Item;

public interface ItemService {

	List<Item> selectPacList();

	Item selectOnePac(int INo);

	List<Item> selectitemList();

	List<Item> findlist1();

	List<Item> findlist2();

	List<Item> findlist3();

	Item selectOneitem(int INo);

	List<Item> findItemsByCategory(String category);

	int insertItem(Item item);

	void deleteItem(int itemNo);

	
	//	List<Item> selectPackageList();
}
