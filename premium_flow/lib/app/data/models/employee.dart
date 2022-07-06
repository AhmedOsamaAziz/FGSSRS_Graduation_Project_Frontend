// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

import 'dart:convert';

List<Employee> employeeFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  Employee({
    this.empName,
    this.email,
    this.mobile,
    this.nationalId,
  });

  String? empName;
  String? email;
  String? mobile;
  String? nationalId;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        empName: json["emp_name"],
        email: json["email"],
        mobile: json["mobile"],
        nationalId: json["national_id"],
      );

  Map<String, dynamic> toJson() => {
        "emp_name": empName,
        "email": email,
        "mobile": mobile,
        "national_id": nationalId,
      };
}
