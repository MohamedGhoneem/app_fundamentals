import 'dart:developer';
import 'package:flutter/material.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text.dart';
import 'timer_bloc.dart';


///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class TimerText extends StatelessWidget {
  final String? label;
  final String? resendCodeLabel;
  final TimerBloc timerBloc;
final TextStyle? labelStyle;
final TextStyle? resendCodeLabelStyle;
final TextStyle? timerStyle;
  const TimerText({Key? key, required this.timerBloc, this.label, this.labelStyle, this.resendCodeLabel, this.resendCodeLabelStyle, this.timerStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          label: label??'',
          style:labelStyle?? const TextStyle(
              fontSize: 14,
              color: Colors.blue),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5),
            child: StreamBuilder<int>(
                stream: timerBloc.timerStream,
                builder: (context, AsyncSnapshot<int> snapshot) {
                  if (snapshot.hasData) {
                    return AppText(
                      label: formattedTime(snapshot.data ?? 120),
                      style: timerStyle?? const TextStyle(
                          fontSize: 14,
                          color: Colors.blue),
                    );
                  } else {
                    return AppText(
                      label: '01:59',
                      style: timerStyle?? const TextStyle(
                          fontSize: 14,
                          color: Colors.blue),
                    );
                  }
                })),
        StreamBuilder<bool>(
            stream: timerBloc.timerStoppedSubject.stream,
            builder: (context, AsyncSnapshot<bool> snapshot) {
              log(snapshot.data.toString());
              if (snapshot.data == null || snapshot.data == false) {
                return const SizedBox();
              } else {
                return AppButton(
                    title: resendCodeLabel??'Resend Code',
                    style: resendCodeLabelStyle??const TextStyle(
                        fontSize: 14,
                        color: Colors.black),
                    borderColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    onTap: () => timerBloc.incrementTimer(30));
              }
            })
      ],
    );
  }
  static String formattedTime(int secTime) {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int min = secTime ~/ 60;
    int sec = secTime % 60;

    String parsedTime =
        "${getParsedTime(min.toString())}:${getParsedTime(sec.toString())}";

    return parsedTime;
  }
}
