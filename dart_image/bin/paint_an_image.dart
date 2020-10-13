import 'dart:io';
import 'package:image/image.dart';

void main() {
  var length = 300;
  var height = 300;
  // Create an image
  Image image = Image(length, height);

  // Fill it with a solid color (blue)
  fill(image, getColor(0, 0, 255));

  // Draw some text using 24pt arial font
  drawString(image, arial_14, length ~/ 3, height ~/ 3.5, 'Hello World');

  // Draw a line
  drawLine(image, length ~/ 3, height ~/ 3, length ~/ 3, height ~/ 1.5,
      getColor(255, 0, 0),
      thickness: 5);
  drawLine(image, length ~/ 3, height ~/ 3, length ~/ 1.5, height ~/ 3,
      getColor(255, 0, 0),
      thickness: 5);
  drawLine(image, length ~/ 1.5, height ~/ 1.5, length ~/ 3, height ~/ 1.5,
      getColor(255, 0, 0),
      thickness: 5);
  drawLine(image, length ~/ 1.5, height ~/ 1.5, length ~/ 1.5, height ~/ 3,
      getColor(255, 0, 0),
      thickness: 5);

  // Blur the image
  // gaussianBlur(image, 10);

  // Save the image to disk as a PNG
  File('./image/paint.png').writeAsBytesSync(encodePng(image));
}
