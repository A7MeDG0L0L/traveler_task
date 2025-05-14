import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveler_task/constants/app_theme.dart';
import 'package:traveler_task/screens/items_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => print(value.options.projectId));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900), // Base design size for web
      minTextAdapt: true,
      splitScreenMode: true,
      // Set minimum font size and scale factor for better mobile experience
      builder: (context, child) {
        return MaterialApp(
          title: 'Traveler Task',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          builder: (context, child) {
            // Apply responsive framework first
            child = ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            );

            // Apply additional scaling for mobile
            final mediaQuery = MediaQuery.of(context);
            final width = mediaQuery.size.width;

            // Apply minimum text scaling factor for small screens
            if (width < 450) {
              return MediaQuery(
                data: mediaQuery.copyWith(
                  textScaler: const TextScaler.linear(1.1),
                ),
                child: child,
              );
            }

            return child;
          },
          home: const ItemsScreen(),
        );
      },
    );
  }
}
