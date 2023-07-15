package com.kh.finalProject.item.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.item.model.dao.ItemDao;
import com.kh.finalProject.item.model.vo.Item;


@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemDao itemDao;
	
	@Override
	public List<Item> selectPacList() {
		return  itemDao.selectPacList();
	}

	@Override
	public Item selectOnePac(int itemNo) {
		return itemDao.selectOnePac(itemNo);
	}

	//상품페이지 리스트 불러오기
	@Override
	public List<Item> selectitemList() {
		return  itemDao.selectitemList();
	}

	@Override
	public Item selectOneitem(int itemNo) {
		return itemDao.selectOneitem(itemNo);
	}
	//상품카테고리 자동 입력 테스트
	@Override
	public List<Item> findItemsByCategory(String category) {
		return itemDao.findItemsByCategory(category);
	}

	/* 상품등록 ITEM */
	@Override
	public int insertItem(Item item) {
		return itemDao.insertItem(item);
	}
	/* 상품등록 Package */
	@Override
	public int insertPac(Item item) {
		return itemDao.insertPac(item);
	}

	@Override
	public void deleteItem(int itemNo) {
		itemDao.deleteItem(itemNo);
	}

	

}
