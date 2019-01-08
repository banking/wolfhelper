


import 'package:wolfhelper/role.dart';

class PlayerInfo {

  PlayerInfo({
    this.name = "",
    this.number = -1,
  });
  String name;
  int number;
  List<Role> roles;

}

final List<PlayerInfo> leftPlayers = _buildPlayerInfos();

List<PlayerInfo> _buildPlayerInfos() {
  List<PlayerInfo> playerInfos = <PlayerInfo>[
    PlayerInfo(
    name: 'Shrine',
    number: 1,
    ),
    PlayerInfo(
      name: 'Terrao',
      number: 2,
    ),
    PlayerInfo(
      name: 'Xiancai',
      number: 3,
    ),
    PlayerInfo(
      name: 'Charles',
      number: 4,
    ),
    PlayerInfo(
      name: 'SunnyZhou',
      number: 5,
    ),
    PlayerInfo(
      name: 'FatRaggi',
      number: 6,
    ),
  ];
  return playerInfos;
}

