import 'package:flutter/material.dart';
import 'package:try1/services/auth.dart';
import 'package:try1/shared/constants.dart';
import 'package:try1/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({required this.toggleView});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state

  String email = '';
  String password = '';
  String error = '';
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        elevation: 0.0,
        title: const Text('Sign in to Class App'),foregroundColor: Colors.black,
        actions: [
          TextButton.icon(
            icon: Icon(Icons.person,
                color: Colors.black,
            size: 23),

            label: Text('Register',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            onPressed: () {
              widget.toggleView();
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height:20.0),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val!.isEmpty? 'Enter an email': null,
                  onChanged: (val) {
                  setState(() => email = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password',
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off))),
                obscureText: _isObscure ,
                validator: (val) => val!.length < 6 ? 'Wrong password entered !! ' : null ,
                onChanged: (val){
                  setState(() => password=val);
                },
              ),
              SizedBox(height:20.0),
             ElevatedButton(
               onPressed: () async
               {
                 if(_formKey.currentState!.validate()){
                   setState(() {
                     loading = true;
                   });
                    dynamic result = await _auth.signinwithEmailAndPassword(email, password);
                   if(result == null )
                   {

                     setState(() {
                       error = 'Could not sign in with these credentials ';
                       loading = false;
                     });
                   }
                 }
               }, child: Text('Sign in'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue[500]),
              ),
             ),
              SizedBox(height:20.0),
              Text(error,
                style: TextStyle(color: Colors.black , fontSize: 15.0),
              ),
            ],
          ),
        )
      ),
    );
  }
}
