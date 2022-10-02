import 'package:myapp/core/database/database.dart';
import 'package:myapp/data/models/country/countrycodemodel.dart';
import 'package:myapp/data/models/holiday/holidaymodel.dart';
import 'package:myapp/data/web_services/app_services.dart';

class CountryCodeRepository {
  SqlDb sqlDb = SqlDb();
  late CountryCodeServices countryWebServices;
  CountryCodeRepository(this.countryWebServices);

  Future<List<CountriesCodeModel>> getAllCountryCodeFromRepository() async {
    List<dynamic> listOfCountryCodeModel =
        await sqlDb.readData("SELECT * FROM ${SqlDb.countryTable}");
    if (listOfCountryCodeModel.isEmpty) {
      final listOfCountryCodeFromApi =
          await countryWebServices.getAllCountryCodeFromApi();
      if (listOfCountryCodeFromApi.isNotEmpty) {
        for (var i = 0; i < listOfCountryCodeFromApi.length; i++) {
          String qwery =
              '''INSERT INTO ${SqlDb.countryTable} (${SqlDb.countryName}, ${SqlDb.countryShortName})
          VALUES ("${listOfCountryCodeFromApi[i][SqlDb.countryName]}","${listOfCountryCodeFromApi[i][SqlDb.countryShortName]}")''';
          await sqlDb.insertData(qwery);
        }
      }
      return listOfCountryCodeFromApi
          .map((e) => CountriesCodeModel.fromJson(e))
          .toList();
    }

    return listOfCountryCodeModel
        .map((e) => CountriesCodeModel.fromJson(e))
        .toList();
  }

  Future<List<HolidaysModel>> getCountryHolidaysFromRepository(
      String year, String code) async {
    List<dynamic> country =
        await countryWebServices.getCountryHolidaysFromApi(year, code);

    return country.map((e) => HolidaysModel.fromJson(e)).toList();
  }
}
