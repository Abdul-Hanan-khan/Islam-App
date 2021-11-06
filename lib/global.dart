
import 'package:islam_app/model/user.dart';
import 'package:islam_app/config/config.dart';

import 'model/user.dart';
class GlobalValues{
 static User user;
 static double longitude;
 static double latitude;
}

String getImageFromName({String imageName}) {
 String name = imageName;

 return IMAGE_PATH_URL + name;
}
String getVideoFromName({String videoName}) {
 String name = videoName;

 return VIDEO_PATH_URL + name;
}