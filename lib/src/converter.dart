import 'dart:io';
import 'package:image/image.dart';

convertImage(FileSystemEntity selectedFile, String format) {
   final rawImage = (selectedFile as File).readAsBytes();
   final image = Decoder.decode(rawImage);

   var newImage;

   if(format == 'jpg') {
    newImage = JpegEncoder.encode(image);
   } else if (format == 'jpeg'){
    newImage = PngEncoder.encode(image);
   } else {
    print('Unsopported file type');
   }
   File(replaceExtension(selectedFile.path, format)).writeAsBytesSync(newImage);

}

String replaceExtension(String path, String newExtension) {
 return path.replaceAll(RegExp(r'\.(png|jpg|jpeg)'), newExtension);
}