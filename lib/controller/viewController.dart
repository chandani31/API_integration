import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../model/viewModel.dart';


class ViewController extends GetxController
{
  bool isLoading = false;
  Dio dio = Dio();
  List<ViewModel> dataList = [];

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void startLoading()
  {
    isLoading = true;
    update();
  }

  void stopLoading()
  {
    isLoading = false;
    update();
  }

  Future<void> getData() async
  {
    try
    {
      startLoading();
      var response = await dio.get("https://jsonplaceholder.typicode.com/photos");
      print(response.data);

      if(response.statusCode == 200)
      {
        stopLoading();
        final List body = response.data;
        debugPrint(body.toString());
        dataList.addAll((body).map((e) => ViewModel.fromJson(e)));
        debugPrint("dataList: $dataList");
      }
      else
        {
          debugPrint(response.statusCode.toString());
        }
    }
    catch(e)
    {
      debugPrint(e.toString());
    }
  }
}