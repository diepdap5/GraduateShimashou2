import 'dart:io';
import 'package:image/image.dart';

void main() {
  // Read a jpeg image from file.
  Image image = decodeJpg(File('./image/minion.jpg').readAsBytesSync());

  // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
  Image thumbnail = copyResize(image, width: 800);

  // Save the thumbnail as a PNG.
  File('./image/minion_adjust.png').writeAsBytesSync(encodePng(thumbnail));
  print('OK');
}
