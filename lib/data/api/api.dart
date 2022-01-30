import 'package:http/http.dart' as http;

class Api {
  final _apiKey = 'urwoHdDcZWy1wssi8rT4LaM3erpDzszqhIbSoFYT';

  Future<String> getApodFromApi(String dateForApi) async {
    final apodUri = Uri.parse(
        'https://api.nasa.gov/planetary/apod?api_key=$_apiKey&date=$dateForApi');
    final response = await http.get(apodUri);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw (response.statusCode);
    }
  }
}
