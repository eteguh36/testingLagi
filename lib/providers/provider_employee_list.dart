part of 'providers.dart';

class ProviderEmployeeList with ChangeNotifier {
  //
  var datas = ResponseEmployee(
    success: false,
    message: "",
    employee: [],
  );
  var loading = true;

  //
  loadData() async {
    print("PRINT HERE");
    print("GET DATA");
    datas = await ServiceEmployee().employeeList();
    loading = false;
    notifyListeners();
  }
  //
}
