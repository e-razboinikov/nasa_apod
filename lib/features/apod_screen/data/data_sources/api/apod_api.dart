import 'package:dio/dio.dart';
import 'package:nasa_apod/features/apod_screen/data/models/apod_model.dart';
import 'package:retrofit/retrofit.dart';

part 'apod_api.g.dart';

@RestApi(baseUrl: 'https://api.nasa.gov/planetary')
abstract class ApodApi {
  factory ApodApi(Dio dio) = _ApodApi;

  @GET('/apod')
  Future<ApodModel> getApod({
    @Query("api_key")
        String apiKey = 'jCrJkv1SKaVHy2R31vT4KpY4bHGdCWAmAs4qd2OM',
    @Query("date") required String date,
  });
}
