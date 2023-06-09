import 'package:application_docteur/Ecrans/Auth_page.dart';
import 'package:application_docteur/Ecrans/Liste_rendez_vous.dart';
import 'package:application_docteur/Ecrans/details_docteur.dart';
import 'package:application_docteur/Ecrans/reservation_reussi.dart';
import 'package:application_docteur/main_layout.dart';
import 'package:application_docteur/models/auth_model.dart';
import 'package:application_docteur/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:application_docteur/providers/dio_provider.dart';
import 'package:provider/provider.dart';

void main() {
 initializeDateFormatting('fr_FR','en_EN').then((_) {
  runApp(const MyApp());
    
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final navigatorKey = GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider <AuthModel>(
      create: (context) => AuthModel(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          inputDecorationTheme:const InputDecorationTheme(
            focusColor: Config.primaryColor,
            border: Config.outlineBorder,
            focusedBorder: Config.focusBorder,
            errorBorder: Config.errorBorder,
            enabledBorder: Config.outlineBorder,
            floatingLabelStyle: TextStyle(color: Config.primaryColor),
            prefixIconColor: Colors.black38,
            suffixIconColor: Colors.black38
          ),
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Config.primaryColor,
            selectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey.shade700,
            elevation: 10,
            type: BottomNavigationBarType.fixed
          ),
        ),
        initialRoute: "/",
        routes: {
          "/" :(context) => const AuthPage(),
          "main" :(context) => const mainLayout(),
          "Doc_details": (context) => const DetailsDocteur(),
          "ListeRendezVous" : (context) => const ListeRendezVous(),
          "reservationReussie" : (context) => const RendezvousReserver(),
        },
      ),
    );
  }
}
