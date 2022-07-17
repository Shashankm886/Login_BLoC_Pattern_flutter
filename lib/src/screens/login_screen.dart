import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';


class LoginScreen extends StatelessWidget {
  Widget build (context){

    final bloc = Provider.of(context);
    //the provider class has a static function 'of' that can be called without making an instance of provider...we call that function, pass in the context of the login screen widget....the function looks up the herirarchy and finds the nearest instance of provider....pulls of the bloc property from it and returns it and it gets assigned to the local variable of the bloc right here
    //note that the of function returns a variable of type Bloc..so it's actually the bloc property

    
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 25.0)),
          submitButton(bloc),
        ],
      ),
    );
  }
}

Widget emailField(Bloc bloc){
  return StreamBuilder(
    stream: bloc.email,
    builder: (context, snapshot){
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error?.toString(),
        ),
      );
    },
  );
}

Widget passwordField(Bloc bloc){

 return StreamBuilder(
    stream: bloc.password,
    builder: (context, snapshot) {
      return TextField(
        onChanged: bloc.changePassword,
        decoration:InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          errorText: snapshot.error?.toString(),
        ),
      );
    },
  );

  
}

Widget submitButton(Bloc bloc){
  return StreamBuilder(
    stream: bloc.submitValid,
    builder: (context, snapshot){
      return RaisedButton(
        child: Text('Login'),
         color: Colors.blue,
        onPressed: snapshot.hasData ? bloc.submit : null ,
        //we could have also used the hasError method which would have worked almsot the same way except for the fact that it would have made so taht the button would have been enabled by default to start off cuz it's false in the beginning...hasData fixes this thing
      );
    },
  );


  

}