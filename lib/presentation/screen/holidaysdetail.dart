import 'package:flutter/material.dart';
import 'package:myapp/core/constant/colorapp.dart';
import 'package:myapp/core/constant/textstyleapp.dart';
import 'package:myapp/data/models/holiday/holidaymodel.dart';
import 'package:myapp/presentation/widget/home/custombackground.dart';
import 'package:myapp/presentation/widget/home/customcircle.dart';

// ignore: must_be_immutable
class HolidaysDetail extends StatelessWidget {
  HolidaysModel countryModel;
  HolidaysDetail({required this.countryModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor, body: _buildBody(context));
  }

  _buildCardData(String title, String data) {
    return Card(
      color: AppColor.backgroundColor,
      shadowColor: AppColor.primaryColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          title,
          style: AppTextStyle.smallFont,
        ),
        subtitle: Text(
          data,
          style: AppTextStyle.mediumFont,
        ),
      ),
    );
  }

  _buildCointiesList(List<String>? counties) {
    return Container(
      alignment: Alignment.center,
      height: 82,
      width: double.infinity,
      child: counties == null
          ? const SizedBox.shrink()
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: counties.length,
              itemBuilder: ((context, index) {
                return Container(
                  margin: const EdgeInsets.all(4),
                  height: 70,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColor.secoundryColor.withOpacity(0.5),
                  ),
                  child: Text(counties[index],
                      style: AppTextStyle.smallFont.copyWith(
                          color: AppColor.backgroundColor,
                          fontWeight: FontWeight.bold)),
                );
              }),
            ),
    );
  }

  _buildDataList() {
    return Expanded(
      child: ListView(
        children: [
          _buildCardData("Holidays Date", countryModel.date!),
          _buildCardData("Local Name", countryModel.localName!),
          _buildCardData("Holidays Type", countryModel.type!),
          _buildCardData("Country Code", countryModel.countryCode!),
          _buildCardData("Country Fixed", countryModel.fixed!.toString()),
          _buildCardData(
              "Holidays launchYear",
              countryModel.launchYear != null
                  ? countryModel.launchYear!.toString()
                  : "null"),
          _buildCardData(
              "Holidays launchYear",
              countryModel.global != null
                  ? countryModel.global!.toString()
                  : "null"),
        ],
      ),
    );
  }

  _buildBody(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: Stack(children: [
        const CustomBackgroundHomePage(),
        const CustomCircle(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            Text(
              countryModel.name!,
              style:
                  AppTextStyle.h1Font.copyWith(color: AppColor.backgroundColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            _buildCointiesList(countryModel.counties),
            _buildDataList(),
          ],
        ),
      ]),
    );
  }
}
