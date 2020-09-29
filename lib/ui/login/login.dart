import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_appwrite_demo/components/rounded_btn/rounded_btn.dart';
import 'package:flutter_appwrite_demo/ui/create_account/create_account.dart';
import 'package:flutter_appwrite_demo/ui/success/success.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showSpinner = false;
  //final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Color(0xfff02e65),
      inAsyncCall: showSpinner,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomPadding: true,
          backgroundColor: Color(0xffFFFFFF),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                      width: 175,
                      height: 175,
                      child: SvgPicture.asset('images/welcome.svg')),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 8),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Please sign in to continue.',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
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
                          style: (TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400)),
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.white,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.grey[300],
                            filled: true,
                            prefixIcon: Icon(Icons.email),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xfff02e65), width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                      ],
                    ),
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
                        style: (TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400)),
                        obscureText: true,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          prefixIcon: Icon(Icons.lock_outline),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xfff02e65), width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: RoundedButton(
                      btnText: 'LOGIN',
                      color: Color(0xfff02e65),
                      onPressed: () async {
                        // Add login code
                        setState(() {
                          showSpinner = true;
                        });
                        /*try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
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
                        }*/
                      },
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0xfff02e65)),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account?',
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.w400),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateAccount()));
                      },
                      child: Text('Sign up',
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
      ),
    );
  }
}
