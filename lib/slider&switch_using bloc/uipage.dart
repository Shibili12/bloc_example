import 'package:bloc_example/slider&switch_using%20bloc/bloc/slider_bloc.dart';
import 'package:bloc_example/slider&switch_using%20bloc/bloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UiPage extends StatelessWidget {
  const UiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notification"),
                  BlocBuilder<SwitchBloc, SwitchState>(
                    builder: (context, state) {
                      return Switch(
                          value: state.isEnabled,
                          onChanged: (value) {
                            context
                                .read<SwitchBloc>()
                                .add(Enableordisable(value: value));
                          });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<SliderBloc, SliderState>(
                builder: (context, state) {
                  return Container(
                    height: 200,
                    width: 400,
                    color: Colors.red.withOpacity(state.slidervalue),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<SliderBloc, SliderState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Slider(
                          value: state.slidervalue,
                          onChanged: (value) {
                            context
                                .read<SliderBloc>()
                                .add(Sliderchangevent(value: value));
                          }),
                      Text(state.slidervalue.toString()),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
