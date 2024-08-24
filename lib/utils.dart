import 'package:intl/intl.dart';

class Utils{
  static String formatDate(String dateString){

    // Step 1: Parse the string to DateTime
    DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(dateString);

    // Step 2: Format the parsed DateTime
    String formattedDate = DateFormat('yyyy').format(parsedDate);

    print('Original Date String: $dateString');
    print('Formatted Date: $formattedDate');
    return formattedDate;
  }

  static String convertMinutesToFormatedTime(int minutes){
    int hours = minutes % 60;
    int remaningMinutes = (minutes / 60).toInt();
    String movieTime = '';
    if (hours > 0){
      movieTime = '${hours}h ';
    }
    if (remaningMinutes > 0){
      movieTime += '${remaningMinutes}m';
    }
    return movieTime;
  }

}