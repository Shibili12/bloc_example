import 'package:bloc_example/apicrud/crud_operations/bloc/cart_bloc.dart';
import 'package:bloc_example/apicrud/crud_operations/bloc/fetch_bloc.dart';
import 'package:bloc_example/apicrud/crud_operations/bloc/user_bloc.dart';
import 'package:bloc_example/apicrud/intialloading_example/bloc/initial_bloc.dart';
import 'package:bloc_example/apicrud/intialloading_example/page/todoPage.dart';

import 'package:bloc_example/apicrud/multiple_Api_Call/bloc/multiple_bloc.dart';
import 'package:bloc_example/apicrud/multiple_Api_Call/pages/homepage.dart';
import 'package:bloc_example/favoriteapp_using_bloc/bloc/favourite_bloc.dart';
import 'package:bloc_example/favoriteapp_using_bloc/favourite_screen.dart';
import 'package:bloc_example/favoriteapp_using_bloc/repository/fav_repository.dart';
import 'package:bloc_example/firebase_options.dart';
import 'package:bloc_example/imagepick_usingbloc/bloc/image_picker_bloc.dart';
import 'package:bloc_example/imagepick_usingbloc/imagescreen.dart';
import 'package:bloc_example/locationfetch_using_bloc/bloc/location_bloc.dart';
import 'package:bloc_example/locationfetch_using_bloc/location_homepage.dart';
import 'package:bloc_example/notification_using_bloc/bloc/notification_bloc.dart';
import 'package:bloc_example/notification_using_bloc/notificationpage.dart';
import 'package:bloc_example/payment_integration/paymentscreen.dart';
import 'package:bloc_example/payment_integration/bloc/razorpay_bloc.dart';
import 'package:bloc_example/slider&switch_using%20bloc/bloc/slider_bloc.dart';
import 'package:bloc_example/slider&switch_using%20bloc/bloc/switch_bloc.dart';
import 'package:bloc_example/slider&switch_using%20bloc/uipage.dart';
import 'package:bloc_example/todoapp_using_bloc/bloc/todo_bloc.dart';
import 'package:bloc_example/todoapp_using_bloc/todo_screen.dart';
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
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => SliderBloc()),
        BlocProvider(create: (context) => TodoBloc()),
        BlocProvider(create: (context) => FavouriteBloc(FavouriteRepository())),
      ],
      child: MaterialApp(
        home: FavouriteScreen(),
        theme: ThemeData(
          useMaterial3: false,
        ),
      ),
    );
  }
}
