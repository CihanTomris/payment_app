import 'package:flutter/material.dart';
import 'package:payment_app/components/colors.dart';
import 'package:payment_app/widgets/text_size.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            _listBills(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    return Container(
      height: 310,
      child: Stack(
        children: [
          _mainBackground(),
          _curveImageContainer(),
          _buttonContainer(),
        ],
      ),
    );
  }

  _mainBackground() {
    return Positioned(
      bottom: 10,
      left: 0,
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage("images/background.png"),
          ),
        ),
      ),
    );
  }

  _curveImageContainer() {
    return Positioned(
      left: 0,
      right: -2,
      bottom: 10,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/curve.png"),
          ),
        ),
      ),
    );
  }

  _buttonContainer() {
    return Positioned(
        bottom: 10,
        right: 53,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/lines.png")),
              boxShadow: [
                BoxShadow(
                    blurRadius: 15,
                    offset: Offset(0, 1),
                    color: Color(0xFF11324d).withOpacity(0.2)),
              ]),
        ));
  }

  _listBills() {
    return Positioned(
        top: 320,
        child: Container(
          height: 130,
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFd8dbe0),
                  offset: Offset(1, 1),
                  blurRadius: 20.0,
                  spreadRadius: 10,
                )
              ]),
          child: Container(
            margin: const EdgeInsets.only(top: 10, left: 18),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 3, color: Colors.grey),
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage("images/brand1.png"),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "KenGen Power",
                              style: TextStyle(
                                  fontSize: 15, color: AppColor.mainColor, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "ID:846594",
                              style: TextStyle(
                                  fontSize: 15, color: AppColor.idColor, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedText(text: "Auto pay on 24th May 18", color: AppColor.green),
                    const SizedBox(height: 5,),
                  ],
                ),
                Row(
                  children: [],
                )
              ],
            ),
          ),
        ));
  }
}
