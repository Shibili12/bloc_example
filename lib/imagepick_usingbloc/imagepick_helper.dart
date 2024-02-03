import 'package:image_picker/image_picker.dart';

class Imagepickerhelper {
  Future<XFile?> takeImage() async {
    var xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    return xfile;
  }

  Future<XFile?> pickImage() async {
    var xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    return xfile;
  }
}
