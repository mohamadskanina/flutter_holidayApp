import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/business_logic/country_cubit/country_cubit.dart';
import 'package:myapp/business_logic/holiday_cubit/holidays_cubit_cubit.dart';
import 'package:myapp/core/constant/colorapp.dart';
import 'package:myapp/core/constant/image_assets.dart';
import 'package:myapp/core/constant/textstyleapp.dart';
import 'package:myapp/presentation/widget/home/custom_dropdown_yaers.dart';
import 'package:myapp/presentation/widget/home/custombackground.dart';
import 'package:myapp/presentation/widget/home/customcircle.dart';
import 'package:myapp/presentation/widget/home/customtext.dart';
import 'package:myapp/presentation/widget/home/dropdown.dart';
import 'package:myapp/presentation/widget/home/holidays.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CountryCubit>(context).getCountryCodeFromModelFromCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor, body: _buildHomeBody());
  }

  _buildHomeBody() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          const CustomBackgroundHomePage(),
          const CustomCircle(),
          SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomText(),
                  _buildDropDownBody(),
                  _buildDataList()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildDropDownBody() {
    return Expanded(
      flex: 1,
      child: Column(
        children: [_buildDropDownList(), const CustomDropDownYears()],
      ),
    );
  }

  _buildDataList() {
    return Expanded(
      flex: 3,
      child: Container(
          alignment: Alignment.center, child: _buildTheListOfHolidays()),
    );
  }

  _buildDropDownList() {
    return BlocBuilder<CountryCubit, CountryState>(builder: (context, state) {
      if (state is CountryCodeLoading) {
        return _biuldLodingDropDown();
      } else if (state is CountryCodeError) {
        return const Text("Error ...");
      } else if (state is CountryCodeError) {
        return const Text("Empty DropDown");
      }
      if (state is CountryCodeLoded) {
        return CustomDropDownCountries(
          listOfCountriesCodeModel: state.listOfCountryCodeModel,
          title: "Click to choose a city",
        );
      }
      return const SizedBox.shrink();
    });
  }

  _buildTheListOfHolidays() {
    return BlocBuilder<HolidaysCubit, HolidaysCubitState>(
      builder: (context, state) {
        if (state is HolidaysLoading) {
          return Lottie.asset(AppImageAssets.loading);
        } else if (state is HolidaysEmpty) {
          return _buildStatusOfHoliday(
              "Sorry, there are no data for your selection",
              AppImageAssets.nodata);
        } else if (state is HolidaysError) {
          return _buildStatusOfHoliday(
              "Sorry ,We catch Error", AppImageAssets.nodata);
        } else if (state is HolidaysLoded) {
          return HolidaysPage(listOfCountryModel: (state).listOfHolidaysModels);
        }
        return _buildStatusOfHoliday(
            "Start Search by select Value in top", AppImageAssets.arrow);
      },
    );
  }

  _buildStatusOfHoliday(String title, String lottie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(lottie, width: 250, height: 250),
        Text(
          title,
          style: AppTextStyle.largeFont.copyWith(color: AppColor.primaryColor),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  _biuldLodingDropDown() {
    return Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: AppColor.backgroundColor,
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.all(8.0),
        child: const Text("Loding data ..."));
  }
}
