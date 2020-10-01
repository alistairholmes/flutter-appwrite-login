import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_appwrite_demo/components/rounded_btn/rounded_btn.dart';
import 'package:flutter_appwrite_demo/ui/login/login.dart';
import 'package:flutter_appwrite_demo/ui/success/success.dart';
import 'package:flutter_appwrite_demo/utils/auth/auth_state.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Color(0xfff02e65),
      inAsyncCall: showSpinner,
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffffffff),
        ),
        backgroundColor: Color(0xffffffff),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                    width: 175,
                    height: 100,
                    child: SvgPicture.asset('images/welcome.svg')),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Please fill the input below.',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'E-mail',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      style: (TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400)),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      cursorColor: Color(0xfff02e65),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.grey[300],
                        filled: true,
                        prefixIcon: Icon(Icons.email, color: Colors.grey[500]),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xfff02e65), width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Password',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (value) {
                        password = value;
                      },
                      style: (TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400)),
                      obscureText: true,
                      cursorColor: Color(0xfff02e65),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.grey[300],
                        filled: true,
                        prefixIcon:
                            Icon(Icons.lock_outline, color: Colors.grey[500]),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xfff02e65), width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: RoundedButton(
                    btnText: 'SIGN UP',
                    color: Color(0xfff02e65),
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        AuthState state =
                            Provider.of<AuthState>(context, listen: false);
                        state.createAccount(email, password);
                        if (state != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SuccessScreen()));
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                        color: Colors.grey[600], fontWeight: FontWeight.w400),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text('Sign in',
                        style: TextStyle(
                          color: Color(0xfff02e65),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
