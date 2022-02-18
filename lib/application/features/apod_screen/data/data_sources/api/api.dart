import 'package:dio/dio.dart';
import 'package:nasa_apod/application/features/apod_screen/data/models/apod.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://api.nasa.gov/planetary')
abstract class Api {
  factory Api(Dio dio) = _Api;

  @GET('/apod')
  Future<Apod> getApod({
    @Query("api_key")
        String apiKey = 'jCrJkv1SKaVHy2R31vT4KpY4bHGdCWAmAs4qd2OM',
    @Query("date") required String date,
  });
}
// final _apiKey = 'jCrJkv1SKaVHy2R31vT4KpY4bHGdCWAmAs4qd2OM';
