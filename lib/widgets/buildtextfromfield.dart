import 'package:flutter/material.dart';
class  buildtextfromfield extends StatelessWidget {
  final String hinitText;
  final IconData icon;
 final Function onclick;

  buildtextfromfield({@required  this.onclick,@required this.hinitText,@required this.icon });


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[100]))
      ),
      child: TextFormField(
        validator: (value){
          if(value.isEmpty){
            return "value is Empty";
          }
        },
        onSaved: onclick,
        obscureText: hinitText == 'Enter your password' ? true : false,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hinitText,
            prefixIcon: Icon(
              icon,
              color: Colors.grey[400],
            ),

            hintStyle: TextStyle(color: Colors.grey[400])

        ),

      ),
    );
  }
}