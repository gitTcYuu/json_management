import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_management/models/photos_model.dart';
import 'package:json_management/res/photos_service.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosInitial()) {
    on<LoadPhotos>(_loadPhotos);
  }

  _loadPhotos(LoadPhotos event, Emitter<PhotosState> emit) async {
    emit(PhotosInitial());
    try {
      final List<Photo> photos = await PhotoServiceProvider().fetchDataPhotos;
      emit(PhotosLoaded(photos: photos));
    } catch (e) {
      log(e.toString());
      emit(PhotosError(error: e.toString()));
    }
  }
}
