import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:tenders_app/features/tenders/domain/models/tender.dart';
import 'package:tenders_app/utils/constants.dart';

@Named('TendersApi')
@injectable
class TendersApi {
  const TendersApi({
    required this.client,
  });

  final http.Client client;

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('${Constants.baseScheme}${Constants.baseUrl}$path');
    return parameters != null
        ? uri.replace(
            queryParameters: parameters,
          )
        : uri;
  }

  Future<List<Tender>> fetchTenders(int pageNumber) async {
    final uri =
        _makeUri(Constants.tendersPath, {'page': pageNumber.toString()});
    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return (json['data'] as List).map((e) => Tender.fromJson(e)).toList();
  }

  Future<Tender> fetchTenderDetails(int tenderId) async {
    final uri = _makeUri('${Constants.tendersPath}/$tenderId');
    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return Tender.fromJson(json);
  }
}
