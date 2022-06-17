import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:voix/utils/utils.dart';
import 'package:voix/views/settings_page.dart';
import 'package:speech_to_text/speech_to_text.dart' as spt;

class HomePage extends StatelessWidget {
  bool isListening = false;

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
              SpeechConvert(),
              Spacer(),
              // Expanded(child: SpeechConvert()
              //     // isListening
              //     //     ? Text('waiting ')
              //     //     : Text(
              //     //         'Press the button and start blabbering',
              //     //         style: Theme.of(context).textTheme.bodyText1,
              //     //       ),
              //     ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: InkWell(
                  onTap: () {},
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SpeechConvert extends StatefulWidget {
  const SpeechConvert({Key? key}) : super(key: key);

  @override
  State<SpeechConvert> createState() => SpeechConvertState();
}

class SpeechConvertState extends State<SpeechConvert> {
  final Map<String, HighlightedWord> _highlights = {
    'Afroz': HighlightedWord(
      onTap: () {
        print('Afroz');
      },
    ),
    'Voix': HighlightedWord(
      onTap: () {
        print('Voix');
      },
    ),
  };
  late spt.SpeechToText _speech;
  bool _isListening = false;
  String _actionText = 'Press the button and start blabbring';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = spt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        children: [
          Container(
            child: TextHighlight(
                text: _actionText,
                words: _highlights,
                textStyle: Theme.of(context).textTheme.bodyText1),
          ),
          InkWell(
            onTap: _listen,
            child: Container(
              color: Colors.red,
              width: 200,
              height: 40,
            ),
          )
        ],
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('$val'),
        onError: (val) => print('$val'),
      );
      if (available) {
        setState(() {
          _speech.listen(
              onResult: (val) => setState(() {
                    _actionText = val.recognizedWords;
                  }));
        });
      }
    } else {
      setState(() {
        _isListening = false;
        _speech.stop();
      });
    }
  }
}
