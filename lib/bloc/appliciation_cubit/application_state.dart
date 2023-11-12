part of 'application_cubit.dart';

abstract class ApplicationState {}

class ApplicationInitial extends ApplicationState {}

class ApplicationRestartState extends ApplicationState {}


class ApplicationErrorState extends ApplicationState {
  final dynamic error;

  ApplicationErrorState(this.error);
}