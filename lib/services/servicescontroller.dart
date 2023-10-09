import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:makeup/model/model.dart';

class RemoteService{
  var client=http.Client;
  var url='https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';
  Future<List<Product>?> fetchProduct() async {
    var response =  await http.get(url as Uri);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return  null;
    }
  }
}