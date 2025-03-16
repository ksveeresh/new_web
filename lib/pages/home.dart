import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_web/helper/constants.dart';
import 'package:new_web/pages/cart_checkout.dart';
import 'package:new_web/pages/login_signup_form.dart';
import 'package:new_web/pages/product.dart';
import 'package:new_web/pages/product_details.dart';
import 'package:new_web/providers/AddressProvider.dart';
import 'package:new_web/providers/PageProvider.dart';
import 'package:new_web/providers/SideMenuProvider.dart';
import 'package:new_web/providers/UserDataProvider.dart';
import 'package:provider/provider.dart';

import 'about_us.dart';

class _ProfileIcon extends StatelessWidget {
  _ProfileIcon();

  UserDataProvider? sUserData;

  @override
  Widget build(BuildContext context) {
    sUserData = Provider.of<UserDataProvider>(context);

    return PopupMenuButton(
      icon: const Icon(Icons.person, color: Color(0xFF1c5c3c)),
      offset: const Offset(0, 40),
      onSelected: (item) {
        if (item == 'Sign In') {
          showLoginSignupDialog(context);
        }
        if (item == 'Sign Out') {
          FirebaseAuth.instance.signOut().then((onValue) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Logged out successfully!")),
            );
            sUserData?.logOut();
          });
        }
      },
      itemBuilder: (BuildContext context) => loadmenu(),
    );
  }

  loadmenu() {
    List<PopupMenuEntry> tempList = [];
    tempList.add(PopupMenuItem(value: 'Contact', child: Text('Contact')));
    tempList.add(PopupMenuItem(value: 'Settings', child: Text('Settings')));
    if ((sUserData?.user ?? {}).isNotEmpty) {
      tempList.add(PopupMenuItem(value: 'Sign Out', child: Text('Sign Out')));
    } else {
      tempList.add(PopupMenuItem(value: 'Sign In', child: Text('Sign In')));
    }

    return tempList;
  }

  void showLoginSignupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const LoginSignupForm();
      },
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> _menuItems = <String>[
    'About',
    'Products',
    'Goodies',
    'Best Sellers',
  ];

  PageProvider? provider;
  SideMenuProvider? sProvider;

  bool? isLargeScreen;

  BuildContext? nContext;

  UserDataProvider? sUserData;

  pushPage(Widget widget, BuildContext? context) {
    Navigator.push(
      context!,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Slide from right to left
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    nContext = context;
    provider = Provider.of<PageProvider>(context);
    sProvider = Provider.of<SideMenuProvider>(context);
    sUserData = Provider.of<UserDataProvider>(context);
    final address = Provider.of<AddressProvider>(context);
    if((sUserData?.user??{}).isNotEmpty){
      address.loadAddress((sUserData?.user??{})["uid"]);
    }
    final width = MediaQuery.of(context).size.width;
    isLargeScreen = width > 800;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF1c5c3c),
        elevation: 0,
        titleSpacing: 0,
        leading:
            (isLargeScreen ?? false)
                ? null
                : IconButton(
                  icon: const Icon(Icons.menu,color: Colors.white,),
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(Asset.string.kLogo, width: 150, height: 150),
                ],
              ),
              if ((isLargeScreen ?? false)) Expanded(child: _navBarItems()),
            ],
          ),
        ),
        actions: [
          Visibility(
            visible: (sUserData?.user??{}).isNotEmpty,
            child: GestureDetector(
              onTap: () {
                sProvider?.setPage(CartCheckout(callBack: (s) {
                  provider?.setCart(false);

                }));
                if ((isLargeScreen ?? false)) {
                  if (provider?.showCart ?? false) {
                    provider?.setCart(false);
                  } else {
                    provider?.setCart(true);
                  }
                } else {
                  pushPage(sProvider?.page ?? Container(), context);
                }
              },
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.shopping_cart, color: Color(0xFF1c5c3c)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: _ProfileIcon(),
            ),
          ),
        ],
      ),
      drawer: (isLargeScreen ?? false) ? null : _drawer(),
      body:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: (isLargeScreen??false)?1000:MediaQuery.of(context).size.width,
              child: provider?.page ?? Container()
          ),
        ],
      ),
    );
  }

  Widget _drawer() => Container(
    width: 300,
    color:  Color(0xFF1c5c3c),
    child: Column(
      children: [
        Image.asset(Asset.string.kLogo, height: 150),
        Flexible(
          child: ListView(
            children:
                _menuItems
                    .map(
                      (item) => ListTile(
                        onTap: () {
                          _scaffoldKey.currentState?.closeDrawer();
                          loadPage(item);
                        },
                        title: Text(item,style: const TextStyle(fontSize: 18, color: Colors.white),),
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    ),
  );

  Widget _navBarItems() => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children:
        _menuItems
            .map(
              (item) => InkWell(
                onTap: () {
                  loadPage(item);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 16,
                  ),
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            )
            .toList(),
  );

  void loadPage(String item) {
    switch (item) {
      case "About":
        Widget page = AboutUs(
          callBack: () {
            loadPage("Products");
          },
        );
        provider?.setPage(page);
        break;
      case 'Products':
        Widget page = Product(
          callback: (s) {
            if (s is Map) {
              if (s.isNotEmpty) {
                sProvider?.setPage(
                  ProductDetails(
                    product: s,
                    callback: (s) {
                      if(s is Map){
                        if(s.isEmpty){

                          if ((isLargeScreen ?? false)) {
                            provider?.setCart(false);
                          }else{
                            Navigator.pop(nContext!);
                          }

                        }else{
                          showLoginSignupDialog(nContext!);
                        }
                      }

                    },
                  ),
                );
                if ((isLargeScreen ?? false)) {
                  if (!(provider?.showCart ?? false)) {
                    provider?.setCart(true);
                  }
                } else {
                  pushPage(sProvider?.page ?? Container(), nContext!);
                }
              } else {
                showLoginSignupDialog(nContext!);
              }
            }
          },
        );
        provider?.setPage(page);
        break;
    }
  }

  void showLoginSignupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const LoginSignupForm();
      },
    );
  }
}
