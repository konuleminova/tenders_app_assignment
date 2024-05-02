import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@module
abstract class HttpClientModule {
  @lazySingleton
  http.Client get httpClient => http.Client();
}