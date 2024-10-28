import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfef/auth/authentificantion.dart';
import '../controlers/profilecontroller.dart';
import '../model/usersmodel.dart';
import 'editprofile.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(profilecontroller());
    return Scaffold(
      backgroundColor: Colors.black,

      body: FutureBuilder(
        future: controller.getuserdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              usermodel userdata = snapshot.data as usermodel;
              final fullname = TextEditingController(text: userdata.fullname);
              final email = TextEditingController(text: userdata.email);
              final age = TextEditingController(text: userdata.age);
              final password = TextEditingController(text: userdata.password);
              final phoneNo = TextEditingController(text: userdata.phonenumber);
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(8.00),
                  child: Column(
                    children: [
                      SizedBox(width: 120, height: 120,
                          child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image(image:AssetImage('assets/images/images.jpg')
                            ),
                          )
                      ),
                      SizedBox(height: 10,),
                      Text( userdata.fullname,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white ,
                            fontSize: 30,
                            fontFamily: 'poppins'
                        ),
                      ),
                      Text(userdata.email,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20,),
                      SizedBox(width: 200,
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(
                              context,
                              PageRouteBuilder(pageBuilder:(_,__,___) =>EditProfile()
                              ));
                        },
                          child: const Text('Edit profile',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide.none,
                              shape: StadiumBorder()
                          ),


                        ),
                      ),
                      SizedBox(height: 30,),
                      const Divider(),
                      SizedBox(height: 10,),

                      ProfileWidget(title: 'settings', icon: Icons.settings, onPress: () {},),

                      ProfileWidget(title: "Billing details", icon: Icons.card_giftcard, onPress: () {},),
                      SizedBox(height: 10,),
                     
                      ProfileWidget(title: "Logout",
                        icon: Icons.logout_outlined,
                        textColor: Colors.red,
                        endIcon: false,
                        onPress: () {
                          authentification.instance.logout();
                        },),



                    ],
                  ),


                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return Center(child: Text("Something went wrong"));
            }
          }

          else {
            return Center(child: CircularProgressIndicator());
          }
        },)

    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key, required this.title,
    required this.icon,
    required this.onPress,
     this.endIcon=true,
    this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;



  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child:  Icon(
          icon ,
          color: Colors.black,
        ),
      ),
      title: Text(title ,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
      ),
      trailing:endIcon?
      Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child:  Icon(
          Icons.arrow_forward_ios,

        ),
      ):null
    );
  }
}
