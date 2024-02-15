import 'package:bloc_example/apicrud/crud_operations/bloc/cart_bloc.dart';
import 'package:bloc_example/apicrud/crud_operations/bloc/fetch_bloc.dart';
import 'package:bloc_example/apicrud/crud_operations/bloc/user_bloc.dart';
import 'package:bloc_example/apicrud/intialloading_example/bloc/initial_bloc.dart';
import 'package:bloc_example/apicrud/intialloading_example/page/todoPage.dart';
import 'package:bloc_example/apicrud/multipleApicall/bloc/multiple_bloc.dart';
import 'package:bloc_example/apicrud/multipleApicall/pages/homepage.dart';
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
        BlocProvider(create: (context) => LocationBloc()),
        BlocProvider(create: (context) => ImagePickerBloc()),
        BlocProvider(create: (context) => NotificationBloc()),
        BlocProvider(create: (context) => RazorpayBloc()),
        BlocProvider(create: (context) => FetchBloc()),
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => InitialBloc()),
        BlocProvider(create: (context) => MultipleBloc()),
      ],
      child: MaterialApp(
        home: Userpage(),
        theme: ThemeData(
          useMaterial3: false,
        ),
      ),
    );
  }
}
