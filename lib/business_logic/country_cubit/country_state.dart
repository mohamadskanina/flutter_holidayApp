part of 'country_cubit.dart';

@immutable
abstract class CountryState {}

class CountryInitial extends CountryState {}

//Country State is Load
class CountryCodeLoded extends CountryState {
  final List<CountriesCodeModel> listOfCountryCodeModel;
  CountryCodeLoded(this.listOfCountryCodeModel);
}

class CountryCodeLoading extends CountryState {}

class CountryCodeError extends CountryState {}

class CountryCodeEmpty extends CountryState {}
