import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_management/models/feeds_model.dart';
import 'package:json_management/res/feeds_service.dart';

part 'feeds_event.dart';
part 'feeds_state.dart';

class FeedsBloc extends Bloc<FeedsEvent, FeedsState> {
  FeedsBloc() : super(FeedsInitial()) {
    on<LoadFeeds>(_loadFeeds);
  }

  _loadFeeds(LoadFeeds event, Emitter<FeedsState> emit) async {
    emit(FeedsInitial());
    try {
      final List<Feed> feed = await FeedsServiceProvider().fetchDataFeeds;
      emit(FeedsLoaded(feed: feed));
    } catch (e) {
      emit(FeedsError(error: e.toString()));
    }
  }
}
