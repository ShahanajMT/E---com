import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tstore/utils/snakBars/TLoders.dart';

class NetworkManager extends GetxController {

  static NetworkManager get inastance => Get.find();

  final Connectivity _connectivity = Connectivity();
  // late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

   //? Initialize network
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  //? up
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      TLoaders.customToast(message: 'No Internet Connection');
    }

    

  }
  //? check internet connection status
  Future<bool> isConnected() async {
    try {
      final result = _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch(_) {
      return false;
    }
  } 

  //? dispose or close
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _connectivitySubscription.cancel();
  }
}

