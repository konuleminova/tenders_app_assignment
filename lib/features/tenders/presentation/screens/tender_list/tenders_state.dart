part of tenders;

abstract class TendersState extends Equatable {
  final List<Tender> tenders;
  final bool hasMore;
  final PaginationController pageController;

  const TendersState({
    this.tenders = const [],
    this.hasMore = true,
    required this.pageController,
  });

  @override
  List<Object?> get props => [tenders, hasMore, pageController];
}

class TendersInitial extends TendersState {
  TendersInitial() : super(pageController: PaginationController());
}

class TendersLoading extends TendersState {
  const TendersLoading({
    List<Tender> tendersList = const [],
    super.hasMore,
    required super.pageController,
  }) : super(tenders: tendersList);
}

class TendersDataLoaded extends TendersState {
  const TendersDataLoaded({
    List<Tender> tendersList = const [],
    super.hasMore,
    required super.pageController,
  }) : super(tenders: tendersList);
}

class TendersDataError extends TendersState {
  final String error;

  const TendersDataError({
    required this.error,
    List<Tender> tendersList = const [],
    super.hasMore,
    required super.pageController,
  }) : super(tenders: tendersList);

  @override
  List<Object?> get props => super.props..add(error);
}
