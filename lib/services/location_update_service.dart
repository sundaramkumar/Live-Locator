import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:location/location.dart';

class LocationUpdateService {
  Future<void> sendLocationToServer(LocationData locationData) async {
    print(jsonEncode({
      'latitude': locationData.latitude,
      'longitude': locationData.longitude,
    }));
    //once the backend is ready, uncomment the below code
    // final url = Uri.parse('https://your-server.com/api/location');
    // final response = await http.post(
    //   url,
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode({
    //     'latitude': locationData.latitude,
    //     'longitude': locationData.longitude,
    //   }),
    // );

    // if (response.statusCode == 200) {
    //   print('Location sent successfully');
    // } else {
    //   print('Failed to send location');
    // }
  }
}
