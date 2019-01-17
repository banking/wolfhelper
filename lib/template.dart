

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wolfhelper/main.dart';

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

  Template selectedTemplate = classic12Template;
  void _handleRadioValueChanged(Template value) {
    setState(() {
      selectedTemplate = value;
//      onTemplateUpdate();
    });
  }

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
                  RadioListTile<Template>(
                    title: const Text("预女猎白"),
                    value: classic12Template,
                    groupValue: selectedTemplate,
                    onChanged: (Template value) { setState(() {  }); },
                  ),
                  RadioListTile<Template>(
                    title: const Text("狼枪守卫"),
                    value: wolfKingGuardTemplate,
                    groupValue: selectedTemplate,
                    onChanged: _handleRadioValueChanged,
                  ),
                  RadioListTile<Template>(
                    title: const Text("狼枪摄梦人"),
                    value: wolfKingDreamerTemplate,
                    groupValue: selectedTemplate,
                    onChanged: (Template value) { setState(() { selectedTemplate = value; }); },
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}

enum TemplateEnum { classic12Template, wolfKingGuardTemplate, wolfKingDreamerTemplate,
  crowHiddenWolfTemplate, classic9Template, whiteWolfKingKnightTemplate }

Template classic12Template = Template(
  name:"预女猎白",
  templateId: 1,
  defaultCount: 12,
  counts: <int>[11,12,13],
);


Template wolfKingGuardTemplate = Template(
  name:"狼枪守卫",
  templateId: 3,
  defaultCount: 12,
  counts: <int>[11,12,13],
);

Template wolfKingDreamerTemplate = Template(
  name:"狼枪摄梦人",
  templateId: 3,
  defaultCount: 12,
  counts: <int>[11,12,13],
);

Template crowHiddenWolfTemplate = Template(
  name:"乌鸦隐狼",
  templateId: 3,
  defaultCount: 12,
  counts: <int>[11,12,13],
);


Template classic9Template = Template(
  name:"预女猎",
  templateId: 11,
  defaultCount: 9,
  counts: <int>[8,9,10],
);

Template whiteWolfKingKnightTemplate = Template(
  name:"白狼骑士",
  templateId: 21,
  defaultCount: 15,
  counts: <int>[14,15,16],
);

class Template {

  Template({
    this.name = "",
    this.templateId = -1,
    this.defaultCount = 12,
//    this.roles = <Role>[],
    this.counts = const <int>[12],
  });

  int templateId;
  String name;
  int defaultCount;
  List<int> counts;

}

