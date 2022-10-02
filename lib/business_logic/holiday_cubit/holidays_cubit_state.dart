part of 'holidays_cubit_cubit.dart';

@immutable
abstract class HolidaysCubitState {}

class HolidaysCubitInitial extends HolidaysCubitState {}

// Holidays State

// Holidays State is load
class HolidaysLoded extends HolidaysCubitState {
  final List<HolidaysModel> listOfHolidaysModels;
  HolidaysLoded(this.listOfHolidaysModels);
}

// Holidays State is loading
class HolidaysLoading extends HolidaysCubitState {}

class HolidaysError extends HolidaysCubitState {}

class HolidaysEmpty extends HolidaysCubitState {}
