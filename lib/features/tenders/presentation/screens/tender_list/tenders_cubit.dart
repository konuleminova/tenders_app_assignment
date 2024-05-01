part of tenders;

@lazySingleton
class TendersCubit extends Cubit<TendersState> {
  final TendersRepository repository;
  int currentPage = 1;
  bool hasMore = true;
  bool isLoading = false;

  TendersCubit({required this.repository}) : super(const TendersInitial());

  void fetchTenders() async {
    if (isLoading || !hasMore) return;
    isLoading = true;

    emit(TendersLoading(tendersList: state.tenders));

    final result = await repository.getTenders(currentPage);
    result.fold(
      onSuccess: (newTenders) {
        currentPage++;
        hasMore = newTenders!.isNotEmpty;
        isLoading = false;
        final currentTenders = List<Tender>.from(state.tenders);
        emit(TendersDataLoaded(
            tendersList: currentTenders + newTenders, hasMore: hasMore));
      },
      onFailure: (failure) {
        isLoading = false;
        emit(TendersDataError(
            error: failure.toString(), tendersList: state.tenders));
      },
    );
  }
}
