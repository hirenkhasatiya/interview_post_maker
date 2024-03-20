import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class EditController extends ChangeNotifier {
  bool isedit = false;

  final imagePicker = ImagePicker();

  String ImagePath = "";

  changeedit() {
    isedit = !isedit;
    notifyListeners();
  }

  Future<void> ImagepickFromGallary() async {
    final filePicker = await imagePicker.pickImage(source: ImageSource.gallery);

    if (filePicker != null) {
      ImagePath = filePicker.path;
    }
    notifyListeners();
  }
}
