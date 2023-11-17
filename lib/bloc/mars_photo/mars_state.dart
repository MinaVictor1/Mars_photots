part of 'mars_cubit.dart';

sealed class MarsState extends Equatable {
  const MarsState();

  @override
  List<Object> get props => [];
}

final class MarsInitial extends MarsState {}

final class MarsLoadding extends MarsState {}

final class MarsLoaded extends MarsState {}

final class SelectedDateChanged extends MarsState {}

final class SelectedDateIsNull extends MarsState {}
