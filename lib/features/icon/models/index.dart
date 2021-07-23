import 'dart:io';

import 'dart:typed_data';

abstract class CSvgIconProps {
  const CSvgIconProps();
}

class CSvgAssetIconProps extends CSvgIconProps {
  const CSvgAssetIconProps(this.src, this.package);
  final String src;
  final String? package;
}

class CSvgNetworkIconProps extends CSvgIconProps {
  const CSvgNetworkIconProps(this.src, this.headers);

  final String src;
  final Map<String, String>? headers;
}

class CSvgFileIconProps extends CSvgIconProps {
  const CSvgFileIconProps(this.file);

  final File file;
}

class CSvgMemoryIconProps extends CSvgIconProps {
  const CSvgMemoryIconProps(this.bytes);

  final Uint8List bytes;
}

class CSvgStringIconProps extends CSvgIconProps {
  const CSvgStringIconProps(this.bytes);

  final String bytes;
}
