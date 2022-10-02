import 'package:flutter/material.dart';
import 'package:myapp/router_page.dart';

void main() {
  runApp(HolidaysApp(
    routerPages: RouterPages(),
  ));
}

class HolidaysApp extends StatelessWidget {
  final RouterPages routerPages;
  const HolidaysApp({Key? key, required this.routerPages}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      onGenerateRoute: routerPages.generateRoute,
    );
  }
}
