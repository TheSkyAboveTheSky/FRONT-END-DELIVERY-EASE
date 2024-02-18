import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';

class FunctionUtils {


  static  Future<Color?> extractDominantColor(String imagePath) async {
    var palette = await PaletteGenerator.fromImageProvider(AssetImage(imagePath));
    return palette?.dominantColor?.color;
  }


}