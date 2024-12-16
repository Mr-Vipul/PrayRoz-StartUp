import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayroz/bindings/general_bindings.dart';
import 'package:prayroz/utils/constants/colors.dart';
// import 'package:prayroz/features/shop/screens/home/widgets/home.dart';
import 'package:prayroz/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      //Show Loader
      initialBinding: GeneralBindings(),
      home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white,),),),
        // OnBoardingScreen()
    );
  }
}
