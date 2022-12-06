import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../model/sportsModel/SportsModel.dart';
import 'Sports Contoller.dart';

class SportsPage extends StatelessWidget {
  SportsPage({Key? key}) : super(key: key);
  SportsController controller2 = Get.put(SportsController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller2.getNews2(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          SportsModel data = snapshot.data;
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Sports',
                ),
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: [
                ListView.builder(
                    itemCount: data.articles!.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            data.articles![index].urlToImage!=null?Image.network(
                                '${data.articles![index].urlToImage}'):SizedBox(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${data.articles![index].title}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                   SizedBox(
                                      width: 350,
                                      height: 70,
                                      child: Text(
                                          '${data.articles![index].description}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2
                                      ),),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ]))));
        } else {
          return Center(child: CircularProgressIndicator());
        }
        ;
      },
    );
  }
}
