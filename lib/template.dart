

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage({ Key key, this.seed }) : super(key: key);

  final int seed;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemplateView(title: 'Flutter Demo Home Page'),
    );
  }
}



class TemplateView extends StatefulWidget {
  const TemplateView({ Key key, this.title }) : super(key: key);

  final String title;

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<TemplateView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  TemplateEnum selectedTemplate = TemplateEnum.classic12Template;

//  void handleRadioValueChanged(int value) {
//    setState(() {
//      radioValue = value;
//    });
//  }

//  enum SingingCharacter { lafayette, jefferson }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/main_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child : Container(
              height: 300,
              width: 200,
              child : Column(
                children: <Widget>[
                  Text(
                    '选择板子：',
                    textDirection: TextDirection.ltr,
                  ),
                  RadioListTile<TemplateEnum>(
                    title: const Text("预女猎白"),
                    value: TemplateEnum.classic12Template,
                    groupValue: selectedTemplate,
                    onChanged: (TemplateEnum value) { setState(() { selectedTemplate = value; }); },
                  ),
                  RadioListTile<TemplateEnum>(
                    title: const Text('预女猎'),
                    value: TemplateEnum.classic9Template,
                    groupValue: selectedTemplate,
                    onChanged: (TemplateEnum value) { setState(() { selectedTemplate = value; }); },
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}

enum TemplateEnum { classic12Template, classic9Template }

Template classic12Template = Template(
  name:"预女猎白",
  templateId: 1,
  count: 12,
);

Template classic9Template = Template(
  name:"预女猎",
  templateId: 1,
  count: 9,
);

class Template {

  Template({
    this.name = "",
    this.templateId = -1,
    this.count = 12,
//    this.roles = <Role>[],
  });

  int templateId;
  String name;
  int count;
}

