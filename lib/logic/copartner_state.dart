part of 'copartner_cubit.dart';

class CopartnerState  {}

class CopartnerInitial extends CopartnerState {}

class LoadingState extends CopartnerState {}
class LoadedState extends CopartnerState {}
class ErrorState extends CopartnerState {
  String message;
  ErrorState(this.message);
}


