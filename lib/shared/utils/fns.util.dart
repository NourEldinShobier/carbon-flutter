String enumToString(dynamic e) {
  String str = e.toString();
  return str.split('.').last;
}
