
import 'package:wolfhelper/player.dart';

class Mark {
  Mark(
    this.markId,
    this.markPicPath,
    this.name,
  );
  int markId;
  String markPicPath;
  String name;
}

class StatusMark extends Mark {
  StatusMark( int roleId, String rolePic, String roleName)
      : super(roleId, rolePic, roleName);
  int markId;
  String markPicPath;
  String name;
}

class NumberMark extends Mark {
  NumberMark( int roleId, String rolePic, String roleName,this.status)
    : super(roleId, rolePic, roleName);
  String status; // +，-
}

List<Mark> commonRoleList = <Mark>[
  roleGood,
  roleGolden,
  roleSilver,
  roleGod,
];

List<Mark> markRoleList = <Mark> [
  rolePlus,
  roleMinus,
];

List<Mark> roleMarkList = _getClassicsRoleMarkList();
List<Mark> numberMarkList = _getNumberMarkList();



List<Mark> _getClassicsRoleMarkList() {
  List<Mark> classicsRoleListParam = <Mark>[
    roleVillage,
    roleWolf,
    roleSeer,
    roleWitch,
    roleHunter,
    roleIdiot,
  ];
  classicsRoleListParam.addAll(commonRoleList);
  return classicsRoleListParam;
}

List<Mark> _getNumberMarkList() {
  List<Mark> numberRoleListParam = <Mark>[];
  numberRoleListParam.addAll(markRoleList);
  numberRoleListParam.addAll(getNumberDescRoleList());
  return numberRoleListParam;
}


void onTemplateUpdate() {

}

void onPlayerCountUpdate() {

}

List<Mark> getNumberDescRoleList() {
  int playerCount = getPlayerCount();
  List<Mark> numberRoles = <Mark>[];
  for (int index = 1; index < playerCount + 1; index += 1) {
    Mark numberDescRole = NumberMark(1000 + index, "", index.toString(), "");
    numberRoles.add(numberDescRole);
  }
  return numberRoles;
}


Mark rolePlus = StatusMark(10001, "", "+");

Mark roleMinus = StatusMark(10002, "", "-",);

Mark roleVillage = new Mark(1, "assets/mainmenu_mode_ui_role_1.png", "村民");

Mark roleWolf = Mark(2, "assets/mainmenu_mode_ui_role_2.png", "狼人");

Mark roleSeer = Mark(3, "assets/mainmenu_mode_ui_role_3.png", "预言家");

Mark roleGuard = Mark(4, "assets/mainmenu_mode_ui_role_4.png","守卫");

Mark roleWitch = Mark(5, "assets/mainmenu_mode_ui_role_5.png","女巫");

Mark roleHunter = Mark(8, "assets/mainmenu_mode_ui_role_8.png", "猎人");

Mark roleIdiot = Mark(9, "assets/mainmenu_mode_ui_role_9.png", "白痴");

Mark roleWolfKing = Mark(10, "assets/mainmenu_mode_ui_role_10.png","狼王");

Mark roleWhiteWolfKing = Mark(12, "assets/mainmenu_mode_ui_role_12.png", "白狼王");

Mark roleKnight = Mark(17, "assets/mainmenu_mode_ui_role_17.png", "骑士");

Mark roleGood = Mark(101, "assets/mainmenu_mode_ui_role_101.png", "好人");

Mark roleGolden = Mark(102, "assets/mainmenu_mode_ui_role_102.png", "金水",);

Mark roleSilver = Mark(103, "assets/mainmenu_mode_ui_role_103.png", "银水");

Mark roleGod = Mark(104, "assets/mainmenu_mode_ui_role_104.png", "神职");