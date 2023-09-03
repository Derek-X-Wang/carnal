
import 'package:flutter/material.dart';

class TimeTile extends StatelessWidget {
  final TimeOfDay item;

  TimeTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 50, 0, 10),
      child: Row(
        children: [
          Icon(
            Icons.star,
            size: 36,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Container(padding: EdgeInsets.fromLTRB(5, 5, 5, 5), color: Colors.black,)
                Divider(
                  height: 10,
                  thickness: 2,
                  color: Colors.grey,
                ),
                Text(item.parse(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

extension TodayTimeOfDayParsing on TimeOfDay {
  String parse() {
    switch (hour) {
      case 0 : {
        return "Midnight";
      }
      case 12: {
        return "Noon";
      }
      default : {
        return "$hourOfPeriod ${period == DayPeriod.am ? "am": "pm"}";
      }
    }
  }
}