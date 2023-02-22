import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/payment/payment_bloc.dart';
import "screens/screens.dart";
import ".env";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(),
      child: MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF000A1F),
            secondary: Color(0xFF000A1F),
          ),
          primaryColor: Colors.white,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
