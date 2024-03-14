import 'package:api_data_view_1/pages/viewPage2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/viewController.dart';


class viewPage extends StatefulWidget {
  const viewPage({super.key});

  @override
  State<viewPage> createState() => _viewPageState();
}

class _viewPageState extends State<viewPage>
{
  final viewController = Get.put(ViewController());
  bool isOnTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ViewController>(builder: (_){
        return viewController.isLoading? Center(child: CircularProgressIndicator(),):
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Expanded(child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(4),
                    child: ListView.builder(
                      itemCount: viewController.dataList.length,
                        itemBuilder: (context, index){
                          var index1 = viewController.dataList[index];
                          return GestureDetector(

                            onTap: ()
                            {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => viewPage2(index1: index)));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              padding: EdgeInsets.only(left: 15),
                              height: MediaQuery.of(context).size.height*0.09,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: isOnTap ? Colors.blue.withOpacity(0.6) : Colors.brown.withOpacity(0.6),
                                  // border: Border.all(color: Colors.grey, width: 2.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(3,3)
                                  )
                                ]
                              ),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,

                                children: [
                                 Row(
                                   children: [
                                     ClipRRect(
                                       borderRadius: BorderRadius.circular(12),
                                         child: Image.network("${index1.url}", height: 50, width: 50,)),
                                     Expanded(
                                       child: Column(
                                         children: [
                                           Container(
                                             padding: EdgeInsets.only(left: 12, right: 8),
                                             width: 170,
                                             child: Text("${index1.title.toString()}", style: TextStyle(fontWeight: FontWeight.bold,),overflow: TextOverflow.ellipsis,),
                                           ),
                                           SizedBox(height: 12,),
                                           Text("Id: ${index1.id.toString()}" "         " "AlbumID: ${index1.albumId.toString()}", style: TextStyle(fontWeight: FontWeight.bold),),
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                                ],
                              ),
                            ),
                          );
                    }),
                  ))
                ],
              ),
            );
      },),
    );
  }
}
