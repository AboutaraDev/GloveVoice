import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glovevoice/src/constants/colors.dart';
import 'package:glovevoice/src/features/home/api/speech_api.dart';
import 'package:glovevoice/src/utils/theme/widget_theme/circle_button.dart';
import 'package:glovevoice/src/utils/theme/widget_theme/substring_highlighted.dart';
import 'package:glovevoice/src/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isListening = false;
  String text = "Press the button & start speaking";
  String currentLanguage = 'English'; // Track current language
  List<String> languages = ['English', 'Arabic', 'Darija', 'Français']; // Available languages

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Speech to Text"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.language),
              onPressed: () {
                // Show dialog to select language
                _showLanguageDialog();
              },
            ),
            IconButton(
              icon: Icon(Icons.content_copy),
              onPressed: () async {
                await FlutterClipboard.copy(text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Text copied to clipboard")),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(30).copyWith(bottom: 150),
          child: SubstringHighlight(
            text: text,
            terms: Command.all,
            textStyle: TextStyle(
              fontSize: 32.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            textStyleHighlight: TextStyle(
              fontSize: 32.0,
              color: Colors.red,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: isListening,
          glowRadiusFactor: 75,
          glowColor: Theme.of(context).primaryColor,
          child: FloatingActionButton(
            child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
            onPressed: toggleRecording,
          ),
        ),
      );

  Future<void> toggleRecording() async {
    final permissionStatus = await Permission.microphone.request();

    if (permissionStatus.isGranted) {
      String localeId;

      // Set the localeId based on the selected language
      if (currentLanguage == 'English') {
        localeId = 'en-US';
        text = "Press the button & start speaking";
      } else if (currentLanguage == 'Arabic') {
        localeId = 'ar-SA';
        text = "اضغط على الزر وابدأ بالتحدث";

      } else if (currentLanguage == 'Français') {
        localeId = 'fr-FR';
        text = "Appuyez sur le bouton et commencez à parler";
      } else { // Darija
        localeId = 'ar-MA';// Use locale for Moroccan Arabic
        text = "اضغط على الزر وابدأ بالتحدث";
      }

      SpeechApi.toggleRecording(
        localeId: localeId, // Use selected language
        onResult: (text) => setState(() => this.text = text),
        onListening: (isListening) {
          setState(() => this.isListening = isListening);
          if (!isListening) {
            Future.delayed(Duration(seconds: 1), () {
              Utils.scanText(text);
            });
          }
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Microphone permission denied")),
      );
    }
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select Language"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: languages.map((language) {
              return RadioListTile(
                title: Text(language),
                value: language,
                groupValue: currentLanguage,
                onChanged: (value) {
                  setState(() {
                    currentLanguage = value.toString();
                    // Set the localeId based on the selected language
      if (currentLanguage == 'English') {
       
        text = "Press the button & start speaking";
      } else if (currentLanguage == 'Arabic') {
     
        text = "اضغط على الزر وابدأ بالتحدث";

      } else if (currentLanguage == 'Français') {
       
        text = "Appuyez sur le bouton et commencez à parler";
      } else { // Darija
        text = "اضغط على الزر وابدأ بالتحدث";
      }
                  });
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class CustomAppBar6 extends StatelessWidget {
  const CustomAppBar6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
      height: 120,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.05, 0.6],
          colors: [tPrimaryColor2, tPrimaryColor2],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleButton(
                icon: Icons.arrow_back,
                onPressed: () {
                  // Debug print statement
                  Navigator.pop(context); // Go back to the previous screen
                },
              ),
              Expanded(
                child: Text(
                  "Speech to Text",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(width: 40),
            ],
          ),
        ],
      ),
    );
  }
}
