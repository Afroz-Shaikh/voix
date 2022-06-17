import 'package:flutter/cupertino.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Settings',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 20,
            ),
            SwitchTile(),
            SettingTile(
              title: 'How to Use?',
            ),
            SettingTile(
              title: 'About',
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchTile extends StatefulWidget {
  bool value = true;
  @override
  State<SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<SwitchTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.VsecondaryGrey,
      child: ListTile(
        title: Text('Dark Theme'),
        trailing: CupertinoSwitch(
          value: widget.value,
          // onChanged: (value) {},
          onChanged: (v) => setState(() => widget.value = v),
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  final String title;

  const SettingTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      color: AppColors.VsecondaryGrey,
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
