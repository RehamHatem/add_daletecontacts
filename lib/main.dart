import 'package:assigment_three_flutter/contacts_screen.dart';
import 'package:flutter/material.dart';

void main(){
   runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Contacts.routeName,
      routes: {
        Contacts.routeName:(context) => Contacts(),
      },
    );
  }

}