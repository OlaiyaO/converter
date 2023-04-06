import 'dart:io';
import 'package:prompter_sg/prompter_sg.dart';
void main() {
  final prompter = Prompter();

  final bool choice = prompter.askBinary('Are you here to convert an image?');
  if (!choice) {
    exit(0);

  }
  
  final format =  prompter.askMultiple('Select format:', buildFormatOptions());
  final selectedFile = prompter.askMultiple('Select format:', buildFileOptions());


}
List<Option> buildFormatOptions() {
  return [
    Option('Convert to jpeg', 'jpeg'),
    Option('Convert to png', 'png'),
  ];
}

List<Option> buildFileOptions() {
 return Directory.current.listSync().where((entity) {
  return FileSystemEntity.isFileSync(entity.path) && entity.path.contains(RegExp(r'\.(png|jpg|jpeg)'));
}).map((entity) {
  final filesname = entity.path.split(Platform.pathSeparator).last;
  return Option(filesname, entity);
  }
  ).toList();
}