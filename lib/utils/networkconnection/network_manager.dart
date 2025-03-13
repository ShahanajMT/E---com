// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:tstore/utils/snakBars/TLoders.dart';

// class NetworkManager extends GetxController {

//   static NetworkManager get inastance => Get.find();

//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;
//   final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

//   //? Initialize net
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnetionStatue as void Function(List<ConnectivityResult> event)?) as StreamSubscription<ConnectivityResult>;
//   }

//   //? up
//   Future<void> _updateConnetionStatue(ConnectivityResult result) async {
//     _connectionStatus.value = result;
//     if (_connectionStatus.value == ConnectivityResult.none) {
//       TLoaders.warningSnackBar(title: 'No Internet Connection');
//     }

    

//   }
//   //? check internet connection status
//   Future<bool> isConnected() async {
//     try {
//       final result = _connectivity.checkConnectivity();
//       if (result == ConnectivityResult.none) {
//         return false;
//       } else {
//         return true;
//       }
//     } on PlatformException catch(_) {
//       return false;
//     }
//   } 

//   //? dispose or close
//   @override
//   void onClose() {
//     // TODO: implement onClose
//     super.onClose();
//     _connectivitySubscription.cancel();
//   }
// }


import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tstore/utils/snakBars/TLoders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  // Initialize Network Listener
  @override
  void onInit() {
    super.onInit();
    //_connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Update connection status
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (result == ConnectivityResult.none) {
      TLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }

  // Check internet connection status
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } on PlatformException {
      return false;
    }
  }

  // Dispose or close
  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
