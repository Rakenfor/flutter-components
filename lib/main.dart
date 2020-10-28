import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//Propios
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components APP',
      // home: HomPage(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('en', 'US'), const Locale('es', 'ES')],
      initialRoute: '/',
      routes: getAplicationRoutes(),

      onGenerateRoute: (RouteSettings settings) {
        print('Ruta llamada: ${settings.name}');

        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
