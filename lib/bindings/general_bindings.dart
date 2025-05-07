import 'package:get/get.dart';
import 'package:shop_app/utills/network/network_manager.dart';

class GeneralBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}