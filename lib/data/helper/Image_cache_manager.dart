// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageCacheManager {
  static Future<File> getImagePath(String imageUrl) async {
    final file = await DefaultCacheManager().getSingleFile(imageUrl);
    return file;
  }
}
