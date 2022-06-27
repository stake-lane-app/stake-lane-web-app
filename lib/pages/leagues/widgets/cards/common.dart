import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';

Widget club(logo, name) {
  return SizedBox(
    width: 95,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network(
          logo,
          height: 60,
          width: 60,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
        CustomText(
          size: 14,
          color: dark,
          text: name,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget cardHeader(widget, startingHour) {
  return SizedBox(
    width: 300,
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // SvgPicture.network(
            //   widget.countryFlag,
            // ),
            CircleAvatar(
              backgroundImage: NetworkImage(widget.countryFlag),
              radius: 16,
            ),
            const SizedBox(width: 8),
            CustomText(size: 14, color: dark, text: widget.leagueName),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              const SizedBox(width: 16),
              CustomText(
                size: 14,
                color: dark,
                text:
                    "${DateFormat.LLL().format(startingHour)} ${DateFormat.d().format(startingHour)} - ${DateFormat.Hm().format(startingHour)}",
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget baseCardStructure(dynamicArea) {
  return Container(
    width: 450,
    height: 180,
    margin: const EdgeInsets.only(
      bottom: 10,
      top: 8,
      left: 4,
      right: 4,
    ),
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Colors.grey,
      ),
      // color: Colors.grey[100],
      borderRadius: BorderRadius.circular(30),
    ),
    child: dynamicArea,
  );
}
