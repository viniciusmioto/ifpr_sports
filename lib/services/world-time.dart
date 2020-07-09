import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String time;
  String day;
  String month;
  String year;
  String hour;
  String postDateTime;

  void getTime() async {
    Response response =
        await get('http://worldtimeapi.org/api/timezone/America/Sao_Paulo');
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String utcOffset = data['utc_offset'].substring(1, 3);
    DateTime now = DateTime.parse(datetime);
    print(utcOffset);
    now = now.add(Duration(hours: int.parse(utcOffset) * -1));
    time = now.toString().substring(0, 16);
    day = time.substring(8, 10);
    month = time.substring(5, 7);
    year = time.substring(0, 4);
    hour = time.substring(11, 16);
    postDateTime = day + '/' + month + '/' + year + ' - ' + hour;
  }
}
