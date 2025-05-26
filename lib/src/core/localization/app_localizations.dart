import 'package:flutter/material.dart';

/// Basic localization support
class AppLocalizations {
  final Locale locale;
  
  AppLocalizations(this.locale);
  
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }
  
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
  
  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('es', ''),
    Locale('fr', ''),
  ];
  
  // Common strings
  String get appName => _get('appName');
  String get loading => _get('loading');
  String get error => _get('error');
  String get success => _get('success');
  String get cancel => _get('cancel');
  String get ok => _get('ok');
  String get save => _get('save');
  String get delete => _get('delete');
  String get edit => _get('edit');
  
  String _get(String key) {
    final strings = _localizedValues[locale.languageCode] ?? _localizedValues['en']!;
    return strings[key] ?? key;
  }
  
  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appName': 'My App',
      'loading': 'Loading...',
      'error': 'Error',
      'success': 'Success',
      'cancel': 'Cancel',
      'ok': 'OK',
      'save': 'Save',
      'delete': 'Delete',
      'edit': 'Edit',
    },
    'es': {
      'appName': 'Mi Aplicación',
      'loading': 'Cargando...',
      'error': 'Error',
      'success': 'Éxito',
      'cancel': 'Cancelar',
      'ok': 'OK',
      'save': 'Guardar',
      'delete': 'Eliminar',
      'edit': 'Editar',
    },
  };
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();
  
  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales.any((l) => l.languageCode == locale.languageCode);
  }
  
  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }
  
  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
