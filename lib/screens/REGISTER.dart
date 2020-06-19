import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../widgets/animation.dart';
import '../widgets/buildtextfromfield.dart';
import '../serives/auth.dart';
import '../provide/modelhud.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignupScreen extends StatelessWidget{
  static String id ="SignupScreen";
  @override
  Widget build(BuildContext context) {
    String name;
    String email;
    String password;
    String repassword;
    final GlobalKey<FormState> _globalkey=new GlobalKey<FormState>();
    // TODO: implement build
  return   Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD
          (inAsyncCall: Provider.of<ModelHud>(context).isLoading,
          child: Form(
              key: _globalkey,
              child:
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
                              child: Text("Regisiter", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
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
                          child: Column(
                            children: <Widget>[
                              buildtextfromfield(onclick: (value){
                                name=value;
                              },hinitText: "Enter your name",icon: Icons.people),
                              buildtextfromfield(onclick: (value){
                                email=value;
                              },hinitText: "Enter your Email",icon: Icons.email),
                              buildtextfromfield(onclick: (value){
                                password=value;
                              },hinitText: "Enter your Repassword",icon: Icons.lock),
                              buildtextfromfield(onclick: (value){
                                repassword=value;
                              },hinitText: "please write again password",icon: Icons.email)

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
                          child: Builder(
                              builder: (context) =>
                                  Center(
                              child:  GestureDetector(child:
                              Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                onTap: () async{
                                  final modelhud =
                                  Provider.of<ModelHud>(context, listen:false);


                                  if (_globalkey.currentState.validate()) {
                                    modelhud.changeisLoading(true);
                                    try {
                                      _globalkey.currentState.save();
                                      final reslut = await Auth().signUp(
                                          email, password).then((value) {
                                        modelhud.changeisLoading(false);
                                        Fluttertoast.showToast(
                                          msg: "saved",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,

                                        );
                                      });
                                      print(reslut.user.uid.toString());

                                    }
                                    on PlatformException catch (e) {
                                      modelhud.changeisLoading(false);
                                      /*    Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(e.message),
                                  ));
*/
                                      Fluttertoast.showToast(
                                        msg: e.message,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,

                                      );
                                    }
                                  }
//                                modelhud.changeisLoading(false);

                                  //final reslut=   await Auth().signUp(email, password);
                                  // print(reslut.user.uid.toString());
                                },)
                          )),
                        )),
                        SizedBox(height: 70,),
                        FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
        )   );
  }

}