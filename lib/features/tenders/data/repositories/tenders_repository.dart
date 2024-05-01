import 'package:injectable/injectable.dart';
import 'package:tenders_app/features/tenders/data/datasources/remote/tenders_data_source.dart';
import 'package:tenders_app/features/tenders/domain/models/base/result/result.dart';
import 'package:tenders_app/features/tenders/domain/models/tender.dart';
import 'package:tenders_app/features/tenders/domain/repositories/tenders_repository.dart';

@injectable
class TendersRepositoryImpl implements TendersRepository {
  final TendersRemoteDataSource remoteDataSource;

  const TendersRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Result<List<Tender>, Failure>> getTenders(int pageNumber) async {
    final response = await remoteDataSource.getTenders(pageNumber);
    return response;
  }

  @override
  Future<Result<Tender, Failure>> getTenderDetails(int tenderId) async {
    final response = await remoteDataSource.getTenderDetails(tenderId);
    return response;
  }
}
