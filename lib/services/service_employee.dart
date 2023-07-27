part of 'service.dart';

class ServiceEmployee {
  var dio = Dio();
  //
  //
  Future<ResponseEmployee> employeeList() async {
    try {
      var branchId = await Datas().getString(Datas.branchID);
      var departmentID = await Datas().getString(Datas.storeID);
      var api =
          "https://bowindo.servehttp.com/employee/list?branch_id=$branchId&department_id=$departmentID";
      var response = await dio.get(
        api,
        options: await Config().getOptions(),
      );
      return ResponseEmployee.fromJson(response.data);
    } catch (ex) {
      return ResponseEmployee(
        success: false,
        message: "",
        employee: [],
      );
    }
  }
  //
}
