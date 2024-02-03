part of 'image_picker_bloc.dart';

@immutable
sealed class ImagePickerEvent {}

class Takephoto extends ImagePickerEvent {}

class PickImage extends ImagePickerEvent {}
