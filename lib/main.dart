import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:perfection_company_task/Service/Storage_service/storage_service.dart';
import 'package:perfection_company_task/View/Login/login_screen.dart';
import 'package:perfection_company_task/View/User_Details/user_details_screen.dart';
import 'package:perfection_company_task/generated/l10n.dart';
import 'Binding/initial.dart';
import 'Core/app_theme/Theme.dart';
import 'View/Splash/splash_screen.dart';


void main() async{


  // Ensure plugin services are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetStorage
  await GetStorage.init();
  print(StorageService.getUserData(languageKey));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) {
        return GetMaterialApp(
          locale: StorageService.getUserData(languageKey) ? Locale('ar') : Locale('en'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          // locale: Locale('ar'),
          initialBinding: InitialBindings(),
          theme: AppTheme.ligthTheme,
          home: SplashScreen(),
        );
      },
    );
  }
}

