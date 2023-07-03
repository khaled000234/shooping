
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eco/Home.dart';
//import 'package:flutter_eco/OrderScreen.dart';
import 'package:flutter_eco/acount_screen.dart';
import 'package:flutter_eco/cart_screen.dart';
//import 'package:flutter_eco/cart_screen.dart';
//import 'package:flutter_eco/favorite_scann.dart';
//import 'package:flutter_eco/userTest.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ProvidedStylesExample extends StatefulWidget {
  const ProvidedStylesExample({final Key? key})
      : super(key: key);


  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
  PersistentTabController _controller=PersistentTabController();
  bool _hideNavBar=false;



  List<Widget> _buildScreens() => [
     const   Home(),
    const accountScreen(),
   
    
   // const favorite_scann()
    
      //
      //    const Home(),
       const CartScreen(),
      //const OrderScreen(),
      // const userTest(),
   
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            inactiveIcon: const Icon(Icons.home_outlined),
            title: "Home",
            activeColorPrimary: Colors.white,
            inactiveColorPrimary: Colors.white,
            inactiveColorSecondary: Colors.purple),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: "person",
             inactiveIcon: const Icon(Icons.person),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
         
        ),
       
          PersistentBottomNavBarItem(
          icon: const Icon(Icons.favorite_outline),
          title: "favorite",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
          
          
        ),
        
        
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
      
        
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,
         
          
         
          backgroundColor: Colors.lightBlue,
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle: NavBarStyle
              .style1, // Choose the nav bar style with this property
        ),
      );
}