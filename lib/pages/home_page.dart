import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/components/colors.dart';
import 'package:payment_app/controllers/data_controller.dart';
import 'package:payment_app/pages/payment_page.dart';
import 'package:payment_app/widgets/buttons.dart';
import 'package:payment_app/widgets/large_buttons.dart';
import 'package:payment_app/widgets/text_size.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DataController _controller = Get.put(DataController());
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
            Obx(() {
              if (_controller.loading == false) {
                return Center(
                  child: Container(
                      height: 75,
                      width: 75,
                      child: CircularProgressIndicator()),
                );
              } else {
                return _listBills();
              }
            }),
            _payButton(),
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
          _textContainer(),
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
        decoration: const BoxDecoration(
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
        decoration: const BoxDecoration(
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
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet<dynamic>(
                barrierColor: Colors.transparent,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                    height: MediaQuery.of(context).size.height - 240,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 300,
                            color: const Color(0xFFeef1f4).withOpacity(0.7),
                          ),
                        ),
                        Positioned(
                            right: 53,
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.only(top: 10, bottom: 20),
                              width: 60,
                              height: 250,
                              decoration: BoxDecoration(
                                color: AppColor.mainColor,
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppButtons(
                                    icon: Icons.cancel,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  AppButtons(
                                    icon: Icons.add,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    text: "Add Bill",
                                    onTap: () {},
                                  ),
                                  AppButtons(
                                    icon: Icons.history,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    text: "History",
                                    onTap: () {},
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  );
                });
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("images/lines.png")),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      offset: Offset(0, 1),
                      color: Color(0xFF11324d).withOpacity(0.2)),
                ]),
          ),
        ));
  }

  _listBills() {
    return Positioned(
        top: 320,
        left: 0,
        right: 0,
        bottom: 0,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
              itemCount: _controller.list.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 20, right: 20),
                  height: 130,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: const BoxDecoration(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3, color: Colors.grey),
                                    image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: AssetImage(
                                          _controller.list[index]["img"]),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _controller.list[index]["brand"],
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: AppColor.mainColor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "ID:" + _controller.list[index]["id"],
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: AppColor.idColor,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedText(
                                text: _controller.list[index]["more"],
                                color: AppColor.green),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _controller.list[index]["status"] =
                                        !_controller.list[index]["status"];
                                    _controller.list.refresh();
                                    print(_controller.newList.length);
                                  },
                                  child: Container(
                                    width: 80,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: _controller.list[index]
                                                  ["status"] ==
                                              false
                                          ? AppColor.selectBackground
                                          : AppColor.green,
                                    ),
                                    child: Center(
                                        child: Text(
                                      "Select",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: _controller.list[index]
                                                      ["status"] ==
                                                  false
                                              ? AppColor.selectColor
                                              : Colors.white),
                                    )),
                                  ),
                                ),
                                Expanded(child: Container()),
                                Text(
                                  "\$" + _controller.list[index]["due"],
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColor.mainColor,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  "Due in 3 days",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColor.idColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 35,
                              width: 5,
                              decoration: BoxDecoration(
                                  color: AppColor.halfOval,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ));
  }

  _payButton() {
    return Positioned(
        bottom: 10,
        child: AppLargeButton(
          text: "Pay all bills",
          textColor: Colors.white,
          onTap: () {
            Get.to(() => const PaymentPage());
          },
        ));
  }

  _textContainer() {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 110,
          child: Text(
            "My Bills",
            style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Color(0xFF293952)),
          ),
        ),
        Positioned(
          left: 40,
          top: 90,
          child: Text(
            "My Bills",
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
