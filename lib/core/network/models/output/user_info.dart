import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    required this.employeeId,
    required this.organizationId,
    required this.organizationName,
    required this.organizationPathName,
    required this.username,
    required this.employeeCode,
    required this.positionId,
    required this.positionName,
    required this.mobilePhone,
    required this.email,
    required this.fullName,
    required this.gender,
    required this.dateOfBirth,
    required this.userRoles,
    required this.remoteCaCertSerial,
    required this.caSimPhoneNumber,
    required this.caSerial,
    required this.placeOfBirth,
  });

  int employeeId;
  int organizationId;
  String? organizationName;
  String? organizationPathName;
  String username;
  String employeeCode;
  int positionId;
  String positionName;
  String mobilePhone;
  String email;
  String fullName;
  int gender; // 1 -> Nam; 2 -> Nữ
  String? dateOfBirth;
  List<UserRole> userRoles;
  String remoteCaCertSerial;
  String caSimPhoneNumber;
  String caSerial;
  String placeOfBirth;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    employeeId: json["employeeId"] ?? -1,
    organizationId: json["organizationId"] ?? -1,
    organizationName : json['organizationName'] ?? "",
    organizationPathName : json['organizationPathName'] ?? "",
    username: json["username"] ?? "",
    employeeCode: json["employeeCode"] ?? "",
    positionId: json["positionId"] ?? -1,
    positionName: json["positionName"] ?? "",
    mobilePhone: json["mobilePhone"] ?? "",
    email: json["email"] ?? "",
    fullName: json["fullName"] ?? "",
    gender: json["gender"] ?? 1,
    dateOfBirth: json["dateOfBirth"] ?? "",
    userRoles: json["userRoles"] == null ? [] : List<UserRole>.from(json["userRoles"].map((x) => UserRole.fromJson(x))),
    remoteCaCertSerial: json["remoteCaCertSerial"] ?? "",
    caSimPhoneNumber: json["caSimPhoneNumber"] ?? "",
    caSerial: json["caSerial"] ?? "",
    placeOfBirth: json["placeOfBirth"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "employeeId": employeeId,
    "organizationId": organizationId,
    "organizationName": organizationName,
    "organizationPathName": organizationPathName,
    "username": username,
    "employeeCode": employeeCode,
    "positionId": positionId,
    "positionName": positionName,
    "mobilePhone": mobilePhone,
    "email": email,
    "fullName": fullName,
    "gender": gender,
    "dateOfBirth": dateOfBirth,
    "userRoles": List<dynamic>.from(userRoles.map((x) => x.toJson())),
    "remoteCaCertSerial": remoteCaCertSerial,
    "caSimPhoneNumber": caSimPhoneNumber,
    "caSerial": caSerial,
    "placeOfBirth": placeOfBirth,
  };
}

class UserRole {
  UserRole({
    required this.userRoleId,
    required this.sysRole,
    required this.sysRoleId,
    required this.sysUserId,
    required this.sysOrganizationId,
    required this.position,
    required this.isDefault,
    required this.sysOrganization
  });

  int userRoleId;
  SysOrganization? sysOrganization;
  SysRole sysRole;
  int sysRoleId;
  int sysUserId;
  int sysOrganizationId;
  String position;
  bool isDefault;

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
      userRoleId: json["userRoleId"] ?? -1,
      sysRole: SysRole.fromJson(json["sysRole"]),
      sysRoleId: json["sysRoleId"] ?? -1,
      sysUserId: json["sysUserId"] ?? -1,
      sysOrganizationId: json["sysOrganizationId"] ?? -1,
      position: json["position"] ?? "",
      isDefault: json["isDefault"] ?? false,
      sysOrganization: SysOrganization.fromJson(json['sysOrganization']));

  Map<String, dynamic> toJson() => {
    "userRoleId": userRoleId,
    "sysRole": sysRole.toJson(),
    "sysRoleId": sysRoleId,
    "sysUserId": sysUserId,
    "sysOrganizationId": sysOrganizationId,
    "position": position,
    "isDefault": isDefault,
    'sysOrganization': sysOrganization
  };
}

class SysRole {
  SysRole({
    required this.sysRoleId,
    required this.code,
    required this.name,
    required this.delFlag,
    required this.description,
    required this.roleLevel,
  });

  int sysRoleId;
  String code;
  String name;
  int delFlag;
  String description;
  int roleLevel;

  factory SysRole.fromJson(Map<String, dynamic> json) => SysRole(
    sysRoleId: json["sysRoleId"] ?? -1,
    code: json["code"] ?? "",
    name: json["name"] ?? "",
    delFlag: json["delFlag"] ?? -1,
    description: json["description"] ?? "",
    roleLevel: json["roleLevel"] ?? -1,
  );

  Map<String, dynamic> toJson() => {
    "sysRoleId": sysRoleId,
    "code": code,
    "name": name,
    "delFlag": delFlag,
    "description": description,
    "roleLevel": roleLevel,
  };
}

class SysOrganization {
  SysOrganization({
    required this.sysOrganizationId,
    required this.code,
    required this.path,
    required this.orgParentId,
    required this.orgLevel,
    required this.name,
    required this.pathName,
  });

  int sysOrganizationId;
  String code;
  String path;
  int orgParentId;
  int orgLevel;
  String name;
  String pathName;

  factory SysOrganization.fromJson(Map<String, dynamic> json) => SysOrganization(
    sysOrganizationId: json["sysOrganizationId"] ?? -1,
    code: json["code"] ?? '',
    path: json["path"] ?? '',
    orgParentId: json["orgParentId"] ?? '',
    orgLevel: json["orgLevel"] ?? -1,
    name: json["name"] ?? '',
    pathName: json["pathName"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "sysOrganizationId": sysOrganizationId,
    "code": code,
    "path": path,
    "orgParentId": orgParentId,
    "orgLevel": orgLevel,
    "name": name,
    "pathName": pathName,
  };
}