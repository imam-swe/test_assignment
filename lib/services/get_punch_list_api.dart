// /*
// Company application details controller
// @Author Imam Hasan <imam.m360ict@gmail.com>
// */

// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';


// class HttpBaseClient {
//   var client = http.Client();
//   //!GET Request
//   Future<dynamic> get(String endPoint) async {
//     debugPrint('get url: $baseUrl$endPoint');
//     try{
//       Uri url = Uri.parse(baseUrl + endPoint);
//       var response = await client.get(url).timeout(const Duration(seconds: 30));
//       var status = response.statusCode;
//       if (status == 200) {
//         return response.body;
//       } else {
//         debugPrint('Error from $endPoint: ');
//       }
//     } on TimeoutException catch(e){
//       debugPrint('Timeout Exception: $e');
//       // appWidgets.wrongSnackBar(title: 'Timeout', 'Please try again');
//     } on SocketException catch(e){
//       debugPrint('Socket Exception: $e');
//       // appWidgets.wrongSnackBar(title: 'Connection Failed', 'Check your internet connection');
//     } catch(e){
//       debugPrint('Error from get Data: $e');
//     }
//   }
// }
// class AllNewsController extends GetxController{
//   List<GetAllNewsModel>? getAllNewsModel;
//   var allNewses = [].obs;
//   var isLoading = true.obs;

//    @override
//   void onInit() {
//     getAllNewses();
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     allNewses.value = [];
//     isLoading.value = true;
//     super.onClose();
//   }

//   Future getAllNewses() async{
//     var response = await HttpBaseClient().get('/all-posts').catchError((err) {});
//     if (response == null) return;
//     isLoading(false);
//     getAllNewsModel = getAllNewsModelFromJson(response);
//     return allNewses.value = getAllNewsModel as List;
//   }
// }