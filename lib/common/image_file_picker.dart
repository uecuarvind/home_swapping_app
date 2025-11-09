
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class ImageFilePicker{


  static Future<File?> pickSingleFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
   // FilePickerResult? result = await FilePicker.platform.pickFiles();
    File? file;
    if (result != null) {
       file = File(result.files.single.path!);
      return file;
    }
    return file;
  }
}

Future<List<File>?> getMultipleImageFromGallery() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickMultiImage();
  if (pickedFile != null) {
    print("Image :-${pickedFile[0].path}");
    List<File> selectedFiles = pickedFile.map((xFile) => File(xFile.path)).toList();
    return selectedFiles;
  } else {
    print("Image not picked....");
    return null;
  }
}




