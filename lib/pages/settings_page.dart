import 'package:flutter/material.dart';
import '../objects/custom_navigation_bar.dart';
import '../objects/custom_app_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learning_hub/backend.dart';

class SettingsPage extends StatefulWidget {
  //takes in the widget's arguments
  final GoogleSignInAccount account;

  SettingsPage({this.account});

  @override
  //initialises the settings page state
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  Widget build(BuildContext context) {
    GoogleSignInAccount account = widget.account;
    //checks if the user is signed in, if not, they are signed in
    return account == null
        ? FutureBuilder(
            future: signIn(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                account = snapshot.data;
                return CustomScaffold.create(context, account);
              } else {
                //whilst signing in, return a loading indicator
                return Scaffold(
                    appBar: CustomAppBar.create(context, "Settings"),
                    body: Center(child: CircularProgressIndicator()),
                    bottomNavigationBar:
                        CustomNavigationBar.create(context, account, 4));
              }
            })
        : CustomScaffold.create(context, account);
  }
}

//details the looks of the page
class CustomScaffold {
  static Scaffold create(BuildContext context, GoogleSignInAccount account) {
    return new Scaffold(
        //returns the custom app bar with the settings page title
        appBar: CustomAppBar.create(context, "Settings"),
        //builds the body
        body: Center(child: Text(account.email)),
        //builds the navigation bar for the given page
        bottomNavigationBar: CustomNavigationBar.create(context, account, 4));
  }
}
