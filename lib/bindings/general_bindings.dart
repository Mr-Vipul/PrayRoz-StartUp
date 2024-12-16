import 'package:get/get.dart';
import '../common/widgets/loaders/network_manager.dart';


class GeneralBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}