import 'package:bloc_example/locationfetch_using_bloc/bloc/location_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationHomepage extends StatelessWidget {
  const LocationHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Current Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<LocationBloc, LocationState>(
              builder: (context, state) {
                return state.isLoading == true
                    ? Text("Loading...")
                    : Text(
                        state.currentaddress.toString(),
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<LocationBloc>().add(Getlocation());
                },
                child: Text("Get location")),
          ],
        ),
      ),
    );
  }
}
