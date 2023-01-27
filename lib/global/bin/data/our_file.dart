import 'dart:typed_data';

class OurFile {
  const OurFile({
    required this.filename,
    required this.source,
  });

  final String filename;

  final Uint8List source;
}
