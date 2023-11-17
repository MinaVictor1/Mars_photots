import 'package:basicapp/data/model/mars_photo/mars_photo.dart';
import 'package:basicapp/data/repo/repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mars_state.dart';

class MarsCubit extends Cubit<MarsState> {
  MarsCubit() : super(MarsInitial());

  static MarsCubit get(context) => BlocProvider.of<MarsCubit>(context);

  List<MarsPhoto> photos = [];
  DateTime? selectedDate;

  void changedDate(DateTime? selectedDate) async {
    if (selectedDate != null) {
      this.selectedDate = selectedDate;
      emit(SelectedDateChanged());
      await fetchPhotos(selectedDate);
    } else {
      emit(SelectedDateIsNull());
    }
  }

  Future<void> fetchPhotos(DateTime earthDate) async {
    emit(MarsLoadding());
    photos = await Repo().fetchPhotos(earthDate);
    emit(MarsLoaded());
  }
}
