import 'package:flutter/material.dart';
import 'package:wolfhelper/avatar_layout.dart';
import 'package:wolfhelper/chip.dart';
import 'package:wolfhelper/player.dart';
import 'package:wolfhelper/role.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("测试"),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/main_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Flow(
          delegate: OpacityFlowDelegate(1.0),
            children: <Widget>[
              Align(
                alignment: const Alignment(-0.9, -1.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
//            mainAxisSize: MainAxisSize.max,
                  children: leftPlayers.map<Widget>((PlayerInfo playerInfo) {
                    return AvatarLayout(playerInfo);
                  }).toList(),
                ),
              ),
              Align(
                alignment: const Alignment(1.0, -1.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: rightPlayers.map<Widget>((PlayerInfo playerInfo) {
                    return Stack(
                      children: <Widget>[

                        Image.asset(
                          'assets/default_avatar.png',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                        new Positioned(
                          left: 3.0,
                          top: 25.0,
                          child: Text(
                            playerInfo.name.toString(),
                            style: theme.textTheme.caption,
                          ),
                        ),
                        SizedBox(
                          width: 70.0,
                          height: 70.0,
                        ),
                        new Positioned(
                          left: 0.0,
                          top: 0.0,
                          child: AvatarLayout(playerInfo),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
        )
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Setting',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class OpacityFlowDelegate extends FlowDelegate {
  OpacityFlowDelegate(this.opacity);

  double opacity;

  @override
  void paintChildren(FlowPaintingContext context) {
  for (int i = 0; i < context.childCount; ++i) {
  context.paintChild(i, opacity: opacity);
  }
  }

  @override
  bool shouldRepaint(OpacityFlowDelegate oldDelegate) => opacity != oldDelegate.opacity;
}
