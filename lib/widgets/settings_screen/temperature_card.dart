import 'package:flutter/material.dart';
import 'package:weather/configs/app_colors.dart';

class TemperatureCard extends StatelessWidget {
  final String label;
  final bool isSelected;

  const TemperatureCard({
    @required this.label,
    @required this.isSelected,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 270),
      height: 150,
      width: 150,
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Theme.of(context).primaryColor : AppColors.lightViolet,
            fontSize: 50,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : AppColors.shadowColor,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
