part of tenders;

abstract class TenderDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class TenderDetailsInitial extends TenderDetailsState {}

class TenderDetailsLoading extends TenderDetailsState {}

class TenderDetailsLoaded extends TenderDetailsState {
  final Tender tenderDetails;

  TenderDetailsLoaded(this.tenderDetails);

  @override
  List<Object> get props => [tenderDetails];
}

class TenderDetailsError extends TenderDetailsState {
  final String message;

  TenderDetailsError(this.message);

  @override
  List<Object> get props => [message];
}
