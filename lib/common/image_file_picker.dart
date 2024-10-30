/*
import 'dart:io';
import 'package:file_picker/file_picker.dart';

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
}  */