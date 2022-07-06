library home;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:premium_flow/app/data/constants/color_constant.dart';
import 'package:premium_flow/app/modules/shared_wedgits/my_text.dart';
import 'package:premium_flow/app/modules/shared_wedgits/notification_count.dart';
import 'package:premium_flow/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

// PARTS
part 'user_card.dart';
part 'main_menu_button.dart';
part 'main_menu_items.dart';
part 'main_menu.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(children: [
          Expanded(
            flex: 1,
            child: Container(color: Colors.transparent),
          ),
          Expanded(
            flex: 5,
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 30),
                child: MyText(
                  text: controller.title.value,
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ]),
        // centerTitle: true,
      ),
      // drawer: _buildSideMenu(),
      body: Row(
        children: [
          Expanded(flex: 1, child: _buildSideMenu()),
          Expanded(
            flex: 5,
            child: Obx(() => controller.currentPage.value),
          )
        ],
      ),
    );
  }

  Widget _buildSideMenu() {
    return SizedBox(
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 30, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(left: 20), child: Icon(Icons.album)
                    // CircleAvatar(
                    //   backgroundImage: AssetImage("assets/images/PremiumFlow.png"),
                    // ),
                    ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: MyText(
                    color: Colors.black,
                    text: "Premium Flow",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: KlightPallet.primaryColor.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        // bottomRight: Radius.circular(10),
                        // topRight: Radius.circular(10),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Expanded(child: MainMenu()),
          UserCard(
            onPressed: () {},
            userCardData: UserCardData(
                const AssetImage("assets/images/AvatarMaker.png"),
                "Ahmed Osama",
                'Software Developer'),
          ),
        ],
      ),
    );
  }
}
