import 'package:flutter/material.dart';
import '../model/category.dart';
class ChildCategory with ChangeNotifier{
  List<BxMallSubDto>childCategoryList = [];

  getChildCategory(List<BxMallSubDto> list){
    childCategoryList = list;
    // 在接口数据中添加
    BxMallSubDto all=BxMallSubDto();
    all.mallCategoryId ='00';
    all.mallSubName='全部';
    all.mallCategoryId='00';
    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }
}
 