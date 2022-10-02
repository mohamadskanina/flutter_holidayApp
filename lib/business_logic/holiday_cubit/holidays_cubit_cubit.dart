import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/data/models/holiday/holidaymodel.dart';
import 'package:myapp/data/repository/app_repository.dart';

part 'holidays_cubit_state.dart';

class HolidaysCubit extends Cubit<HolidaysCubitState> {
  final CountryCodeRepository countryRepository;
  String? code;
  String? year;
  bool setCode = false;
  bool setYear = false;
  HolidaysCubit(this.countryRepository) : super(HolidaysCubitInitial());

  getCountryHolidaysFromCubit(String code, String yaer) async {
    try {
      emit(HolidaysLoading());
      await countryRepository
          .getCountryHolidaysFromRepository(yaer, code)
          .then((listOfHolidays) {
        if (listOfHolidays.isEmpty) {
          emit(HolidaysEmpty());
        } else {
          emit(HolidaysLoded(listOfHolidays));
        }
      });
    } catch (_) {
      emit(HolidaysError());
    }
  }

  setCodeValue(String code) {
    this.code = code;
    setCode = true;
    getHolidaysList();
  }

  setYearValue(String year) {
    this.year = year;
    setYear = true;
    getHolidaysList();
  }

  getHolidaysList() {
    if (setCode && setYear) {
      getCountryHolidaysFromCubit(code!, year!);
    }
  }

  getYearValue() {
    return year;
  }

  getCodeValue() {
    return code;
  }
}
