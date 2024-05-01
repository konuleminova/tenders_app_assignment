part of tenders;

@lazySingleton
class TenderDetailsCubit extends Cubit<TenderDetailsState> {
  final TendersRepository repository;

  TenderDetailsCubit({required this.repository})
      : super(TenderDetailsInitial());

  Future<void> fetchTenderDetails(int tenderId) async {
    emit(TenderDetailsLoading());
    try {
      final result = await repository.getTenderDetails(tenderId);
      result.fold(
          onFailure: (failure) => emit(TenderDetailsError(failure.error)),
          onSuccess: (tenderDetails) {
            if (tenderDetails != null) {
              emit(TenderDetailsLoaded(tenderDetails));
            } else {
              emit(TenderDetailsError("Failed to load details: Data is null."));
            }
          });
    } catch (e) {
      emit(TenderDetailsError('Unexpected error occurred: ${e.toString()}'));
    }
  }
}
