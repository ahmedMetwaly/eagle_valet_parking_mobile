import 'package:flutter/material.dart';

class SlideCountdown extends StatefulWidget {
  final String number;
  const SlideCountdown({super.key, required this.number});

  @override
  // ignore: library_private_types_in_public_api
  _SlideCountdownState createState() => _SlideCountdownState();
}

class _SlideCountdownState extends State<SlideCountdown> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        final inAnimation =
            Tween<Offset>(begin:const Offset(0, 1), end: const Offset(0, 0))
                .animate(animation);
        final outAnimation =
            Tween<Offset>(begin:const Offset(0, 0), end:const Offset(0, -1))
                .animate(animation);

        if (child.key == ValueKey(widget.number)) {
          return ClipRect(
            child: SlideTransition(
              position: inAnimation,
              child: child,
            ),
          );
        } else {
          return ClipRect(
            child: SlideTransition(
              position: outAnimation,
              child: child,
            ),
          );
        }
      },
      child: Text(
        widget.number,
        key: ValueKey(widget.number),
        style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
