import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:shipments/view/calculation_page.dart';
import 'package:shipments/view/home_page.dart';
import 'package:shipments/view/shipment_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: HomePage(), // _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: Colors.blue,
        unSelectedColor: Colors.black54,
        backgroundColor: Colors.white,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            CalculationPage.show(context: context);
          } else if (index == 2) {
            ShipmentPage.show(context: context);
          }
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 3,
        indicatorType: IndicatorType.Top,
        customBottomBarItems: [
          CustomBottomBarItems(
            label: 'Home',
            icon: Icons.home,
          ),
          CustomBottomBarItems(
            label: 'Calculate',
            icon: Icons.account_box_outlined,
          ),
          CustomBottomBarItems(
              label: 'Shipment', icon: Icons.calendar_today_outlined),
          CustomBottomBarItems(
            label: 'Profile',
            icon: Icons.card_giftcard_rounded,
          ),
        ],
      ),
    );
  }
}
