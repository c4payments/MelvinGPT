import 'package:melvingpt/config.dart';

class NotificationController extends GetxController {
  List notificationLists = [];

  @override
  void onReady() {
    notificationLists = appArray.notificationList;
    update();
    // TODO: implement onReady
    super.onReady();
  }
}