import 'dart:math';

import 'package:eagle_valet_parking_mobile/core/constants/values_manager.dart';
import 'package:eagle_valet_parking_mobile/core/utils/image_manager.dart';
import 'package:eagle_valet_parking_mobile/core/utils/media_query_utils.dart';
import 'package:eagle_valet_parking_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/time.dart';
import '../../../../core/utils/translate.dart';
import '../../../add_new_parking/models/ticket.dart';

class Tickets extends StatelessWidget {
  const Tickets({super.key, required this.tickets});
  final List<TicketModel> tickets;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.tickets)),
      body: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: ListView.separated(
          itemBuilder: (context, index) =>
              //color: Theme.of(context).colorScheme.primary,
              Stack(children: [
            SizedBox(
                //  color: Colors.black,
                height: MediaQueryUtils.getHeightPercentage(context, 0.20),
                width: double.infinity,
                child: Intl.getCurrentLocale() == "ar"
                    ? Transform(
                        alignment: Alignment.topCenter,
                        transform: Matrix4.identity()
                          ..rotateY(pi), // Flip horizontally
                        child: Image.asset(
                          ImageManager.ticket,
                          height: MediaQueryUtils.getHeightPercentage(
                              context, 0.20),
                          fit: BoxFit.cover,
                        ), // Replace with your image asset
                      )
                    : Image.asset(
                        ImageManager.ticket,
                        height:
                            MediaQueryUtils.getHeightPercentage(context, 0.33),
                        fit: BoxFit.fitWidth,
                      )),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQueryUtils.getHeightPercentage(context, 0.05),
                bottom: MediaQueryUtils.getHeightPercentage(context, 0.02),
                left: MediaQueryUtils.getHeightPercentage(
                    context, Intl.getCurrentLocale() == "ar" ? 0.009 : 0.05),
                right: MediaQueryUtils.getHeightPercentage(
                    context, Intl.getCurrentLocale() == "ar" ? 0.04 : 0.01),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${S.current.ticketNo}: ${Intl.getCurrentLocale() == "ar" ? Translate().translateNumberToArabic(tickets[index].ticketNumber!.toString()) : tickets[index].ticketNumber!}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        Text(
                          "${S.current.enterTime}: ${Intl.getCurrentLocale() == "ar" ? Translate().translateNumberToArabic(tickets[index].enterTime!.toString()) : tickets[index].enterTime!}",
                          style: const TextStyle(color: Color(0xFFF15A29)),
                        ),
                        Text(
                          "${S.current.leaveTime}: ${tickets[index].leaveTime! == "" ? S.current.stillInside : Intl.getCurrentLocale() == "ar" ? Translate().translateNumberToArabic(tickets[index].leaveTime!.toString()) : tickets[index].leaveTime!}",
                          style: const TextStyle(color: Color(0xFFEAAC5B)),
                        ),
                       // Text(TimeRepo().formatDuration(Duration(minutes: tickets[index].parkingDurationInMinutes!))),
                        Text(
                          "${S.current.duration}: ${/* Intl.getCurrentLocale() == "ar" ? Translate().translateNumberToArabic(TimeRepo().formatDuration(Duration(minutes: tickets[index].parkingDurationInMinutes!))) : */ TimeRepo().formatDuration(Duration(minutes: tickets[index].parkingDurationInMinutes!))}",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Expanded(
                    child: Image.asset(ImageManager.ticketLogo),
                  ),
                ],
              ),
            ),
          ]),
          itemCount: tickets.length,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 15,
          ),
        ),
      ),
    );
  }
}
