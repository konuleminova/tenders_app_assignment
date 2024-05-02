// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:http/http.dart' as _i3;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tenders_app/di/di_module.dart' as _i8;
import 'package:tenders_app/features/tenders/data/datasources/remote/tenders_api.dart'
    as _i4;
import 'package:tenders_app/features/tenders/data/datasources/remote/tenders_data_source.dart'
    as _i5;
import 'package:tenders_app/features/tenders/data/repositories/tenders_repository.dart'
    as _i6;
import 'package:tenders_app/features/tenders/presentation/tenders.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final httpClientModule = _$HttpClientModule();
    gh.lazySingleton<_i3.Client>(() => httpClientModule.httpClient);
    gh.factory<_i4.TendersApi>(
      () => _i4.TendersApi(client: gh<_i3.Client>()),
      instanceName: 'TendersApi',
    );
    gh.lazySingleton<_i5.TendersRemoteDataSource>(() =>
        _i5.TendersRemoteDataSource(
            tendersApi: gh<_i4.TendersApi>(instanceName: 'TendersApi')));
    gh.factory<_i6.TendersRepositoryImpl>(() => _i6.TendersRepositoryImpl(
        remoteDataSource: gh<_i5.TendersRemoteDataSource>()));
    gh.lazySingleton<_i7.TendersCubit>(
        () => _i7.TendersCubit(repository: gh<_i6.TendersRepositoryImpl>()));
    gh.factoryParam<_i7.TenderDetailsCubit, int, dynamic>((tenderId, _) =>
        _i7.TenderDetailsCubit(
            repository: gh<_i6.TendersRepositoryImpl>(), tenderId: tenderId));
    return this;
  }
}

class _$HttpClientModule extends _i8.HttpClientModule {}
