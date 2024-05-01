part of tenders;

abstract class TendersState extends Equatable {
  final List<Tender> tenders;
  final bool hasMore;

  const TendersState({this.tenders = const [], this.hasMore = true});

  @override
  List<Object?> get props => [tenders, hasMore];
}

class TendersInitial extends TendersState {
  const TendersInitial() : super();
}

class TendersLoading extends TendersState {
  const TendersLoading(
      {List<Tender> tendersList = const [], bool hasMore = true})
      : super(tenders: tendersList, hasMore: hasMore);
}

class TendersDataLoaded extends TendersState {
  const TendersDataLoaded(
      {List<Tender> tendersList = const [], bool hasMore = true})
      : super(tenders: tendersList, hasMore: hasMore);
}

class TendersDataError extends TendersState {
  final String error;

  const TendersDataError({
    required this.error,
    List<Tender> tendersList = const [],
    bool hasMore = true,
  }) : super(tenders: tendersList, hasMore: hasMore);

  @override
  List<Object?> get props => super.props..add(error);
}
