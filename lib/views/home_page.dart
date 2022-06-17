import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voix/utils/utils.dart';
import 'package:voix/views/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    logo,
                    height: 37,
                  ),
                  InkWell(
                    onTap: () {
                      // SliderTransition(SettingsPage());
                      // CustomPageRoute(child: SettingsPage());
                      Navigator.of(context)
                          .push(SliderTransition(SettingsPage()));
                    },
                    child: SvgPicture.asset(
                      settings,
                      height: 37,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Press the button and start blabbering',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      color: AppColors.Vprimary,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SvgPicture.asset(record),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
