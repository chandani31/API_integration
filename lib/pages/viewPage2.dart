import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/viewController.dart';


class viewPage2 extends StatefulWidget
{
  final int index1;
  const viewPage2({super.key, required this.index1});

  @override
  State<viewPage2> createState() => _viewPage2State();
}

class _viewPage2State extends State<viewPage2>
{
  final viewController = Get.put(ViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<ViewController>(
        builder: (_) {
          return Column(
            children: [
              SizedBox(height: 120,),
          Container(
            margin: EdgeInsets.only(left: 35, right: 45),
            // height: 400,
            // width: 400,
            // color: Colors.red,
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.brown.withOpacity(0.3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(3,3),
                  ),
                ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network("${viewController.dataList[widget.index1].url}", height: 80, width: 80,)),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  // color: Colors.red,
                    height: 90,
                    width: 150,
                    child: Text("${viewController.dataList[widget.index1].title}", style: TextStyle(fontWeight: FontWeight.bold),)),
                SizedBox(height: 30,),
                Text("ID: ${viewController.dataList[widget.index1].id}" "            " "AlbumID:${viewController.dataList[widget.index1].albumId}", style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
            ],
          );
        }
      ),
    );
  }
}
