import 'package:first_app/googleSheet/controllers/googleSheets.dart';
import 'package:first_app/screens/home_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
  SheetFlutter.init();
}

class MyApp extends StatelessWidget{
const MyApp({super.key});
@override
  Widget build(BuildContext context){
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData( colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3:true
    ),
    home: HomePage(),
  );
}
}