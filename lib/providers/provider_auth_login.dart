part of 'providers.dart';

class ProviderAuthLogin with ChangeNotifier {
  //

  var user = TextEditingController();
  var password = TextEditingController();
  var isLoading = false;
  var errorMsg = "";

  login(BuildContext context) async {
    if (isLoading) {
      return;
    }
    if (user.text == "") {
      errorMsg = "Mohon masukkan Username";
      notifyListeners();
      return;
    } else if (password.text == "") {
      errorMsg = "Mohon masukkan Password";
      notifyListeners();
      return;
    }

    isLoading = true;
    notifyListeners();
    print("LOGIN_ 1");
    var results = await ServiceAuth().login(
      username: user.text,
      password: password.text,
    );
    if (results.success) {
      await Datas().setString(Datas.token, results.token);
      await Datas().setString(Datas.branchID, results.auth!.branch_id);
      await Datas().setString(Datas.storeID, results.auth!.store_id.toString());
      Navigator.push(
        context,
        MyRoute(
          builder: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => ProviderEmployeeList(),
            builder: (context, child) => const PageEmployeeList(),
          ),
        ),
      );
    } else {
      errorMsg = results.message;
    }
    isLoading = false;
    notifyListeners();
  }
}
