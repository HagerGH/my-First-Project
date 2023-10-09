import 'package:get/get.dart';
import 'package:makeup/model/model.dart';
import 'package:makeup/services/servicescontroller.dart';


  class ProductController extends GetxController{
  var isLoading =true.obs;
    var productList =RxList <Product>().obs;

  @override
  void onInit(){
    super.onInit();
  }
  void fetchProduct() async{
 try{
   isLoading(true);
   dynamic products = await RemoteService().fetchProduct().obs;
   if (products != null) {
     productList.value = products as RxList<Product>;
   }
 } finally {isLoading(false);}
  }
}