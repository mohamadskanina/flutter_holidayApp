import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/business_logic/holiday_cubit/holidays_cubit_cubit.dart';
import 'package:myapp/core/constant/colorapp.dart';
import 'package:myapp/core/constant/textstyleapp.dart';
import 'package:myapp/core/constant/yaers.dart';

class CustomDropDownYears extends StatefulWidget {
  const CustomDropDownYears({Key? key}) : super(key: key);

  @override
  State<CustomDropDownYears> createState() => _CustomDropDownYearsState();
}

class _CustomDropDownYearsState extends State<CustomDropDownYears> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
            color: AppColor.backgroundColor,
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.all(8.0),
        child: _buildDropDownYears());
  }

  _buildDropDownYears() {
    return DropdownButton<String>(
      dropdownColor: AppColor.backgroundColor,
      hint: Text(
        "Click to choose a year",
        style: AppTextStyle.smallFont,
      ),
      autofocus: true,
      style: AppTextStyle.smallFont,
      isExpanded: true,
      icon: const Icon(
        Icons.arrow_drop_down_outlined,
        size: 25,
      ),
      borderRadius: BorderRadius.circular(20),
      iconEnabledColor: AppColor.primaryColor,
      value: BlocProvider.of<HolidaysCubit>(context).year,
      onChanged: (year) {
        setState(() {});
        BlocProvider.of<HolidaysCubit>(context).setYearValue(year!);
      },
      elevation: 4,
      items: AppYear.listOfYears.map((e) {
        return DropdownMenuItem<String>(
          value: e,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              e,
              textAlign: TextAlign.right,
            ),
          ),
        );
      }).toList(),
    );
  }
}
