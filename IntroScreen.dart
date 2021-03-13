import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {


  final auth = FirebaseAuth.instance;
  String _email , _password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 32),
            child: Column(
              children: [
                Container(height: 100,width: 100,
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: CircleAvatar(child: Image.asset('images/profile.png',fit: BoxFit.contain)
                    ,
                  ),
                ),

                Text('Welcome ! ', style: TextStyle(
                  fontWeight: FontWeight.w900,fontSize: 30,color: Colors.lightBlue,letterSpacing: 1.2
                ),),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: TextField(
                      decoration: InputDecoration(
                        icon:Icon( Icons.perm_contact_cal_rounded,color: Colors.lightBlue,),hintText: 'Email',border: InputBorder.none,labelText: 'Email',
                      ),
                      onChanged: (value){
                        setState(() {
                          _email=value;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: TextField(
                      decoration: InputDecoration(
                        icon:Icon( Icons.vpn_key_outlined,color: Colors.lightBlue,),hintText: 'Password',border: InputBorder.none,labelText: 'Password',
                      ),
                      onChanged: (value){
                        _password=value;
                      },
                    ),

                  ),
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      auth.signInWithEmailAndPassword(email: _email, password: _password);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(
                        child: Text(
                          'Login',textAlign: TextAlign.center,style: TextStyle(
                          fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                FlatButton(
                  onPressed: () {},
                  child: Text('Don`t Have An Account?',style: TextStyle(
                    fontWeight: FontWeight.w500,fontSize: 18,color: Colors.grey
                  ),),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
