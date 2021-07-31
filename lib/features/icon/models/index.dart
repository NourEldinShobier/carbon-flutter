import 'dart:io';

import 'dart:typed_data';

abstract class CSvgIconSource {
  const CSvgIconSource();
}

class CSvgAssetIconSource extends CSvgIconSource {
  const CSvgAssetIconSource(this.src, this.package);
  final String src;
  final String? package;
}

class CSvgNetworkIconSource extends CSvgIconSource {
  const CSvgNetworkIconSource(this.src, this.headers);

  final String src;
  final Map<String, String>? headers;
}

class CSvgFileIconSource extends CSvgIconSource {
  const CSvgFileIconSource(this.file);

  final File file;
}

class CSvgMemoryIconSource extends CSvgIconSource {
  const CSvgMemoryIconSource(this.bytes);

  final Uint8List bytes;
}

class CSvgStringIconSource extends CSvgIconSource {
  const CSvgStringIconSource(this.bytes);

  final String bytes;
}
