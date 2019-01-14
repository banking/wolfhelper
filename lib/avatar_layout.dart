import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wolfhelper/chip.dart';
import 'package:wolfhelper/player.dart';
import 'package:wolfhelper/mark.dart';

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
//    final avatarUrl = 'assets/Avatar_' + playerInfo
    List<Widget> widgets = <Widget>[
      SizedBox(
        width: 40.0,
        height: 80.0,
      ),
      new Positioned(
        left: 5.0,
        top: 5.0,
        child: Container(
          width: 60.0,
          height: 60.0,
//          alignment: Alignment.center,
          decoration: new BoxDecoration(
//              border: new Border.all(width: 1.0, color: Colors.black),
//            color: Colors.grey,
            borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
            image: new DecorationImage(
              image: new ExactAssetImage('assets/Avatar_' + playerInfo.number.toString() + ".png"), //)
//              centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
            ),
          ),
        ),
      ),
      Container(
        width: 70.0,
        height: 70.0,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/head_border_1.png'), //)
          ),
        ),
      ),
      Container(
        width: 70.0,
        height: 80.0,
        alignment: Alignment.bottomCenter,
        child: Text(
            playerInfo.number.toString(),
            style: Theme.of(context).textTheme.caption.copyWith(
              fontSize: 26.0,
              color: Colors.white,
            )
        ),
      ),
      new Positioned(
        left: 0.0,
        top: 0.0,
        child: Stack(
          children: playerInfo.roles.map<Widget>((Mark role){
            if (playerInfo.roles.indexOf(role) == 0) {
              return Stack(
                children: <Widget>[
                  SizedBox(
                    width: 70.0,
                    height: 80.0,
                  ),
                  new Positioned(
                    left: 0.0,
                    top: -3.0,
                    child: Image.asset(
                      role.markPicPath,
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
                    width: 70.0,
                    height: 80.0,
                  ),
                  new Positioned(
                    right: 0,
                    top: -3.0,
                    child: Image.asset(
                      role.markPicPath,
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
          child: Container(
            width: 30.0,
            height: 70.0,
          ),
          onPressed: () {
            showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
              return new GestureDetector(onTap: () {
                setState(() {
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: RoleChipSelector(playerInfo.roles, roleMarkList, numberMarkList, notifyParentSetState),
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