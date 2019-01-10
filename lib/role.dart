

class Role {
  Role({
    this.roleId = 1,
    this.rolePic = "",
    this.roleName = "",
  });
  int roleId;
  String rolePic;
  String roleName;
}

List<Role> commonRoleList = <Role>[
  roleVillage,
  roleWolf,
  roleSeer,
  roleWitch,
  roleHunter,
  roleIdiot,
];

Role roleVillage = Role(
  roleId: 1,
  rolePic: "assets/mainmenu_mode_ui_role_1.png",
  roleName: "村民",
);

Role roleWolf = Role(
  roleId: 2,
  rolePic: "assets/mainmenu_mode_ui_role_2.png",
  roleName: "狼人",
);

Role roleSeer = Role(
  roleId: 3,
  rolePic: "assets/mainmenu_mode_ui_role_3.png",
  roleName: "预言家",
);

Role roleGuard = Role(
  roleId: 4,
  rolePic: "assets/mainmenu_mode_ui_role_4.png",
  roleName: "守卫",
);

Role roleWitch = Role(
  roleId: 5,
  rolePic: "assets/mainmenu_mode_ui_role_5.png",
  roleName: "女巫",
);

Role roleHunter = Role(
  roleId: 8,
  rolePic: "assets/mainmenu_mode_ui_role_8.png",
  roleName: "猎人",
);

Role roleIdiot = Role(
  roleId: 9,
  rolePic: "assets/mainmenu_mode_ui_role_9.png",
  roleName: "白痴",
);

Role roleWolfKing = Role(
  roleId: 10,
  rolePic: "assets/mainmenu_mode_ui_role_10.png",
  roleName: "狼王",
);