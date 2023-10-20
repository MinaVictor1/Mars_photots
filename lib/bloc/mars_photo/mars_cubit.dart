import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mars_state.dart';

class MarsCubit extends Cubit<MarsState> {
  MarsCubit() : super(MarsInitial());

  static MarsCubit get(context) => BlocProvider.of<MarsCubit>(context);
}
