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
	public Item selectOnePac(int INo) {
		return itemDao.selectOnePac(INo);
	}

	//상품페이지 리스트 불러오기
	@Override
	public List<Item> selectitemList() {
		return  itemDao.selectitemList();
	}

	@Override
	public List<Item> findlist1() {
		return itemDao.findlist1();
	}

	@Override
	public List<Item> findlist2() {
		return itemDao.findlist2();
	}
	@Override
	public List<Item> findlist3() {
		return itemDao.findlist3();
	}

	@Override
	public Item selectOneitem(int INo) {
		return itemDao.selectOneitem(INo);
	}
	//상품카테고리 자동 입력 테스트
	@Override
	public List<Item> findItemsByCategory(String category) {
		return itemDao.findItemsByCategory(category);
	}

	@Override
	public int insertItem(Item item) {
		return itemDao.insertItem(item);
	}

	@Override
	public void deleteItem(int itemNo) {
		itemDao.deleteItem(itemNo);
	}
	

}
