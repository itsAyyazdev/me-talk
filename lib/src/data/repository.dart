// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'network/rest_client_new.dart';

// class Repository {
//   Future<> updateOnBoardStatus(
//       BuildContext context) async {
//     try {
//       ApiResponse apiResponse = await restClientNew.put(
//           context, Api.UPDATE_ON_BOARD_STATUS,
//           body: onBoardStatus.toJson());

//       if (apiResponse.status) {
//         var data = apiResponse.data as Map<String, dynamic>;
//         return OnBoardStatus.fromJson(data);
//       } else {
//         return Future.error(apiResponse.message);
//       }
//     } catch (e) {
//       return Future.error(e.toString());
//     }
//   }
// }
