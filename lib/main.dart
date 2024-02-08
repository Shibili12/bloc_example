import 'package:bloc_example/apicrud/bloc/cart_bloc.dart';
import 'package:bloc_example/apicrud/bloc/fetch_bloc.dart';
import 'package:bloc_example/apicrud/bloc/user_bloc.dart';
import 'package:bloc_example/firebase_options.dart';
import 'package:bloc_example/imagepick_usingbloc/bloc/image_picker_bloc.dart';
import 'package:bloc_example/imagepick_usingbloc/imagescreen.dart';
import 'package:bloc_example/locationfetch_using_bloc/bloc/location_bloc.dart';
import 'package:bloc_example/locationfetch_using_bloc/location_homepage.dart';
import 'package:bloc_example/notification_using_bloc/bloc/notification_bloc.dart';
import 'package:bloc_example/notification_using_bloc/notificationpage.dart';
import 'package:bloc_example/payment_integration/paymentscreen.dart';
import 'package:bloc_example/payment_integration/bloc/razorpay_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationBloc(),
        ),
        BlocProvider(
          create: (context) => ImagePickerBloc(),
        ),
        BlocProvider(
          create: (context) => NotificationBloc(),
        ),
        BlocProvider(
          create: (context) => RazorpayBloc(),
        ),
        BlocProvider(create: (context) => FetchBloc()),
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => CartBloc()),
      ],
      child: MaterialApp(
        home: Paymentscreen(),
        theme: ThemeData(
          useMaterial3: false,
        ),
      ),
    );
  }
}
