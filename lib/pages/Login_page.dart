import 'package:flutter/material.dart';
import 'package:catalog_app/utils/routes.dart';
//import 'package:catalog_app/utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(
        Duration(seconds: 1),
      );
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              Text(
                'Welcome $name',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: " Enter Username",
                  labelText: "Username",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Username cannot be empty";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: " Enter Password",
                  labelText: "Password",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return " Password cannot be empty";
                  } else if (value.length < 6) {
                    return "Password length should be atleast 6";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                splashColor: Colors.deepPurple.shade500,
                onTap: () => moveToHome(context),
                child: AnimatedContainer(
                  width: changeButton ? 50 : 150,
                  height: 40,
                  alignment: Alignment.center,
                  child: changeButton
                      ? Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                  decoration: BoxDecoration(
                      color: context.theme.buttonColor,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8)),
                  duration: Duration(seconds: 1),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Navigator.push(context,
              //     //     MaterialPageRoute(builder: (context) => HomePage()));
              //     Navigator.pushNamed(context, MyRoutes.homeRoute);
              //   },
              //   child: Text('Login'),
              //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
