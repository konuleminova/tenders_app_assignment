part of tenders;

abstract class TenderDetailsState extends Equatable {
  const TenderDetailsState({this.tenderDetails});

  final Tender? tenderDetails;
}

class TenderDetailsInitial extends TenderDetailsState {
  const TenderDetailsInitial() : super(tenderDetails: null);

  @override
  List<Object?> get props => [];
}

class TenderDetailsLoading extends TenderDetailsState {
  const TenderDetailsLoading() : super(tenderDetails: null);

  @override
  List<Object?> get props => [];
}

class TenderDetailsLoaded extends TenderDetailsState {
  const TenderDetailsLoaded(Tender tenderDetails)
      : super(tenderDetails: tenderDetails);

  @override
  List<Object?> get props => [tenderDetails];
}

class TenderDetailsError extends TenderDetailsState {
  final String message;

  const TenderDetailsError(this.message);

  const TenderDetailsError.fromState(this.message) : super();

  @override
  List<Object> get props => [message];
}
