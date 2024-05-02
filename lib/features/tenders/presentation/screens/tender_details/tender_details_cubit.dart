part of tenders;

@lazySingleton
class TenderDetailsCubit extends Cubit<TenderDetailsState> {
  final int tenderId;
  final TendersRepository repository;

  TenderDetailsCubit({required this.tenderId, required this.repository})
      : super(const TenderDetailsInitial()) {
    fetchTenderDetails(tenderId);
  }

  Future<void> fetchTenderDetails(int tenderId) async {
    emit(const TenderDetailsLoading());
    try {
      final result = await repository.getTenderDetails(tenderId);
      result.fold(
          onFailure: (failure) => emit(TenderDetailsError(failure.error)),
          onSuccess: (tenderDetails) {
            emit(TenderDetailsLoaded(tenderDetails!));
          });
    } catch (e) {
      emit(TenderDetailsError.fromState(e.toString()));
    }
  }
}
