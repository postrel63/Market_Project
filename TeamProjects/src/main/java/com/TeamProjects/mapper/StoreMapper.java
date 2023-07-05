package com.TeamProjects.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.TeamProjects.dto.BoardDTO;
import com.TeamProjects.dto.LikeDTO;
import com.TeamProjects.dto.ProductsDTO;
import com.TeamProjects.dto.StoreDTO;

public interface StoreMapper {

	
	public StoreDTO storeView(String stcode);

	public ArrayList<ProductsDTO> productsView(String stcode);

	public ArrayList<StoreDTO> myStorelist(String loginId);

	public int memst(String loginId);

	public String stcode(String loginId);

	public int storeJoin(StoreDTO storeDTO);

	public ArrayList<StoreDTO> storeList(String mid);

	public StoreDTO getstoreView(String stcode);

	public int stimgUpload(StoreDTO storeDTO);

	public String selectimgfile(String stcode);

	public int updateOp(StoreDTO storeDTO);

	public int updatephone(StoreDTO storeDTO);

	public int updatenote(StoreDTO storeDTO);

	public int updateaddress(StoreDTO storeDTO);

	public ArrayList<ProductsDTO> productsList(String stcode);

	public int productjoin(ProductsDTO productsdto);

	public ProductsDTO productModifyinfo(String prcode);

	public String selectprimgfile(String prcode);
	
	public int prModifyUpdate(ProductsDTO productsdto);

	public String selectPrimage(String prcode);

	public int deleteProduct(String prcode);

	public int deleteStore(String stcode);

	public int deleteProductList(String stcode);

	public int prcheckbox(ProductsDTO productsDTO);

	public int stcheckUpdate(StoreDTO storeDTO);

	public String stoperatecheck(String stcode);

	public int productCount(String stcode);

	public int updatecategory(StoreDTO storeDTO);

	public ArrayList<StoreDTO> getmarketList(String area);

	public ArrayList<StoreDTO> changemarket(StoreDTO storeDTO);

	public ArrayList<StoreDTO> getmarketListAll();

	public ArrayList<StoreDTO> changemarketAll(String stcategory);

	public ArrayList<StoreDTO> marketopenAll();

	public ArrayList<StoreDTO> marketopen(String areaname);

	public int storeListpage();

	public String storeLike(LikeDTO likedto);

	public int likePlusUpdate(String stcode);

	public int likeMinusUpdate(String stcode);

	public int likeInsert(LikeDTO likedto);

	public int likeDelete(LikeDTO likedto);

	public String storeLikeCount(String stcode);

	public ArrayList<StoreDTO> selectLike(String areaname);

	public ArrayList<StoreDTO> selectLikeAll();

	public ArrayList<StoreDTO> marketopencategory(StoreDTO storeDTO);

	public ArrayList<StoreDTO> selectLikecategory(StoreDTO storeDTO);

	public ArrayList<StoreDTO> getmarketListcategory(StoreDTO storeDTO);

	public ArrayList<StoreDTO> marketopencategoryAll(String stcategory);

	public ArrayList<StoreDTO> selectLikecategoryAll(String stcategory);

	public ArrayList<StoreDTO> getmarketListcategoryAll(String stcategory);

	public int getborankList(BoardDTO boardDTO);

	public String getborank(BoardDTO boardDTO);

	public int getreviewcount(String stcode);

	public int strankupdate(StoreDTO storeDTO);

	public ArrayList<StoreDTO> selectstrank();

	public ArrayList<StoreDTO> selectstrankAll(String stcategory);

	public ArrayList<StoreDTO> selectstrankcategory(StoreDTO storeDTO);

	public ArrayList<StoreDTO> selectstrankarea(String areaname);




}
