import 'package:flutter/material.dart';
import 'package:voix/utils/utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              // SliderTransition(SettingsPage());
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios_new_rounded)),
        elevation: 0,
      ),
      body: Column(
        children: [Text('SETTINGS')],
      ),
    );
  }
}
