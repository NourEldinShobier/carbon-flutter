import 'package:lab/carbon.dart';
import 'package:stylex/stylex.dart';

final _text = StyleX({
  /// text font family

  'text-h1-font-family': 'carbon-font-family',
  'text-h2-font-family': 'carbon-font-family',
  'text-h3-font-family': 'carbon-font-family',
  'text-h4-font-family': 'carbon-font-family',
  'text-h5-font-family': 'carbon-font-family',
  'text-h6-font-family': 'carbon-font-family',

  /// text sizes

  'text-h1-font-size': 36,
  'text-h2-font-size': 24,
  'text-h3-font-size': 18,
  'text-h4-font-size': 16,
  'text-h5-font-size': 14,
  'text-h6-font-size': 12,
});

final textG100 = StyleX({
  // text colors

  'text-hint-color': CColors.gray60,
  'text-label-color': CColors.gray30,
  'text-subtitle-color': CColors.gray10,
  'text-link-color': CColors.blue40,
  'text-control-color': CColors.blue40,
  'text-disabled-color': CColors.gray70,
})
  ..inject(_text);
