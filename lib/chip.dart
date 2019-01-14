
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wolfhelper/mark.dart';

List<Mark> _selectedRoles;
List<Mark> _roleMarks;
List<Mark> _numberMarks;

class RoleChipSelector extends StatefulWidget {
  Function() notifyParentSetState;
  RoleChipSelector(List<Mark> selectedRoles, List<Mark> roleMarks, List<Mark> numberMarks,Function notifyFunc) {
    _selectedRoles = selectedRoles;
    _roleMarks = roleMarks;
    _numberMarks = numberMarks;
    notifyParentSetState = notifyFunc;
  }

  @override
  _RoleChipSelectorState createState() => _RoleChipSelectorState();
}


class _ChipsTile extends StatelessWidget {
  const _ChipsTile({
    Key key,
    this.label,
    this.children,
  }) : super(key: key);

  final String label;
  final List<Widget> children;

  // Wraps a list of chips into a ListTile for display as a section in the demo.
  @override
  Widget build(BuildContext context) {
    final List<Widget> cardChildren = <Widget>[
      Container(
        padding: const EdgeInsets.only(top: 16.0, bottom: 4.0),
        alignment: Alignment.center,
        child: Text(label, textAlign: TextAlign.start),
      ),
    ];
    if (children.isNotEmpty) {
      cardChildren.add(Wrap(
          children: children.map<Widget>((Widget chip) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: chip,
            );
          }).toList()));
    } else {
      final TextStyle textStyle = Theme.of(context).textTheme.caption.copyWith(fontStyle: FontStyle.italic);
      cardChildren.add(
          Semantics(
            container: true,
            child: Container(
              alignment: Alignment.center,
              constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
              padding: const EdgeInsets.all(8.0),
              child: Text('None', style: textStyle),
            ),
          ));
    }

    return Card(
        semanticContainer: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: cardChildren,
        )
    );
  }
}



class _RoleChipSelectorState extends State<RoleChipSelector> {
  _RoleChipSelectorState() {
    _reset();
  }

  String _markMaterial = '';

  // Initialize members with the default data.
  void _reset() {
    _markMaterial = '';
  }

  void _removeRoles(Mark role) {
    _selectedRoles.remove(role);
    if (_markMaterial == role.name) {
      _markMaterial = '';
    }
  }
  
  void _addRoles(Mark role) {
    if(!_selectedRoles.contains(role)) {
      _selectedRoles.add(role);
    }
  }

  String _capitalize(String name) {
    assert(name != null && name.isNotEmpty);
    return name.substring(0, 1).toUpperCase() + name.substring(1);
  }

  // This converts a String to a unique color, based on the hash value of the
  // String object.  It takes the bottom 16 bits of the hash, and uses that to
  // pick a hue for an HSV color, and then creates the color (with a preset
  // saturation and value).  This means that any unique strings will also have
  // unique colors, but they'll all be readable, since they have the same
  // saturation and value.
  Color _nameToColor(String name) {
//    assert(name.length > 1);
    final int hash = name.hashCode & 0xffff;
    final double hue = (360.0 * hash / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> selectedChips = _selectedRoles.map<Widget>((Mark role) {
      String name = role.name;
      if (role is NumberMark) {
        name = role.status.toString() + role.name;
      }
      return Chip(
        key: ValueKey<String>(name),
        backgroundColor: _nameToColor(name),
        label: Text(_capitalize(name)),
        onDeleted: () {
          widget.notifyParentSetState();
          setState(() {
            _removeRoles(role);
          });
        },
      );
    }).toList();

    final List<Widget> allRoleChips = _roleMarks.map<Widget>((Mark role) {
      return ChoiceChip(
        key: ValueKey<String>(role.name),
        backgroundColor: _nameToColor(role.name),
        label: Text(_capitalize(role.name)),
        selected: _markMaterial == role.name,
        onSelected: (bool value) {
          widget.notifyParentSetState();
          setState(() {
//            _markMaterial = value ? role.name : '';
            _addRoles(role);
          });
        },
      );
    }).toList();

    final List<Widget> numberChips = _numberMarks.map<Widget>((Mark role) {
      return ChoiceChip(
        key: ValueKey<String>(role.name),
        backgroundColor: _nameToColor(role.name),
        label: Text(_capitalize(role.name)),
        selected: _markMaterial == role.name,
        onSelected: (bool value) {
          widget.notifyParentSetState();
          setState(() {
            if (role is StatusMark) {
              _markMaterial = value ? role.name : '';
            }
            if (role is NumberMark) {
              if (_markMaterial != "") {
                role.status = _markMaterial;
              }
              _addRoles(role);
            }

          });
        },
      );
    }).toList();

    final ThemeData theme = Theme.of(context);
    final List<Widget> tiles = <Widget>[
      const SizedBox(height: 8.0, width: 0.0),
      _ChipsTile(label: '已标注', children: selectedChips),
      _ChipsTile(label: '身份标注', children: allRoleChips),
      _ChipsTile(label: '人物关系', children: numberChips),
      const Divider(),
    ];

    return Scaffold(
      body: ChipTheme(
        data: theme.chipTheme,
        child: ListView(children: tiles),
      ),
    );
  }
}
