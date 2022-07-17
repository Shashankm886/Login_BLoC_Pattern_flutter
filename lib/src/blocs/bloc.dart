import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';


class Bloc with Validators{

  //set up stream controller for the email and password fields
  final _email = BehaviorSubject<String>(); //Beh.Sub. is a rxdart class which is a stream controller essentially but with some more additional properties like being able to access the latest flowing value through a stream which couldnt be made possible with the original stream that dart has to offer
  final _password = BehaviorSubject<String>();

  //we're gonna set up some getters for various purposes
  
  //retrive date from a stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (e, p)=> true); 

  //change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;


  submit (){
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email is $validEmail');
    print('Password is $validPassword');
    
  }


}

// final bloc = Bloc(); //creating single global bloc instance 

