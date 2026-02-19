import 'package:permission_handler/permission_handler.dart';

class PermissionsServices {
  Future<bool> requestStoragePermission() async {
    final status = await Permission.storage.status;
    if (status.isGranted) {
      return true;
    }
    final result = await Permission.storage.request();
    if (result.isGranted) {
      return true;
    }
    if (result.isDenied) {
      await openAppSettings();
      return false;
    }
    if (result.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }
    return false;
  }
}
