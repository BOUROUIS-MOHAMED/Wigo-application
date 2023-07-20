import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wigo/screens/Auth/gym_selector_screen.dart';
import 'package:wigo/utils/colors.dart';
import 'package:wigo/widgets/showAwesomeSnackBar.dart';



class GenderSelectorScreen extends StatefulWidget {
   GenderSelectorScreen({Key? key}) : super(key: key);

  @override
  State<GenderSelectorScreen> createState() => _GenderSelectorScreenState();
}
int selectedContainer=4;
bool valid=false;






class _GenderSelectorScreenState extends State<GenderSelectorScreen> {
@override
  void initState() {
    super.initState();
  }
List genders=[
  "Male",
  "Female",
  "Other",
];
List gendersEmoji=[
  Iconsax.man,
  Iconsax.woman,
  Iconsax.information
];


  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.transparent,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 1.sw,
          height: 1.sh,
          child:Column(
            children: [
              Expanded(
                flex: 3,
                child: Text("What is your\ngender?",

                textAlign: TextAlign.center,
                style: GoogleFonts.farro(
                    fontWeight: FontWeight.w400,
                    fontSize: 0.03.sh
                ),),),
              Expanded(
               flex: 3,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,

                          physics: NeverScrollableScrollPhysics(),
                          itemCount: genders.length,

                          itemBuilder:(context, index)  {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      selectedContainer=index;
                                      if (selectedContainer<3) {
                                        valid=true;
                                      }
                                    });
                                  },
                                  child: Container(

                                    width: 0.9.sw,
                                    height: 0.1.sh,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:index==selectedContainer? AppColors.mainColor:AppColors.gray,
                                          width:index==selectedContainer? 3:1
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: ListTile(
                                        leading: Icon(gendersEmoji[index],color: Colors.amber),
                                        title: Text(genders[index].toUpperCase(),style: GoogleFonts.farro(
                                            fontSize: 0.015.sh
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                      ),
                    ),


                  ],
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: (){
                    if (valid&&selectedContainer<3) {
                      showNormalSnackBar(context, genders[selectedContainer], Colors.black, AppColors.white);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>GymSelectorScreen() ));
                    }
                  },
                  child: Container(

                    width: 0.9.sw,
                    height: 0.08.sh,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Center(child: Text("Next",style: TextStyle(
                      color: Colors.white,
                      fontSize: 0.03.sh
                    ),)),
                  ),
                ),
              )

            ],
          )

          ),
      ),
      
    );
  }
}
