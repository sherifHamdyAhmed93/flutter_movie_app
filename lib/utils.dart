import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils{
  static String formatDate(String dateString){
    if (dateString.isEmpty){
      return  '';
    }
    // Step 1: Parse the string to DateTime
    DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(dateString);

    // Step 2: Format the parsed DateTime
    String formattedDate = DateFormat('yyyy').format(parsedDate);

    print('Original Date String: $dateString');
    print('Formatted Date: $formattedDate');
    return formattedDate;
  }

  static String convertMinutesToFormatedTime(int minutes){
    int hours = (minutes / 60).toInt();
    int remaningMinutes = minutes % 60;
    String movieTime = '';
    if (hours > 0){
      movieTime = '${hours}h ';
    }
    if (remaningMinutes > 0){
      movieTime += '${remaningMinutes}m';
    }
    return movieTime;
  }

  static Future<void> launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

}
