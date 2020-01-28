import 'package:flutter/material.dart';
import 'package:weather/models/navigation_bar_item_model.dart';
import 'package:weather/widgets/home_screen/navigation_bar_item.dart';

class NavigationBar extends StatefulWidget {
  final Function(int) onIndexSelected;
  final List<NavigationBarItemModel> navigationItems;

  const NavigationBar({
    @required this.onIndexSelected,
    @required this.navigationItems,
    Key key,
  }) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 56,
      padding: EdgeInsets.only(left: 16, bottom: 4, top: 4, right: 16),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          for (int itemIndex = 0; itemIndex < widget.navigationItems.length; itemIndex++)
            GestureDetector(
              onTap: () => _onNavigationItemSelected(itemIndex),
              child: NavigationBarItem(
                item: widget.navigationItems[itemIndex],
                isSelected: selectedIndex == itemIndex,
              ),
            ),
        ],
      ),
    );
  }

  void _onNavigationItemSelected(int index) {
    setState(() {
      selectedIndex = index;
      widget.onIndexSelected(selectedIndex);
    });
  }
}
