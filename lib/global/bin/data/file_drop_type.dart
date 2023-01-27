import 'package:flutter_dropzone/flutter_dropzone.dart';

enum FileUploadType {
  allImage(['image/jpeg', 'image/png', 'image/webp'],
      'JPEG or PNG or WEBP image file');

  const FileUploadType(this.mime, this.description);

  final List<String> mime;
  final String description;
}

class FileDropType {
  const FileDropType({
    required this.id,
    required this.fileTypes,
    this.operation = DragOperation.copy,
    this.cursorType = CursorType.auto,
    this.maxFileSizeInMB = 100,
    this.fileHint = '',
    this.singleSelect = true,
    this.maxImagePxWidth = 0,
    this.minImagePxWidth = 0,
    this.maxImagePxHeight = 0,
    this.minImagePxHeight = 0,
  });

  final int id;
  final DragOperation operation;
  final CursorType cursorType;
  final FileUploadType fileTypes;
  final int maxFileSizeInMB;
  final String fileHint;
  final bool singleSelect;

  // Image Section
  final double maxImagePxWidth;
  final double minImagePxWidth;
  final double maxImagePxHeight;
  final double minImagePxHeight;
}

mixin AppDropType {
  static const allImageDropType = FileDropType(
    id: 1,
    fileTypes: FileUploadType.allImage,
    maxFileSizeInMB: 1,
    fileHint: 'Your image attachments must be a WEBP or PNG or JPEG file, up to'
        ' 1 MB.',
    singleSelect: false,
  );
}
