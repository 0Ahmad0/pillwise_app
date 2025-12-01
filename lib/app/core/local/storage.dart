
import 'package:get_storage/get_storage.dart';
import 'package:pillwise_app/app/core/models/user_model.dart';

import '../constants/app_constants.dart';

class AppStorage {
  static GetStorage _storage = GetStorage();

  static init() async {
    if (!_storage.hasData(AppConstants.rememberMe)) {
      storageWrite(key: AppConstants.rememberMe, value: false);
    } else {
      // AdvanceModel.rememberMe = await storageRead(key: AppConstants.rememberMe);
    }
    if (!_storage.hasData(AppConstants.idKEY)) {
      storageWrite(key: AppConstants.idKEY, value: "");
    } else {
      // AdvanceModel.token = await storageRead(key: AppConstants.idKEY);
    }

    if (!_storage.hasData(AppConstants.uidKEY)) {
      storageWrite(key: AppConstants.uidKEY, value: "");
    } else {
      // AdvanceModel.uid = await storageRead(key: AppConstants.uidKEY);
    }
    if (!_storage.hasData(AppConstants.tokenKEY)) {
      storageWrite(key: AppConstants.tokenKEY, value: "");
    } else {
      // AdvanceModel.token = await storageRead(key: AppConstants.tokenKEY);
    }
    if (!_storage.hasData(AppConstants.NOTIFICATION_ENABLED)) {
      storageWrite(key: AppConstants.NOTIFICATION_ENABLED, value: true);
    }
  }

  static Future<void> storageWrite({key, value}) async =>
      await _storage.write(key, value);

  static Future<dynamic> storageRead({key}) async =>
      await _storage.read(key);

  static UserModel? getUserStorage()  =>
      _storage.read(AppConstants.User);

  static Future<void> storageDelete({key}) async => await _storage
      .remove(key)
      .then((value) => print("delete key successful"));

  static depose() async {
    await _storage.remove(AppConstants.idKEY);
    await _storage.remove(AppConstants.uidKEY);
    await _storage.remove(AppConstants.tokenKEY);
    await _storage.remove(AppConstants.USER_NAME_KEY);
    await _storage.remove(AppConstants.PASSWORD_KEY);
    await _storage.remove(AppConstants.USER_NAME_KEY);
    await _storage.remove(AppConstants.User);
    await _storage.write(AppConstants.rememberMe, false);
  }
}
