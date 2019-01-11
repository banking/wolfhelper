import 'package:wolfhelper/role.dart';

class PlayerInfo {

  PlayerInfo({
    this.name = "",
    this.number = -1,
//    this.roles = <Role>[],
  });
  String name;
  int number;
  List<Role> roles = <Role>[];
}

final List<PlayerInfo> leftPlayers = _buildLeftPlayerInfos();
final List<PlayerInfo> rightPlayers = _buildRightPlayerInfos();

List<PlayerInfo> _buildLeftPlayerInfos() {
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
  playerInfos[0].roles.add(roleVillage);
  playerInfos[0].roles.add(roleWolf);
  playerInfos[2].roles.add(roleWitch);
  return playerInfos;
}

List<PlayerInfo> _buildRightPlayerInfos() {
  List<PlayerInfo> rightPlayerInfos = <PlayerInfo>[
    PlayerInfo(
      name: 'Squeeze',
      number: 7,
    ),
    PlayerInfo(
      name: 'WaterMelon',
      number: 8,
    ),
    PlayerInfo(
      name: 'dandelion',
      number: 9,
    ),
    PlayerInfo(
      name: 'Coffee',
      number: 10,
    ),
    PlayerInfo(
      name: 'tsugawa',
      number: 11,
    ),
    PlayerInfo(
      name: 'Ammie',
      number: 12,
    ),
  ];
  rightPlayerInfos[1].roles.add(roleVillage);
  rightPlayerInfos[3].roles.add(roleHunter);
  return rightPlayerInfos;
}

