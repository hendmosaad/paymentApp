import 'package:flutter/material.dart';
import 'package:payment/core/utils/components.dart';
class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Widgets.thankYouViewBody(context),
    );
  }
}
