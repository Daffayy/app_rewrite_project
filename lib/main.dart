import 'package:bank_mas_rewrite/config.dart';
import 'package:bank_mas_rewrite/initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';



import 'infrastructure/navigation/bindings/navigation.dart';
import 'infrastructure/navigation/bindings/routes.dart';
import 'infrastructure/theme/theme.dart';
import 'infrastructure/translate/translate.dart';


Future<void> main() async {
  await Initializer.init();
  final initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: EnvironmentsBadge(
        child: GetMaterialApp(
          initialRoute: initialRoute,
          getPages: Nav.routes,
          theme: themeData,
          supportedLocales: const [Locale('id'), Locale('en')],
          locale: const Locale('id'),
          translations: Translate(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    final env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
      location: BannerLocation.topStart,
      message: env!,
      color: env == Environments.QAS ? Colors.blue : Colors.purple,
      child: child,
    )
        : SizedBox(child: child);
  }
}

