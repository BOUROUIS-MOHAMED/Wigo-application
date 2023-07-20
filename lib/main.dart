import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wigo/screens/Auth/gym_selector_screen.dart';
import 'package:wigo/screens/Auth/signup_screen.dart';
import 'package:wigo/screens/Coachs/coach_list_screen.dart';
import 'package:wigo/screens/Planning/workout_daily_planification_screen.dart';
import 'package:wigo/screens/Profile/profil_screen.dart';
import 'package:wigo/screens/Settings/about_us_screen.dart';
import 'package:wigo/screens/Settings/setting_main_page.dart';
import 'package:wigo/screens/on_boarding_screens/on_boarding_screen.dart';
import 'package:wigo/utils/constants.dart';
import 'package:wigo/utils/model_theme.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}



class MyApp extends StatefulWidget {



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<void>(
        future: SystemChrome.setPreferredOrientations(
          [

            DeviceOrientation.portraitUp,
          ],
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            print("the phone height:${MediaQuery.of(context).size.height} but the weight:${MediaQuery.of(context).size.width}");
            return ScreenUtilInit(
              designSize: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height ),
              builder: (context, child) {
                return ChangeNotifierProvider(

                  create: (_)=>ModelTheme(),
                    child:  Consumer<ModelTheme>(
                      builder: (context, value, child) {
                        return MaterialApp(
                          title: Constants.appName,
                          debugShowCheckedModeBanner: false,
                          color: Colors.white,
                            theme: ThemeData(
                            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                            useMaterial3: true,),
                          home: OnBoardingScreen(),
                        );
                      }
                    )
                );}
                );
              },
            );

        }
  }
