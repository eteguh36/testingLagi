part of 'shared.dart';

class Datas {
  static const token = 'token';
  static const branchID = 'branch_id';
  static const storeID = 'store_id';

  setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) == null) {
      return '';
    } else {
      return prefs.getString(key) ?? "";
    }
  }
}
