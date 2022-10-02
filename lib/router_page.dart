import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/presentation/screen/home.dart';
import 'package:myapp/presentation/screen/splashscreen.dart';
import 'business_logic/country_cubit/country_cubit.dart';
import 'business_logic/holiday_cubit/holidays_cubit_cubit.dart';
import 'data/repository/app_repository.dart';
import 'data/web_services/app_services.dart';

class RouterPages {
  late CountryCodeRepository countryRepository;
  late CountryCubit countryCubit;

  RouterPages() {
    countryRepository = CountryCodeRepository(CountryCodeServices());
    countryCubit = CountryCubit(countryRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => CountryCubit(countryRepository),
            child: const SplashScreen(),
          ),
        );
      case "/home":
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (BuildContext context) =>
                      CountryCubit(countryRepository)),
              BlocProvider(
                create: (BuildContext context) =>
                    HolidaysCubit(countryRepository),
              ),
            ],
            child: const HomePage(),
          ),
        );
    }
    return null;
  }
}
