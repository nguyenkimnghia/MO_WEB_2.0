import 'package:intl/intl.dart';

class EmployeeModel {
  EmployeeModel(
      {required this.staffId,
      required this.fullName,
      required this.lastName,
      required this.fullNameUnsign,
      required this.lastNameUnsign,
      required this.mobile,
      required this.loginName,
      required this.email,
      required this.position,
      required this.positionUnsign,
      required this.groupId,
      required this.groupPath,
      required this.groupName,
      required this.groupNameUnsign,
      required this.empLevel,
      required this.sex,
      this.timeSaveInLocal,
      this.isInProcess});

  int staffId;
  String fullName;
  String lastName;
  String fullNameUnsign;
  String lastNameUnsign;
  String mobile;
  String loginName;
  String email;
  String position;
  String positionUnsign;
  int groupId;
  String groupPath;
  String groupName;
  String groupNameUnsign;
  int empLevel;
  int sex;
  DateTime? timeSaveInLocal;
  bool? isInProcess;

  /// sex => 1: male, 2: female
  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
      staffId: json["staffId"] ?? 0,
      fullName: json["fullName"] ?? "",
      lastName: json["lastName"] ?? "",
      fullNameUnsign: json["fullNameUnsign"] ?? "",
      lastNameUnsign: json["lastNameUnsign"] ?? "",
      mobile: json["mobile"] ?? "",
      loginName: json["loginName"] ?? "",
      email: json["email"] ?? "",
      position: json["position"] ?? "",
      positionUnsign: json["positionUnsign"] ?? "",
      groupId: json["groupId"] ?? 0,
      groupPath: json["groupPath"] ?? "",
      groupName: json["groupName"] ?? "",
      groupNameUnsign: json["groupNameUnsign"] ?? "",
      empLevel: json["emp_level"] ?? 0,
      sex: json["sex"] ?? 0,
      timeSaveInLocal: json["timeSaveInLocal"] != null ?  DateFormat("yyyy-MM-dd hh:mm:ss").parse(json["timeSaveInLocal"]) : null
  );

  Map<String, dynamic> toJson() => {
        "staffId": staffId,
        "fullName": fullName,
        "lastName": lastName,
        "fullNameUnsign": fullNameUnsign,
        "lastNameUnsign": lastNameUnsign,
        "mobile": mobile,
        "loginName": loginName,
        "email": email,
        "position": position,
        "positionUnsign": positionUnsign,
        "groupId": groupId,
        "groupPath": groupPath,
        "groupName": groupName,
        "groupNameUnsign": groupNameUnsign,
        "emp_level": empLevel,
        "sex": sex,
        "timeSaveInLocal": timeSaveInLocal != null ? DateFormat("yyyy-MM-dd hh:mm:ss").format(timeSaveInLocal!) : ""
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is EmployeeModel
        && other.staffId == staffId
        && other.fullName == fullName
        && other.lastName == lastName
        && other.fullNameUnsign == fullNameUnsign
        && other.lastNameUnsign == lastNameUnsign
        && other.mobile == mobile
        && other.loginName == loginName
        && other.email == email
        && other.position == position
        && other.positionUnsign == position
        && other.groupId == groupId
        && other.groupPath == groupPath
        && other.groupName == groupName
        && other.groupNameUnsign == groupNameUnsign
        && other.empLevel == empLevel
        && other.sex == sex
        && other.timeSaveInLocal == timeSaveInLocal
    ;
  }

  @override
  int get hashCode => Object.hash(
  staffId,
  fullName,
  lastName,
  fullNameUnsign,
  lastNameUnsign,
  mobile,
  loginName,
  email,
  position,
  position,
  groupId,
  groupPath,
  groupName,
  groupNameUnsign,
  empLevel,
  sex,
  timeSaveInLocal
  );
}

class ResultSearchEmployeeModel {
  ResultSearchEmployeeModel({required this.total, required this.listEmp});

  int total;
  List<EmployeeModel> listEmp;

  factory ResultSearchEmployeeModel.fromJson(Map<String, dynamic> json) =>
      ResultSearchEmployeeModel(
          total: json["total"],
          listEmp: List<EmployeeModel>.from((json["listEmp"] ?? [])
              .map((item) => EmployeeModel.fromJson(item))));

  Map<String, dynamic> toJson() => {"total": total, "listEmp": listEmp};
}
