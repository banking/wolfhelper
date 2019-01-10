
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<String> _selectedMaterials = <String>[
  'poker',
  'fish and',
];

const List<String> _allMaterials = <String>[
  'poker',
  'tortilla',
  'fish and',
  'micro',
  'wood',
];

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

class ChipDemo extends StatefulWidget {
  static const String routeName = '/material/chip';

  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  _ChipDemoState() {
    _reset();
  }

  final Set<String> _materials = Set<String>();
  final Set<String> _allmaterials = Set<String>();
  String _selectedMaterial = '';

  // Initialize members with the default data.
  void _reset() {
    _materials.clear();
    _materials.addAll(_selectedMaterials);
    _allmaterials.addAll(_allMaterials);
    _selectedMaterial = '';
  }

  void _removeMaterial(String name) {
    _materials.remove(name);
    if (_selectedMaterial == name) {
      _selectedMaterial = '';
    }
  }
  
  void _addMaterial(String name) {
    if(!_materials.contains(name)) {
      _materials.add(name);
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
    assert(name.length > 1);
    final int hash = name.hashCode & 0xffff;
    final double hue = (360.0 * hash / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> chips = _materials.map<Widget>((String name) {
      return Chip(
        key: ValueKey<String>(name),
        backgroundColor: _nameToColor(name),
        label: Text(_capitalize(name)),
        onDeleted: () {
          setState(() {
            _removeMaterial(name);
          });
        },
      );
    }).toList();


    final List<Widget> choiceChips = _allmaterials.map<Widget>((String name) {
      return ChoiceChip(
        key: ValueKey<String>(name),
        backgroundColor: _nameToColor(name),
        label: Text(_capitalize(name)),
        selected: _selectedMaterial == name,
        onSelected: (bool value) {
          setState(() {
            _selectedMaterial = value ? name : '';
            _addMaterial(name);
          });
        },
      );
    }).toList();

    final ThemeData theme = Theme.of(context);
    final List<Widget> tiles = <Widget>[
      const SizedBox(height: 8.0, width: 0.0),
      _ChipsTile(label: 'Available Materials (Chip)', children: chips),
      _ChipsTile(label: 'Choose a Material (ChoiceChip)', children: choiceChips),
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
