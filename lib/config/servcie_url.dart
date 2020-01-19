const serviceUrl= 'http://111.231.90.86:8080';//测试环境
// const serviceUrl ='http://192.168.1.3:5050';//董贵鹏地址
const servicePath={
  'homePageContent':serviceUrl +'/act/list',//获取首页轮播
  'topNavigatorConent':serviceUrl +'/sort/selectSortF',//获取分类
  'hotListConent':serviceUrl +'/goods/getNewGoods',//获取热门推荐
  'flootcontent':serviceUrl +'/sort/getHot',//获取楼层数据
  'hostPageContent':'http://test.baixingliangfan.cn/baixing/wxmini/homePageBelowConten'
};