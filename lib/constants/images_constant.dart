class ImagesNameConst {
  ImagesNameConst._();

  // ========================IMAGE===========================
  static const String logo = "logo_mb.png";
  static const String error = "error.png";
  static const String loginBg = "login_bg.png";


  // ========================ICON===========================
  static const String icVn = "ic_vn.png";
  static const String icEng = "ic_eng.png";

  // ========================SVG===========================
  // Home page
  static const String icAdmin = "ic_admin.svg";
  static const String icCalendar = "ic_calendar.svg";
  static const String icDashboard = "ic_dashboard.svg";
  static const String icDocument = "ic_document.svg";
  static const String icHome = "ic_home.svg";
  static const String icMission = "ic_mission.svg";
  static const String icProfile = "ic_profile.svg";
  static const String icSign = "ic_sign.svg";
  static const String logoMB = "logo_mb.svg";
  static const String icSearch = "ic_search.svg";
  static const String icPosition = "ic_position.svg";
  static const String icGroup = "ic_group.svg";
  static const String icUserMale = "ic_user_male.svg";
  static const String icUserFemale = "ic_user_female.svg";
  static const String missionChart = "mission_chart.svg";
  static const String missionStatus = "mission_status.svg";
  static const String missionExpire = "mission_expire.png";


  static getImage(String name) {
    return "assets/images/$name";
  }

  static getIcon(String name) {
    return "assets/icons/$name";
  }

  static getSVG(String name) {
    return "assets/svg/$name";
  }
}

