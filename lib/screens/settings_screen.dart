import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Settings settings;
  final Function(Settings) onSettingsChange;

  const SettingsScreen(this.settings, this.onSettingsChange, {super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(String title, String subtitle, bool value, void Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChange(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Gluten Free',
                  'Shows only gluten free meals',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value)
                ),
                _createSwitch(
                  'Lactose Free',
                  'Shows only lactose free meals',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value)
                ),
                _createSwitch(
                  'Vegan',
                  'Shows only vegan meals',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value)
                ),
                _createSwitch(
                  'Vegetarian',
                  'Shows only vegetarian meals',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value)
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}