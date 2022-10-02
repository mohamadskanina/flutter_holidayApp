import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/data/models/country/countrycodemodel.dart';
import 'package:myapp/data/repository/app_repository.dart';
part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final CountryCodeRepository countryRepository;

  CountryCubit(this.countryRepository) : super(CountryInitial());

  getCountryCodeFromModelFromCubit() async {
    try {
      emit(CountryCodeLoading());
      await countryRepository
          .getAllCountryCodeFromRepository()
          .then((countriesCode) {
        if (countriesCode.isEmpty) {
          emit(CountryCodeEmpty());
        } else {
          emit(CountryCodeLoded(countriesCode));
        }
      });
    } catch (_) {
      emit(CountryCodeError());
    }
  }
}
