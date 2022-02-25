// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apod_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApodApi implements ApodApi {
  _ApodApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.nasa.gov/planetary';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Apod> getApod(
      {apiKey = 'jCrJkv1SKaVHy2R31vT4KpY4bHGdCWAmAs4qd2OM',
      required date}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': apiKey,
      r'date': date
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Apod>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/apod',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Apod.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
