import 'package:carbon/widgets/widgets.index.dart';

extension StringExtension on String {
  CText h1({
    Map<String, dynamic> props = const {},
    Map<String, dynamic> style = const {},
  }) {
    return CText(
      props: props..addAll({'value': this}),
      style: style..addAll({'fontSize': 36}),
    );
  }

  CText h2({
    Map<String, dynamic> props = const {},
    Map<String, dynamic> style = const {},
  }) {
    return CText(
      props: props..addAll({'value': this}),
      style: style..addAll({'fontSize': 24}),
    );
  }

  CText h3({
    Map<String, dynamic> props = const {},
    Map<String, dynamic> style = const {},
  }) {
    return CText(
      props: props..addAll({'value': this}),
      style: style..addAll({'fontSize': 18}),
    );
  }

  CText h4({
    Map<String, dynamic> props = const {},
    Map<String, dynamic> style = const {},
  }) {
    return CText(
      props: props..addAll({'value': this}),
      style: style..addAll({'fontSize': 16}),
    );
  }

  CText h5({
    Map<String, dynamic> props = const {},
    Map<String, dynamic> style = const {},
  }) {
    return CText(
      props: props..addAll({'value': this}),
      style: style..addAll({'fontSize': 14}),
    );
  }

  CText h6({
    Map<String, dynamic> props = const {},
    Map<String, dynamic> style = const {},
  }) {
    return CText(
      props: props..addAll({'value': this}),
      style: style..addAll({'fontSize': 12}),
    );
  }
}
