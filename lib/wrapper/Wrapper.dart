import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Widgets/MyAppBar.dart';
import 'package:shopping/Widgets/cartIcon.dart';
import 'package:shopping/model/CartModel.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedIndex = 0;

  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<cartmodel>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            actions: [myAppBar()],
          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: widget.navigationShell,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
              _goBranch(selectedIndex);
            },
            items: [
              BottomNavigationBarItem(label: "", icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: "",
                  icon: cartIcon(
                    cartCount: value.itemnum,
                  ))
            ],
          )
          ),
    );
  }
}
