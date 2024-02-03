import 'package:bloc_example/imagepick_usingbloc/bloc/image_picker_bloc.dart';
import 'package:bloc_example/imagepick_usingbloc/imagescreen.dart';
import 'package:bloc_example/locationfetch_using_bloc/bloc/location_bloc.dart';
import 'package:bloc_example/locationfetch_using_bloc/location_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
      ],
      child: MaterialApp(
        home: Imagescreen(),
      ),
    );
  }
}
