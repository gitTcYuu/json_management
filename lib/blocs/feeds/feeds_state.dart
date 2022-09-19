part of 'feeds_bloc.dart';

abstract class FeedsState extends Equatable {
  const FeedsState();

  @override
  List<Object> get props => [];
}

class FeedsInitial extends FeedsState {}

class FeedsLoaded extends FeedsState {
  final List<Feed> feed;
  const FeedsLoaded({required this.feed});
  @override
  List<Object> get props => [feed];
}

class FeedsError extends FeedsState {
  final String error;

  const FeedsError({required this.error});
  @override
  List<Object> get props => [error];
}
