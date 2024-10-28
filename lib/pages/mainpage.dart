import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../componants/infocard.dart';
import '../componants/sidemenutitle.dart';
import '../model/rivemodel.dart';
import '../utils/riveutils.dart';

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  RiveAsset selectedMenu = sideMenus.first;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Container(
          width: 288,
          height: double.infinity,
          color: Colors.black,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              const infocard(
                name: "akram ousdad",
                profession: "etudiant",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Browse".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                ),
              ),
              ...sideMenus.map(
                    (menu) => sidemenutitle(
                  menu: menu,
                  riveonInit: (artboard) {
                    StateMachineController controller =
                    RiveUtils.getRiveController(
                      artboard,
                      stateMachineName: menu.stateMachineName,
                    );
                    menu.input =
                    controller.findInput<bool>("Active") as SMIBool?;
                  },
                  press: () {
                    menu.input!.value = true;
                    Future.delayed(
                      const Duration(seconds: 1),
                          () => menu.input!.value = false,
                    );
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
            ],
          ),
        ),
      ),





    );
  }
}

