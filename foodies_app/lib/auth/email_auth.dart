import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodies_app/views/splash_screen.dart';

import 'package:lottie/lottie.dart';
import 'package:email_auth/email_auth.dart';
class EmailHome extends StatefulWidget {
  EmailHome({Key? key}) : super(key: key);

  @override
  State<EmailHome> createState() => _EmailHomeState();
}

class _EmailHomeState extends State<EmailHome> {
  TextEditingController otpSender=TextEditingController();
  TextEditingController otpVerifier=TextEditingController();
  bool otpVisibility = false;
  // bool submitValid = false;
    EmailAuth? emailAuth;
    @override
  void initState() {
    // TODO: implement initState
     emailAuth =  EmailAuth(
      sessionName: "Foodies",
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.light
        ),
        backgroundColor: Colors.white,
        elevation:0.0
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Lottie.asset('assets/images/email_verify.json',height: 250,width: 500),
           
              SizedBox(height: 15.0),

           
             Text(
                    otpVisibility ? "Enter Otp" : "Email Verification",
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,right: 8.0),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: otpSender,
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.teal),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                            borderRadius: BorderRadius.circular(25)),
                        
                      ),
                     
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Visibility(
                    child: Padding(
                      padding: const EdgeInsets.only(left :40.0,right: 40.0),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: otpVerifier,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(   
                            borderSide: BorderSide(color: Colors.teal)
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)
                          ),
                          hintText: 'Enter OTP',
                          prefix: Padding(
                            padding: EdgeInsets.all(4),
                            child: Text(''),
                          ),
                        ),
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    visible: otpVisibility,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 20,
                    color: Colors.deepPurple,
                    onPressed: () {
                      if (otpVisibility) {
                        verifyOTP();
                      } else {
                        sendOTP();
                      }
                    },
                    child: Text(
                      otpVisibility ? "Verify" : "Send OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
            ],
          ),
        ),
      ),

    );
  }
  void sendOTP()async{
   var  result = await emailAuth!.sendOtp(
        recipientMail: otpSender.value.text, otpLength: 5);
    if (result) {}
    setState(() {
      otpVisibility = true;
    });
  }
  void verifyOTP(){
   var result = emailAuth!.validateOtp(recipientMail:otpSender.value.text , userOtp: otpVerifier.value.text);
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SplashHome()));
  }
  }
