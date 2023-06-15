import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../model/PoliticalNewsModel/PoliticalModel.dart';
import 'Political Controller.dart';
class PoliticalNews extends StatelessWidget {
  PoliticalNews({Key? key}) : super(key: key);
  PoliticalController controller = Get.put(PoliticalController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getNews(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          PoliticalModel data1 = snapshot.data;
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Political News',
                ),
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: [
                ListView.builder(
                    itemCount: data1.articles!.length,
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
                            data1.articles![index].urlToImage!=null?Image.network(
                                '${data1.articles![index].urlToImage}'):SizedBox(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${data1.articles![index].title}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  SizedBox(
                                      width: 350,
                                      height: 70,
                                      child: Text(
                                        '${data1.articles![index].description}',
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
