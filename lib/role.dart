

class Role {
  Role({
    this.roleId = 1,
    this.rolePic = "",
  });
  int roleId;
  String rolePic;
}

List<Role> commonRoleSet = <Role>[
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
);

Role roleWolf = Role(
  roleId: 2,
  rolePic: "assets/mainmenu_mode_ui_role_2.png",
);

Role roleSeer = Role(
  roleId: 3,
  rolePic: "assets/mainmenu_mode_ui_role_3.png",
);

Role roleGuard = Role(
  roleId: 4,
  rolePic: "assets/mainmenu_mode_ui_role_4.png",
);

Role roleWitch = Role(
  roleId: 5,
  rolePic: "assets/mainmenu_mode_ui_role_5.png",
);

Role roleHunter = Role(
  roleId: 8,
  rolePic: "assets/mainmenu_mode_ui_role_8.png",
);

Role roleIdiot = Role(
  roleId: 9,
  rolePic: "assets/mainmenu_mode_ui_role_9.png",
);

Role roleWolfKing = Role(
  roleId: 10,
  rolePic: "assets/mainmenu_mode_ui_role_10.png",
);