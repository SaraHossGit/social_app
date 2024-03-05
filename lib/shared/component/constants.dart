import 'package:flutter/material.dart';

void navigate(
        {required BuildContext context, required Widget requiredScreen}) =>
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => requiredScreen));

void navigateAndEnd(
    {required BuildContext context, required Widget requiredScreen}) =>
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => requiredScreen));
