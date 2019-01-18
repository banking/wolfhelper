

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({ Key key, this.seed }) : super(key: key);

  final int seed;

  @override
  Widget build(BuildContext context) {
    return AboutPage();
  }
}

class AboutPage extends StatefulWidget {
  const AboutPage({ Key key, this.title }) : super(key: key);

  final String title;

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<AboutPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("关于"),
        leading: new IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () { Navigator.pop(context); },
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/main_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child : Container(
              height: 100,
              width: 200,
              child : Column(
                children: <Widget>[
                  Text(
                    '作者：banking.',
                    textDirection: TextDirection.ltr,
                  ),
                  Text(
                    'Written by flutter.',
                    textDirection: TextDirection.ltr,
                  ),
                  Text(
                    '   ',
                    textDirection: TextDirection.ltr,
                  ),
                  Text(
                    '联系我&支付宝赞赏：',
                    textDirection: TextDirection.ltr,
                  ),
                  Text(
                    'banking17173@126.com',
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }


}