import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../model/ScienceModel/Science.dart';
class ScienceController extends GetxController{
  getNews1()async{
    final response1= await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=de&category=science&apiKey=f88b61c8dbc9432a85d728475f2e158d'));
    if(response1.statusCode==200){
      print(response1.body);
      return Science.fromJson(jsonDecode(response1.body));
    }
  }
}