part of 'hotel_bloc.dart';

@immutable
abstract class HotelState {}

class HotelInitial extends HotelState {}
class GetHotelsAwaitState  extends HotelState {}
class GetHotelsAcceptState  extends HotelState {}
class GetHotelsErrorState  extends HotelState {
  final String message;

  GetHotelsErrorState(this.message);

}