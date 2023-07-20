import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:wigo/screens/Notifications/notification_list_screen.dart';
import 'package:wigo/utils/colors.dart';
import 'package:wigo/widgets/round_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List waterArr = [
    {"title": "6am - 8am", "subtitle": "600ml"},
    {"title": "9am - 11am", "subtitle": "500ml"},
    {"title": "11am - 2pm", "subtitle": "1000ml"},
    {"title": "2pm - 4pm", "subtitle": "700ml"},
    {"title": "4pm - now", "subtitle": "900ml"},
  ];

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          body: Container(
            height: 1.sh
            ,
            width: 1.sw,
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: .03.sw,vertical: 0.02.sh),
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back,",
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            Text(
                              "Hama",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NotificationView(),
                                ),
                              );
                            },
                            icon: Icon(Iconsax.notification))
                      ],
                    ),

                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: const Color(0xffFFE5E5),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/emoji/date_notifi.png",
                                width: 30,
                                height: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Reminder!",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Next Photos Fall On July 08",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ]),
                            ),
                            Container(
                                height: 60,
                                alignment: Alignment.topRight,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.grey,
                                      size: 15,
                                    )))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height:  0.05.sw,
                    ),
                    Container(
                      height: 0.4.sw,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: AppColors. primaryG),
                          borderRadius: BorderRadius.circular( 0.075.sw)),
                      child: Stack(alignment: Alignment.center, children: [
                        Image.asset(
                          "assets/emoji/bg_dots.png",
                          height: 0.4.sw,
                          width: double.maxFinite,
                          fit: BoxFit.fitHeight,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "BMI (Body Mass Index)",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "You have a normal weight",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 0.05.sw,
                                  ),
                                  SizedBox(
                                      width: 120,
                                      height: 35,
                                      child: RoundButton(
                                          title: "View More",
                                          type: RoundButtonType.bgSGradient,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          onPressed: () {}))
                                ],
                              ),
                              AspectRatio(
                                aspectRatio: 1,
                                child: PieChart(
                                  PieChartData(
                                    pieTouchData: PieTouchData(
                                      touchCallback:
                                          (FlTouchEvent event, pieTouchResponse) {},
                                    ),
                                    startDegreeOffset: 250,
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 1,
                                    centerSpaceRadius: 0,
                                    sections: showingSections(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 0.05.sw,
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height:  0.95.sw,
                            padding: const EdgeInsets.symmetric(
                                vertical: 25, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(color: Colors.black12, blurRadius: 2)
                                ]),
                            child: Row(
                              children: [
                                SimpleAnimationProgressBar(
                                  height:  0.85.sw,
                                  width:  0.07.sw,
                                  backgroundColor: Colors.grey.shade100,
                                  foregrondColor: Colors.purple,
                                  ratio: 0.5,
                                  direction: Axis.vertical,
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  duration: const Duration(seconds: 3),
                                  borderRadius: BorderRadius.circular(15),
                                  gradientColor: LinearGradient(
                                      colors: AppColors.primaryG,
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Water Intake",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        ShaderMask(
                                          blendMode: BlendMode.srcIn,
                                          shaderCallback: (bounds) {
                                            return LinearGradient(
                                                colors: AppColors.primaryG,
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight)
                                                .createShader(Rect.fromLTRB(
                                                0, 0, bounds.width, bounds.height));
                                          },
                                          child: Text(
                                            "4 Liters",
                                            style: TextStyle(
                                                color: Colors.white.withOpacity(0.7),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Real time updates",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: waterArr.map((wObj) {
                                            var isLast = wObj == waterArr.last;
                                            return Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin:
                                                      const EdgeInsets.symmetric(
                                                          vertical: 4),
                                                      width: 10,
                                                      height: 10,
                                                      decoration: BoxDecoration(
                                                        color: AppColors.secondaryColor1
                                                            .withOpacity(0.5),
                                                        borderRadius:
                                                        BorderRadius.circular(5),
                                                      ),
                                                    ),
                                                    if (!isLast)
                                                      DottedDashedLine(
                                                          height:  0.078.sw,
                                                          width: 0,
                                                          dashColor: AppColors
                                                              .secondaryColor1
                                                              .withOpacity(0.5),
                                                          axis: Axis.vertical)
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      wObj["title"].toString(),
                                                      style: TextStyle(
                                                        color: AppColors.gray,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                    ShaderMask(
                                                      blendMode: BlendMode.srcIn,
                                                      shaderCallback: (bounds) {
                                                        return LinearGradient(
                                                            colors:
                                                            AppColors.secondaryG,
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .centerRight)
                                                            .createShader(Rect.fromLTRB(
                                                            0,
                                                            0,
                                                            bounds.width,
                                                            bounds.height));
                                                      },
                                                      child: Text(
                                                        wObj["subtitle"].toString(),
                                                        style: TextStyle(
                                                            color: AppColors.white
                                                                .withOpacity(0.7),
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            );
                                          }).toList(),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width:  0.05.sw,
                        ),
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: double.maxFinite,
                                  height:  0.45.sw,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 25, horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: const [
                                        BoxShadow(color: Colors.black12, blurRadius: 2)
                                      ]),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sleep",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        ShaderMask(
                                          blendMode: BlendMode.srcIn,
                                          shaderCallback: (bounds) {
                                            return LinearGradient(
                                                colors: AppColors.primaryG,
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight)
                                                .createShader(Rect.fromLTRB(
                                                0, 0, bounds.width, bounds.height));
                                          },
                                          child: Text(
                                            "8h 20m",
                                            style: TextStyle(
                                                color: Colors.white.withOpacity(0.7),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14),
                                          ),
                                        ),
                                        const Spacer(),
                                        Image.asset("assets/img/sleep_grap.png",
                                            width: double.maxFinite,
                                            fit: BoxFit.fitWidth)
                                      ]),
                                ),
                                SizedBox(
                                  height: 0.05.sw,
                                ),
                                Container(
                                  width: double.maxFinite,
                                  height:  0.45.sw,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 25, horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: const [
                                        BoxShadow(color: Colors.black12, blurRadius: 2)
                                      ]),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Calories",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        ShaderMask(
                                          blendMode: BlendMode.srcIn,
                                          shaderCallback: (bounds) {
                                            return LinearGradient(
                                                colors: AppColors.primaryG,
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight)
                                                .createShader(Rect.fromLTRB(
                                                0, 0, bounds.width, bounds.height));
                                          },
                                          child: Text(
                                            "760 kCal",
                                            style: TextStyle(
                                                color: Colors.yellowAccent,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14),
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            width:  0.2.sw,
                                            height:  0.2.sw,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  width: 0.15.sw,
                                                  height:  0.15.sw,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: AppColors.primaryG),
                                                    borderRadius: BorderRadius.circular(
                                                        0.075.sw),
                                                  ),
                                                  child: FittedBox(
                                                    child: Text(
                                                      "230kCal\nleft",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

        ));
  }
}
List<PieChartSectionData> showingSections() {
  return List.generate(
    2,
        (i) {
      var color0 = AppColors.secondaryColor1;

      switch (i) {
        case 0:
          return PieChartSectionData(
              color: color0,
              value: 33,
              title: '',
              radius: 55,
              titlePositionPercentageOffset: 0.55,
              badgeWidget: const Text(
                "20,1",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ));
        case 1:
          return PieChartSectionData(
            color: Colors.white,
            value: 75,
            title: '',
            radius: 45,
            titlePositionPercentageOffset: 0.55,
          );

        default:
          throw Error();
      }
    },
  );
}
