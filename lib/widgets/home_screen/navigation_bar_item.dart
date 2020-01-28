import 'package:flutter/material.dart';
import 'package:weather/configs/app_colors.dart';
import 'package:weather/models/navigation_bar_item_model.dart';

class NavigationBarItem extends StatelessWidget {
  final NavigationBarItemModel item;

  final bool isSelected;

  const NavigationBarItem({
    @required this.item,
    @required this.isSelected,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      padding: isSelected ? EdgeInsets.only(left: 16, right: 16) : null,
      height: double.maxFinite,
      width: isSelected ? 150 : 60,
      decoration: isSelected
          ? BoxDecoration(
              color: AppColors.lightViolet,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            )
          : null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconTheme(
                child: item.icon,
                data: IconThemeData(size: 30, color: isSelected ? Theme.of(context).primaryColor : Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: isSelected
                    ? Text(
                        item.title,
                        style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                      )
                    : Container(),
              )
            ],
          )
        ],
      ),
    );
  }
}
