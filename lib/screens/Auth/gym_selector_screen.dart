import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wigo/screens/Auth/trial_version_screen.dart';
import 'package:wigo/screens/TabBar/bottom_tab_bar_screen.dart';
import 'package:wigo/utils/colors.dart';
import 'package:wigo/widgets/showAwesomeSnackBar.dart';



class GymSelectorScreen extends StatefulWidget {
  GymSelectorScreen({Key? key}) : super(key: key);

  @override
  State<GymSelectorScreen> createState() => _GymSelectorScreenState();
}
int selectedContainer=4;
bool valid=false;






class _GymSelectorScreenState extends State<GymSelectorScreen> {
  @override


  final List<SelectedListItem> _listOfGyms = [
    SelectedListItem(
      name: "Gym 1",
      value: "Gym 1",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Gym 2",
      value: "Gym 2",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Gym 3",
      value: "Gym 3",
      isSelected: false,
    ),
    SelectedListItem(name: "Gym 4"),
    SelectedListItem(name: "Gym 5"),
    SelectedListItem(name: "Gym 6"),
    SelectedListItem(name: "Gym 7"),
    SelectedListItem(name: "Gym 8"),
    SelectedListItem(name: "Gym 9"),
    SelectedListItem(name: "Gym 10"),
    SelectedListItem(name: "Gym 11"),
    SelectedListItem(name: "Gym 12"),
  ];
  String selectedGymName="select";

  void initState() {
    super.initState();
  }
  List gymsName=[
    "Gym 1",
    "Gym 2",
    "Gym 3",
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
                  flex: 2,
                  child: Text("Select one gym to track it!",

                    textAlign: TextAlign.center,
                    style: GoogleFonts.farro(
                        fontWeight: FontWeight.w400,
                        fontSize: 0.03.sh
                    ),),),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap:(){
                  onSelectButtonTap();
                },
                        child: Container
                          (
                          height: 0.07.sh,
                          width: 0.6.sw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.iconColor2.withOpacity(0.5),

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(selectedGymName,style: TextStyle(
                                fontSize: 0.04.sh,
                                color: Colors.white
                              ),)
                              ,
                              Icon(CupertinoIcons.chevron_down,color: Colors.white,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: (){

                        showNormalSnackBar(context, selectedGymName, Colors.black, AppColors.white);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>TrialVersionScreen() ));

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
  void onSelectButtonTap() {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: const Text(
          "Gyms",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: _listOfGyms ?? [],
        selectedItems: (List<dynamic> selectedList) {
setState(() {
  for (var item in selectedList) {
    if (item is SelectedListItem) {
      selectedGymName=(item.name);
    }
  }
  showSnackBar(selectedGymName);
});

        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
