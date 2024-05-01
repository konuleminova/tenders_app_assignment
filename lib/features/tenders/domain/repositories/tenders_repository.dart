import 'package:tenders_app/features/tenders/domain/models/base/result/result.dart';
import 'package:tenders_app/features/tenders/domain/models/tender.dart';

abstract class TendersRepository {
  Future<Result<List<Tender>, Failure>> getTenders(int pageNumber);

  Future<Result<Tender, Failure>> getTenderDetails(int tenderId);
}
