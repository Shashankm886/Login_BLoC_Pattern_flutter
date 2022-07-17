import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget{
  final bloc = Bloc();

  Provider({Key? key, required Widget child}) : super(key: key, child: child);

  // Provider({required Widget child}) : super(child: child); //no idea what this means...quick fix suggest

  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context){
    //i use dependOnInheritedWidgetOfExactType method instead of inheritFromWidgetOfExactType cuz the latter is discontinued as of now..but it's okay kekw
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider).bloc;
    //the above line is for taking the context argument of a widget and climb all the way up the context chain until it finds a widget that is an instance of provider...that is of the general type InheritedWidget...it returns that widget...but it doesnt know the actual type of the widget...that's what 'as Provider' does...for type conversion...then we get the bloc property from that using the .bloc..
  }  
}