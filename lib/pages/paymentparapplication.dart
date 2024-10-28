import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfef/controlers/profilecontroller.dart';
import 'package:pfef/pages/hold.dart';
import 'package:pfef/model/usersmodel.dart';
import 'package:pfef/auth/userrepo.dart';

class paiement_par_Application extends StatefulWidget {
  const paiement_par_Application({Key? key}) : super(key: key);

  @override
  State<paiement_par_Application> createState() => _signinState();
}

class _signinState extends State<paiement_par_Application> {
  final controller = Get.put(profilecontroller());
  final amountController = TextEditingController();
  final accountNameController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    accountNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Payment with Application"),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<usermodel>(
        future: controller.getuserdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              usermodel userdata = snapshot.data!;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    TextField(
                      controller: accountNameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Account Email',
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      controller: amountController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'The Amount',
                      ),
                    ),
                    SizedBox(height: 12),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                      ),
                      onPressed: () async {
                        double enteredAmount = double.parse(amountController.text);
                        if(double.parse(amountController.text) < double.parse(userdata.accountbalance)){
                          if (userdata.accountbalance == userdata.oldbalance) {
                          // Update the accountbalance directly
                         double newBalance = double.parse(userdata.accountbalance) - enteredAmount;
                       await controller.updateUserBalance(userdata.id!, newBalance);
                         usermodel recipientUser = await controller.getuserdetail(accountNameController.text);
                       double recipientNewBalance = double.parse(recipientUser.accountbalance) + enteredAmount;
                              await controller.updateUserBalance(recipientUser.id!, recipientNewBalance);
                              } else {
    // Update the oldbalance with the current accountbalance value
                                   await controller.updateUserOldBalance(userdata.id!, userdata.accountbalance);

    // Update the accountbalance with the new value
                                  double newBalance = double.parse(userdata.accountbalance) - enteredAmount;
                               await controller.updateUserBalance(userdata.id!, newBalance);
                             usermodel recipientUser = await controller.getuserdetail(accountNameController.text);
                          await controller.updateUserOldBalance(recipientUser.id!,recipientUser.accountbalance);
                         double recipientNewBalance = double.parse(recipientUser.accountbalance) + enteredAmount;
                          await controller.updateUserBalance(recipientUser.id!, recipientNewBalance);
                          } }
                        else{Get.snackbar(
                          "erreur",
                          "you dont have enough money",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.blue.withOpacity(0.1),
                          colorText: Colors.red,
                        );

                        }

                        // Check if accountbalance is equal to oldbalance


                        // Update the recipient's balance


                        Get.offAll(() => hold());
                      },
                      label: Text("Continue"),
                      icon: Icon(Icons.navigate_next),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
