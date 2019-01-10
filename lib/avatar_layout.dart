import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wolfhelper/chip.dart';
import 'package:wolfhelper/player.dart';
import 'package:wolfhelper/role.dart';

class AvatarLayout extends StatefulWidget {

  PlayerInfo _playerInfo;
  Function() notifyParentSetState;
  AvatarLayout(PlayerInfo playerInfo, Function notifyFunc) {
    this._playerInfo = playerInfo;
    this.notifyParentSetState = notifyFunc;
  }

  @override
  _AvatarLayoutState createState() => _AvatarLayoutState(_playerInfo, notifyParentSetState);


}

class _AvatarLayoutState extends State<AvatarLayout> {

  PlayerInfo playerInfo;
  Function() notifyParentSetState;

  _AvatarLayoutState(PlayerInfo playerInfo, Function notifyFunc) {
    this.playerInfo = playerInfo;
    this.notifyParentSetState = notifyFunc;
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[
        Image.asset(
          'assets/default_avatar.png',
          width: 40.0,
          height: 40.0,
          fit: BoxFit.contain,
        ),
        new Positioned(
          left: 0.0,
          top: 25.0,
          child: Text(
            playerInfo.name.toString(),
//            style: theme.textTheme.caption,
          ),
        ),
        SizedBox(
          width: 70.0,
          height: 70.0,
        ),
        new Positioned(
          left: 0.0,
          top: 0.0,
          child: Stack(
            children: playerInfo.roles.map<Widget>((Role role){
              if (playerInfo.roles.indexOf(role) == 0) {
                return Stack(
                  children: <Widget>[
                    SizedBox(
                      width: 70.0,
                      height: 70.0,
                    ),
                    new Positioned(
                      left: -3.0,
                      top: -3.0,
                      child: Image.asset(
                        role.rolePic,
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                );
              }
              if (playerInfo.roles.indexOf(role) == 1) {
                return Stack(
                  children: <Widget>[
                    SizedBox(
                      width: 40.0,
                      height: 70.0,
                    ),
                    new Positioned(
                      right: -3.0,
                      top: -3.0,
                      child: Image.asset(
                        role.rolePic,
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                );
              }
              return Stack(
              );
             }).toList(),
            ),
          ),
          FlatButton(
            child: SizedBox(
              width: 40.0,
              height: 40.0,
            ),
            onPressed: () {
              showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
              return new GestureDetector(onTap: () {
                  setState(() {

                  });
                },
                  child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: RoleChipSelector(playerInfo.roles, commonRoleList, notifyParentSetState),
                  )
              );
              });
            },
        ),
      ];

    return Stack(
      children: widgets,
    );
  }

}