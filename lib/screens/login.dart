
import 'package:learning/screens/REGISTER.dart';
import 'package:learning/screens/catageory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning/provide/modelhud.dart';
import 'package:provider/provider.dart';
import '../widgets/animation.dart';
import 'package:learning/widgets/buildtextfromfield.dart';
import '../serives/auth.dart';
import '../provide/adminmode.dart';
class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  String email;
  String password;
  final adminPassword = 'Admin1234';
  final GlobalKey<FormState> _globalkey=new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
  {
    // TODO: implement build

    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
            key: _globalkey
            ,child:
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(1, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/er.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.3, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/err.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.5, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/apple.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text("Login", style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.8, Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child:
                        Column(
                          children: <Widget>[
                            buildtextfromfield(onclick: (value){
                              email=value;
                            },hinitText: "Enter your Email",icon: Icons.email),

                            buildtextfromfield(onclick: (value){
                              password=value;
                            },hinitText: "Enter your password",icon: Icons.lock)
                          ],
                        ),
                      )),
                      SizedBox(height: 30,),
                      FadeAnimation(2, Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ]
                            )
                        ),
                        child:  Center(
                            child:  GestureDetector(child:
                            Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              onTap: ()=>_validate(context))
                        ),
                      )),
                      SizedBox(height: 30,),
  Padding(
  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
  child: Row(
  children: <Widget>[
  Expanded(
  child: GestureDetector(
  onTap: () {
  Provider.of<AdminMode>(context, listen: false)
      .changeIsAdmin(true);
  },
  child: Text(
  'i\'m an admin',
  textAlign: TextAlign.center,
  style: TextStyle(
  color: Provider.of<AdminMode>(context).isAdmin
  ?
  Colors.white:   Color.fromRGBO(143, 148, 251, 1)     ),
  ),
  ),
  ),
  Expanded(
  child: GestureDetector(
  onTap: () {
  Provider.of<AdminMode>(context, listen: false)
      .changeIsAdmin(false);
  },
  child: Text(
  'i\'m a user',
  textAlign: TextAlign.center,
  style: TextStyle(
  color:
  Provider.of<AdminMode>(context, listen: true)
      .isAdmin
  ?  Color.fromRGBO(143, 148, 251, 1):Colors.white
        ),
    ),
    ),
    ),])),
                      SizedBox(height: 10,),

                      FadeAnimation(1.5,
                          Text("Forgot Password?", style: TextStyle(color: Color
                              .fromRGBO(143, 148, 251, 1)),)),
                    ],
                  ),
                )

              ],
            ),
          ),
        )
  )
        );
  }
  void _validate(BuildContext context) async {
    final modelhud = Provider.of<ModelHud>(context, listen: false);
    modelhud.changeisLoading(true);

    if (_globalkey.currentState.validate()) {
      _globalkey.currentState.save();
      if (Provider.of<AdminMode>(context, listen: false).isAdmin) {
        if (password == adminPassword) {
          try {
            await Auth().signIn(email.trim(), password.trim());
            Navigator.pushNamed(context, SignupScreen.id);
          } catch (e) {

            modelhud.changeisLoading(false);
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(e.message),
            ));
          }
        } else {
          modelhud.changeisLoading(false);

        }
      } else {
        try {
          await Auth().signIn(email.trim(), password.trim());
          Navigator.pushNamed(context, Catageory.id);
        } catch (e) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(e.message),
          ));
        }
      }
    }
    modelhud.changeisLoading(false);
  }

}



