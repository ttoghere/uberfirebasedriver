import 'package:flutter/material.dart';

import '../tabPages/earnings_tab.dart';
import '../tabPages/home_tab.dart';
import '../tabPages/profile_tab.dart';
import '../tabPages/ratings_tab.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: [
          HomeTab(),
          EarningsTab(),
          RatingsTab(),
          ProfileTab(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.credit_card,
              ),
              label: "Earnings"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: "Ratings"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile"),
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.red[900],
        type: BottomNavigationBarType.shifting,
        selectedLabelStyle: TextStyle(fontSize: 14),
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
