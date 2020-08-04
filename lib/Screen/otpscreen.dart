import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/utils/my_colors.dart';
import 'package:food_delivery/utils/my_text.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber.shade600,
        title: Text("VERIFICATION", style: TextStyle(color: MyColors.grey_80)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MyColors.grey_80),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.amber.shade600,
                      Colors.amber.shade500,
                      Colors.amber.shade400,
                      Colors.amber.shade300,
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 200,
                    child: Column(
                      children: <Widget>[
                        Container(height: 30),
                        Container(
                          child: Image.asset(
                              'assets/images/img_code_verification.png'),
                          width: 200,
                          height: 200,
                        ),
                        Container(
                          width: 220,
                          child: Text(
                            "OTP has been sent to you on your mobile phone. Please enter it below",
                            style: MyText.subhead(context)
                                .copyWith(color: MyColors.grey_60),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(height: 15),
                        Flexible(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: MyText.headline(context).copyWith(
                              color: MyColors.grey_90,
                            ),
                            controller: ctrl,
                          ),
                        ),
                        Container(width: 10),
                        Container(height: 30),
                        Container(
                          width: 200,
                          child: FlatButton(
                            child: Text(
                              "VERIFY",
                              style: TextStyle(color: MyColors.primary),
                            ),
                            color: Colors.transparent,
                            onPressed: () {
                              /* Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DashboardScreen(),
                                  )); */
                            },
                          ),
                        ),
                        Container(
                          width: 200,
                          child: FlatButton(
                            child: Text(
                              "Resend OTP",
                              style: TextStyle(color: MyColors.primary),
                            ),
                            color: Colors.transparent,
                            onPressed: () {},
                          ),
                        )
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
