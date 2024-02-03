part of 'image_picker_bloc.dart';

class ImagePickerState {
  final XFile? file;

  ImagePickerState({required this.file});
}

final class ImagePickerInitial extends ImagePickerState {
  ImagePickerInitial({required super.file});
}
