import 'package:bloc/bloc.dart';
import 'package:bloc_example/imagepick_usingbloc/imagepick_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerInitial(file: null)) {
    on<Takephoto>((event, emit) async {
      final file = await Imagepickerhelper().takeImage();
      emit(ImagePickerState(file: file));
    });

    on<PickImage>((event, emit) async {
      final file = await Imagepickerhelper().pickImage();
      emit(ImagePickerState(file: file));
    });
  }
}
