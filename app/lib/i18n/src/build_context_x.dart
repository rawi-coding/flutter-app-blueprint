import 'package:flutter/widgets.dart';

import 'package:app/i18n/i18n.dart';

extension BuildContextX on BuildContext {
  /// The localized strings.
  AppLocalizations get l10n {
    return AppLocalizations.of(this)!;
  }
}