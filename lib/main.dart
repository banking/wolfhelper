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

    void notifySetState() {
      setState(() {
        //do nothing 为子Widget调用
      });
    }
    return Scaffold(

      appBar: AppBar(
        title: Text("预女猎白-12人"),
      ),
      drawer: HelperDrawer(),
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
//                  widthFactor: 1.7,
//                  heightFactor: 0.02,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
//            mainAxisSize: MainAxisSize.max,
                    children: leftPlayers.map<Widget>((PlayerInfo playerInfo) {
                      return AvatarLayout(playerInfo, notifySetState);
//                      return new Container();
                    }).toList(),
                  ),
                ),
                Align(
                  alignment: const Alignment(1.0, -1.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: rightPlayers.map<Widget>((PlayerInfo playerInfo) {
                      return AvatarLayout(playerInfo, notifySetState);
                    }).toList(),
                  ),
                ),
              ],
            )
        ),
    );
  }
}

class HelperDrawer extends StatelessWidget {
  const HelperDrawer({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Note: for real apps, see the Gallery material Drawer demo. More
      // typically, a drawer would have a fixed header with a scrolling body
      // below it.
      child: ListView(
        key: const PageStorageKey<String>('gallery-drawer'),
        padding: EdgeInsets.zero,
        children: <Widget>[
          FancyDrawerHeader(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('编辑板子'),
          ),
          ListTile(
            leading: const Icon(Icons.brightness_5),
            title: const Text('设置'),
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('关于作者'),
          ),
        ],
      ),
    );
  }
}

class FancyDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      height: 40.0,
      child: const SafeArea(
        bottom: false,
        child: Placeholder(),
      ),
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
