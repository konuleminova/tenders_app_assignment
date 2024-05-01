import 'package:injectable/injectable.dart';
import 'package:tenders_app/features/tenders/data/datasources/remote/tenders_api.dart';
import 'package:tenders_app/features/tenders/domain/models/base/result/result.dart';
import 'package:tenders_app/features/tenders/domain/models/tender.dart';

@LazySingleton()
@injectable
class TendersRemoteDataSource {
  const TendersRemoteDataSource({
    @Named('TendersApi') required this.tendersApi,
  });

  final TendersApi tendersApi;

  Future<Result<List<Tender>, Failure>> getTenders(int pageNumber) async {
    try {
      final response = await tendersApi.fetchTenders(pageNumber);
      return SuccessResult(response);
    } catch (e) {
      return FailureResult(UnexpectedFailure(e.toString()));
    }
  }

  Future<Result<Tender, Failure>> getTenderDetails(int tenderId) async {
    try {
      final response = await tendersApi.fetchTenderDetails(tenderId);
      return SuccessResult(response);
    } catch (e) {
      return FailureResult(UnexpectedFailure(e.toString()));
    }
  }
}
