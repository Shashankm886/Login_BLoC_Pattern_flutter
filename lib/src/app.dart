import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';




class App extends StatelessWidget{
  build(context){
    return Provider(
      //every thing that gets rendered inside the provider gets access to the instance of the bloc created in the provider.dart file right after the creation of the provider class
      child: MaterialApp(
        title: 'Log Me In',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );



    
  }
}