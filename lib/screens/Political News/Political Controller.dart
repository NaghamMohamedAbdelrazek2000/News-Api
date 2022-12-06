import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../model/PoliticalNewsModel/PoliticalModel.dart';
class PoliticalController extends GetxController{
  getNews()async{
    final response= await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=f88b61c8dbc9432a85d728475f2e158d'));
    if(response.statusCode==200){
      print(response.body);
      return   PoliticalModel.fromJson(jsonDecode(response.body));
    }
  }
}