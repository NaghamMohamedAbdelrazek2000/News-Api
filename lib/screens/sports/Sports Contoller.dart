import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/sportsModel/SportsModel.dart';
class SportsController extends GetxController{
  getNews2()async{
   final response2= await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=de&category=sports&apiKey=f88b61c8dbc9432a85d728475f2e158d'));
  if(response2.statusCode==200){
    print(response2.body);
    return   SportsModel.fromJson(jsonDecode(response2.body));
  }
  }
}
