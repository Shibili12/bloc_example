import 'dart:io';

import 'package:bloc_example/imagepick_usingbloc/bloc/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Imagescreen extends StatelessWidget {
  const Imagescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) {
                  return state.file == null
                      ? const CircularProgressIndicator()
                      : Image.file(File(state.file!.path.toString()));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<ImagePickerBloc>().add(Takephoto());
                    },
                    child: Text("Take photo")),
                ElevatedButton(
                    onPressed: () {
                      context.read<ImagePickerBloc>().add(PickImage());
                    },
                    child: Text("pick image")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
