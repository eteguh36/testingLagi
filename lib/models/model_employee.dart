part of 'model.dart';

class ResponseEmployee {
  bool success;
  List<Employee> employee;
  String message;

  ResponseEmployee({
    required this.success,
    required this.employee,
    required this.message,
  });

  factory ResponseEmployee.fromJson(Map<String, dynamic> json) =>
      ResponseEmployee(
        success: json["success"],
        employee: json["data"] == null
            ? []
            : List<Employee>.from(
                json["data"].map((x) => Employee.fromJson(x))),
        message: json["message"],
      );
}

class Employee {
  int employeeId;
  String employeeName;
  String employeeAddress;
  DateTime employeeDob;
  String employeeMail;
  int departmentId;
  int flagEmployee;
  String branchId;
  String branchName;
  String departmentName;

  Employee({
    required this.employeeId,
    required this.employeeName,
    required this.employeeAddress,
    required this.employeeDob,
    required this.employeeMail,
    required this.departmentId,
    required this.flagEmployee,
    required this.branchId,
    required this.branchName,
    required this.departmentName,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        employeeId: json["employee_id"],
        employeeName: json["employee_name"],
        employeeAddress: json["employee_address"],
        employeeDob: DateTime.parse(json["employee_dob"]),
        employeeMail: json["employee_mail"],
        departmentId: json["department_id"],
        flagEmployee: json["flag_employee"],
        branchId: json["branch_id"],
        branchName: json["branch_name"],
        departmentName: json["department_name"],
      );
}
