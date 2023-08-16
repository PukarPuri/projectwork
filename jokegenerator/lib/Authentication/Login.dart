import 'package:flutter/material.dart';
import 'package:jokegenerator/Authentication/Signup.dart';
import 'package:jokegenerator/Authentication/auth_service.dart';
import 'package:jokegenerator/screen/homeScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'Email',
                   border: OutlineInputBorder(),
                 prefixIcon: Icon
                 (Icons.email)
                 ),
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(10),
               child:
                TextField(
                  controller: _passwordController,
                   decoration: InputDecoration(hintText: 'Password',
                   border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.key)
                      ), 
                      ),
             ),
             Padding(
               padding: const EdgeInsets.all(10),
               child: SizedBox( width: double.infinity, height: 40, child: ElevatedButton(  onPressed: () async {
                final message = await AuthService().login(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                if (message!.contains('Success')) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              }, child: Text('Login User'), style: ElevatedButton.styleFrom(backgroundColor: Colors.red),),),
             ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
               Text("Don't have an account?"),
               SizedBox(width: 5),
               InkWell( onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
               }, child: Text('Sign Up', style: TextStyle(color: Colors.blue),))
        ],)
          ],
          
        ),
      ),
    );
  }
}