import 'dart:convert';
import 'dart:io' as http;
import 'package:injectable/injectable.dart';
import 'package:tenders_app/features/tenders/domain/models/tender.dart';
import 'package:tenders_app/utils/constants.dart';

@Named('TendersApi')
@injectable
class TendersApi {
  const TendersApi({
    required this.client,
  });

  final http.HttpClient client;

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri =
        Uri.parse('${Constants.baseScheme}${Constants.baseUrl}$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<List<Tender>> fetchTenders(int pageNumber) async {
    final uri =
        _makeUri(Constants.tendersPath, {'page': pageNumber.toString()});
    final request = await client.getUrl(uri);
    final response = await request.close();

    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((val) => jsonDecode(val));
    return (json['data'] as List).map((e) => Tender.fromJson(e)).toList();
  }

  Future<Tender> fetchTenderDetails(int tenderId) async {
    final uri = _makeUri('${Constants.tendersPath}/$tenderId');
    final request = await client.getUrl(uri);
    final response = await request.close();

    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((val) => jsonDecode(val));
    return Tender.fromJson(json);
  }
}
