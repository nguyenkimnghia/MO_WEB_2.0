import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/controllers/blocs/locazation/locazation.exports.dart';
import 'package:moffice_web/controllers/navigator/navigator.exports.dart';
import 'package:moffice_web/core/config/web_config.dart';
import 'package:moffice_web/di/di.exports.dart';
import 'package:moffice_web/helpers/locale/app_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';


void main() async {
  await dotenv.load(fileName: "lib/configuration/.env");
  await WebConfig().config();
  runApp(
      MultiBlocProvider(
        providers: [BlocProvider<LocazationBloc>(create: (_) => LocazationBloc())],
        child: EasyDynamicThemeWidget(
          child: const MyApp(),
        ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocazationBloc, LocazationInitial>(
        builder: (context, state) {
      return MaterialApp.router(
        // Thuộc tính set title cho web
          title: IdentifierConst.webName,
          // Thuộc tính set đa ngôn ngữ
          locale: Locale(state.local),
          key: AppInjector.injector<MainNavigator>().navigatorKey,
          //config main navigator
          supportedLocales: state.supportedLanguages
              .map((language) => Locale(language.locale!, language.code))
              .toList(),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          // Thuộc tính off mode debug web
          debugShowCheckedModeBanner: false,
          // Thuộc tính định tuyển router của web
          routeInformationProvider: WebRouter.router.routeInformationProvider,
          routeInformationParser: WebRouter.router.routeInformationParser,
          routerDelegate: WebRouter.router.routerDelegate,
          // Thuộc tính set theme cho website
          theme: WebThemes.getLightTheme(),
          darkTheme: WebThemes.getDarkTheme(),
          themeMode: EasyDynamicTheme.of(context).themeMode,
          // Config show loading web
          builder: EasyLoading.init(builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          }));
    });
  }
}
