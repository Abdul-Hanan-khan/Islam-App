import 'package:audioplayerui/audioplayerui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islam_app/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islam_app/dashboard/dashboard.dart';

import 'package:islam_app/zakat/zakat_silver.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video2 extends StatelessWidget {
  AudioPlayerController audioPlayerController = AudioPlayerController();

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'e_TZFp8Q9ug',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );

    return Scaffold(
      backgroundColor: HexColor('#075852'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
            onReady: () {
              print("player ready..");
            },
          ),
          SizedBox(
            height: 20,
          ),
          AudioPlayerView(
              audioPlayerController: audioPlayerController,
              trackUrl: 'https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4',
              isLocal: false,
              trackTitle: "",
              trackSubtitle: "",
              // imageUrl: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.istockphoto.com%2Fphotos%2Flove-listening-to-music-picture-id508316218%3Fk%3D20%26m%3D508316218%26s%3D612x612%26w%3D0%26h%3DrO_5bD9W_0hG5TSKylnhFB-8S7_d6F2Ym1kf6pIci9Q%3D&imgrefurl=https%3A%2F%2Fwww.istockphoto.com%2Fphotos%2Fmp3-player&tbnid=1Mia_rLYNGbJiM&vet=12ahUKEwjIwOSGzpfzAhVFlxoKHfl-DDoQMygAegUIARDIAQ..i&docid=ZC1l5601kGY9mM&w=612&h=408&q=audio%20player%20images&ved=2ahUKEwjIwOSGzpfzAhVFlxoKHfl-DDoQMygAegUIARDIAQ",
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Description",
              style: TextStyle(fontSize: 19, color: HexColor("#eb9c34")),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry' +
                  's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              style: TextStyle(color: Colors.white, fontSize: 15),
              // textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}

//
// class Video extends StatefulWidget {
//   @override
//   _VideoState createState() => _VideoState();
// }
//
// class _VideoState extends State<Video> {
//   double _value = 0.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         color: HexColor("#363838"),
//         padding:
//             EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0, bottom: 40.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                     //height: 120.0,
//                     //   color: Colors.red,
//                     alignment: Alignment.center,
//                     child: Container(
//                         padding: EdgeInsets.only(left: 10.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           //  color: Colors.white70,
//                         ),
//                         child: Image.asset(
//                           Constants.transparent_back,
//                           height: 30.0,
//                           color: Colors.white,
//                         )),
//                   ),
//                 ),
//                 Expanded(
//                     child: Center(
//                         child: Text(
//                   "NEW | When a Scholar",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.w500,
//                       decoration: TextDecoration.none,
//                       fontFamily: "Arial"),
//                 ))),
//                 SizedBox(
//                   width: 50.0,
//                 )
//               ],
//             ),
//             Expanded(
//               child: GestureDetector(
//                   child: Center(
//                       child: Image.asset(
//                 Constants.youtube,
//                 width: 80.0,
//               ))),
//             ),
//             Container(
//               /*child: */ /*SliderTheme(
//                 data: SliderTheme.of(context).copyWith(
//                   activeTrackColor: Colors.red[700],
//                   inactiveTrackColor: Colors.red[100],
//                   trackShape: RectangularSliderTrackShape(),
//                   trackHeight: 4.0,
//                   thumbColor: Colors.redAccent,
//                   thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
//                   overlayColor: Colors.red.withAlpha(32),
//                   overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
//                 ),
//                 child: Slider(
//                   max: 10.25,
//                   min: 0.00,
//                   value: _value,
//                   onChanged: (value) {
//                     setState(() {
//                       _value = value;
//                     });
//                   },
//                 ),
//               ),*/ /* */
//               child: Container(
//                 alignment: Alignment.bottomRight,
//                   child: Slider(
//                       value: _value.toDouble(),
//                       min: 0.0,
//                       max: 16.5,
//
//                       activeColor: HexColor("#f7070f"),
//                       inactiveColor: Colors.white30,
//                       onChanged: (double newValue) {
//                         setState(() {
//                           _value = newValue;
//                         });
//                       },
//                       semanticFormatterCallback: (double newValue) {
//                         return '${newValue.round()}';
//                       }
//                   )
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
