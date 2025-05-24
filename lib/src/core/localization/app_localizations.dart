import 'package:flutter/material.dart';

/// Localization class for the application
class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  /// Get the localized instance for the current context
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// Delegate for loading localizations
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// Supported locales
  static const List<Locale> supportedLocales = [
    Locale('en', ''), // English
    Locale('es', ''), // Spanish
    Locale('fr', ''), // French
    Locale('de', ''), // German
    Locale('zh', ''), // Chinese
    Locale('ja', ''), // Japanese
    Locale('ko', ''), // Korean
    Locale('ar', ''), // Arabic
  ];

  // Localized strings map
  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      // Common UI
      'loading': 'Loading...',
      'error': 'Error',
      'success': 'Success',
      'warning': 'Warning',
      'info': 'Information',
      'confirm': 'Confirm',
      'cancel': 'Cancel',
      'ok': 'OK',
      'yes': 'Yes',
      'no': 'No',
      'save': 'Save',
      'delete': 'Delete',
      'edit': 'Edit',
      'add': 'Add',
      'remove': 'Remove',
      'update': 'Update',
      'refresh': 'Refresh',
      'retry': 'Retry',
      'close': 'Close',
      'back': 'Back',
      'next': 'Next',
      'previous': 'Previous',
      'done': 'Done',
      'continue': 'Continue',
      'skip': 'Skip',
      'search': 'Search',
      'filter': 'Filter',
      'sort': 'Sort',
      'clear': 'Clear',
      'reset': 'Reset',
      'submit': 'Submit',
      'send': 'Send',
      'receive': 'Receive',
      'upload': 'Upload',
      'download': 'Download',
      'share': 'Share',
      'copy': 'Copy',
      'paste': 'Paste',
      'cut': 'Cut',
      'select': 'Select',
      'selectAll': 'Select All',
      'settings': 'Settings',
      'profile': 'Profile',
      'help': 'Help',
      'about': 'About',
      'logout': 'Logout',
      'login': 'Login',
      'register': 'Register',
      'forgotPassword': 'Forgot Password',
      'changePassword': 'Change Password',
      'userName': 'Username',
      'email': 'Email',
      'password': 'Password',
      'confirmPassword': 'Confirm Password',
      'firstName': 'First Name',
      'lastName': 'Last Name',
      'fullName': 'Full Name',
      'phoneNumber': 'Phone Number',
      'address': 'Address',
      'city': 'City',
      'country': 'Country',
      'zipCode': 'ZIP Code',
      'birthday': 'Birthday',
      'gender': 'Gender',
      'male': 'Male',
      'female': 'Female',
      'other': 'Other',

      // Form validation
      'fieldRequired': 'This field is required',
      'emailInvalid': 'Please enter a valid email address',
      'passwordTooShort': 'Password must be at least 8 characters',
      'passwordsNotMatch': 'Passwords do not match',
      'phoneInvalid': 'Please enter a valid phone number',

      // Network errors
      'networkError': 'Network connection error',
      'serverError': 'Server error occurred',
      'timeoutError': 'Request timeout',
      'noInternetConnection': 'No internet connection',
      'connectionLost': 'Connection lost',
      'tryAgainLater': 'Please try again later',

      // Data states
      'noData': 'No data available',
      'noResults': 'No results found',
      'emptyList': 'The list is empty',
      'dataLoaded': 'Data loaded successfully',
      'dataSaved': 'Data saved successfully',
      'dataDeleted': 'Data deleted successfully',
      'dataUpdated': 'Data updated successfully',

      // Time and dates
      'today': 'Today',
      'yesterday': 'Yesterday',
      'tomorrow': 'Tomorrow',
      'thisWeek': 'This Week',
      'lastWeek': 'Last Week',
      'thisMonth': 'This Month',
      'lastMonth': 'Last Month',
      'thisYear': 'This Year',
      'lastYear': 'Last Year',
      'now': 'Now',
      'justNow': 'Just now',
      'minuteAgo': 'minute ago',
      'minutesAgo': 'minutes ago',
      'hourAgo': 'hour ago',
      'hoursAgo': 'hours ago',
      'dayAgo': 'day ago',
      'daysAgo': 'days ago',
      'weekAgo': 'week ago',
      'weeksAgo': 'weeks ago',
      'monthAgo': 'month ago',
      'monthsAgo': 'months ago',
      'yearAgo': 'year ago',
      'yearsAgo': 'years ago',

      // Days of week
      'monday': 'Monday',
      'tuesday': 'Tuesday',
      'wednesday': 'Wednesday',
      'thursday': 'Thursday',
      'friday': 'Friday',
      'saturday': 'Saturday',
      'sunday': 'Sunday',

      // Months
      'january': 'January',
      'february': 'February',
      'march': 'March',
      'april': 'April',
      'may': 'May',
      'june': 'June',
      'july': 'July',
      'august': 'August',
      'september': 'September',
      'october': 'October',
      'november': 'November',
      'december': 'December',
    },
    'es': {
      // Common UI
      'loading': 'Cargando...',
      'error': 'Error',
      'success': 'Éxito',
      'warning': 'Advertencia',
      'info': 'Información',
      'confirm': 'Confirmar',
      'cancel': 'Cancelar',
      'ok': 'Vale',
      'yes': 'Sí',
      'no': 'No',
      'save': 'Guardar',
      'delete': 'Eliminar',
      'edit': 'Editar',
      'add': 'Añadir',
      'remove': 'Quitar',
      'update': 'Actualizar',
      'refresh': 'Actualizar',
      'retry': 'Reintentar',
      'close': 'Cerrar',
      'back': 'Atrás',
      'next': 'Siguiente',
      'previous': 'Anterior',
      'done': 'Hecho',
      'continue': 'Continuar',
      'skip': 'Saltar',
      'search': 'Buscar',
      'filter': 'Filtrar',
      'sort': 'Ordenar',
      'clear': 'Limpiar',
      'reset': 'Reiniciar',
      'submit': 'Enviar',
      'send': 'Enviar',
      'receive': 'Recibir',
      'upload': 'Subir',
      'download': 'Descargar',
      'share': 'Compartir',
      'copy': 'Copiar',
      'paste': 'Pegar',
      'cut': 'Cortar',
      'select': 'Seleccionar',
      'selectAll': 'Seleccionar Todo',
      'settings': 'Configuración',
      'profile': 'Perfil',
      'help': 'Ayuda',
      'about': 'Acerca de',
      'logout': 'Cerrar Sesión',
      'login': 'Iniciar Sesión',
      'register': 'Registrarse',
      'forgotPassword': 'Olvidé mi Contraseña',
      'changePassword': 'Cambiar Contraseña',
      'userName': 'Nombre de Usuario',
      'email': 'Correo Electrónico',
      'password': 'Contraseña',
      'confirmPassword': 'Confirmar Contraseña',
      'firstName': 'Nombre',
      'lastName': 'Apellido',
      'fullName': 'Nombre Completo',
      'phoneNumber': 'Número de Teléfono',
      'address': 'Dirección',
      'city': 'Ciudad',
      'country': 'País',
      'zipCode': 'Código Postal',
      'birthday': 'Fecha de Nacimiento',
      'gender': 'Género',
      'male': 'Masculino',
      'female': 'Femenino',
      'other': 'Otro',

      // Form validation
      'fieldRequired': 'Este campo es obligatorio',
      'emailInvalid': 'Ingrese un correo electrónico válido',
      'passwordTooShort': 'La contraseña debe tener al menos 8 caracteres',
      'passwordsNotMatch': 'Las contraseñas no coinciden',
      'phoneInvalid': 'Ingrese un número de teléfono válido',

      // Network errors
      'networkError': 'Error de conexión de red',
      'serverError': 'Error del servidor',
      'timeoutError': 'Tiempo de espera agotado',
      'noInternetConnection': 'Sin conexión a internet',
      'connectionLost': 'Conexión perdida',
      'tryAgainLater': 'Inténtelo de nuevo más tarde',

      // Data states
      'noData': 'No hay datos disponibles',
      'noResults': 'No se encontraron resultados',
      'emptyList': 'La lista está vacía',
      'dataLoaded': 'Datos cargados correctamente',
      'dataSaved': 'Datos guardados correctamente',
      'dataDeleted': 'Datos eliminados correctamente',
      'dataUpdated': 'Datos actualizados correctamente',

      // Time and dates
      'today': 'Hoy',
      'yesterday': 'Ayer',
      'tomorrow': 'Mañana',
      'thisWeek': 'Esta Semana',
      'lastWeek': 'Semana Pasada',
      'thisMonth': 'Este Mes',
      'lastMonth': 'Mes Pasado',
      'thisYear': 'Este Año',
      'lastYear': 'Año Pasado',
      'now': 'Ahora',
      'justNow': 'Justo ahora',
      'minuteAgo': 'hace un minuto',
      'minutesAgo': 'hace minutos',
      'hourAgo': 'hace una hora',
      'hoursAgo': 'hace horas',
      'dayAgo': 'hace un día',
      'daysAgo': 'hace días',
      'weekAgo': 'hace una semana',
      'weeksAgo': 'hace semanas',
      'monthAgo': 'hace un mes',
      'monthsAgo': 'hace meses',
      'yearAgo': 'hace un año',
      'yearsAgo': 'hace años',

      // Days of week
      'monday': 'Lunes',
      'tuesday': 'Martes',
      'wednesday': 'Miércoles',
      'thursday': 'Jueves',
      'friday': 'Viernes',
      'saturday': 'Sábado',
      'sunday': 'Domingo',

      // Months
      'january': 'Enero',
      'february': 'Febrero',
      'march': 'Marzo',
      'april': 'Abril',
      'may': 'Mayo',
      'june': 'Junio',
      'july': 'Julio',
      'august': 'Agosto',
      'september': 'Septiembre',
      'october': 'Octubre',
      'november': 'Noviembre',
      'december': 'Diciembre',
    },
    'fr': {
      // Common UI
      'loading': 'Chargement...',
      'error': 'Erreur',
      'success': 'Succès',
      'warning': 'Attention',
      'info': 'Information',
      'confirm': 'Confirmer',
      'cancel': 'Annuler',
      'ok': 'OK',
      'yes': 'Oui',
      'no': 'Non',
      'save': 'Enregistrer',
      'delete': 'Supprimer',
      'edit': 'Modifier',
      'add': 'Ajouter',
      'remove': 'Retirer',
      'update': 'Mettre à jour',
      'refresh': 'Actualiser',
      'retry': 'Réessayer',
      'close': 'Fermer',
      'back': 'Retour',
      'next': 'Suivant',
      'previous': 'Précédent',
      'done': 'Terminé',
      'continue': 'Continuer',
      'skip': 'Ignorer',
      'search': 'Rechercher',
      'filter': 'Filtrer',
      'sort': 'Trier',
      'clear': 'Effacer',
      'reset': 'Réinitialiser',
      'submit': 'Soumettre',
      'send': 'Envoyer',
      'receive': 'Recevoir',
      'upload': 'Télécharger',
      'download': 'Télécharger',
      'share': 'Partager',
      'copy': 'Copier',
      'paste': 'Coller',
      'cut': 'Couper',
      'select': 'Sélectionner',
      'selectAll': 'Tout Sélectionner',
      'settings': 'Paramètres',
      'profile': 'Profil',
      'help': 'Aide',
      'about': 'À propos',
      'logout': 'Déconnexion',
      'login': 'Connexion',
      'register': 'S\'inscrire',
      'forgotPassword': 'Mot de passe oublié',
      'changePassword': 'Changer le mot de passe',
      'userName': 'Nom d\'utilisateur',
      'email': 'E-mail',
      'password': 'Mot de passe',
      'confirmPassword': 'Confirmer le mot de passe',
      'firstName': 'Prénom',
      'lastName': 'Nom',
      'fullName': 'Nom complet',
      'phoneNumber': 'Numéro de téléphone',
      'address': 'Adresse',
      'city': 'Ville',
      'country': 'Pays',
      'zipCode': 'Code postal',
      'birthday': 'Date de naissance',
      'gender': 'Genre',
      'male': 'Masculin',
      'female': 'Féminin',
      'other': 'Autre',

      // Form validation
      'fieldRequired': 'Ce champ est obligatoire',
      'emailInvalid': 'Veuillez saisir une adresse e-mail valide',
      'passwordTooShort': 'Le mot de passe doit contenir au moins 8 caractères',
      'passwordsNotMatch': 'Les mots de passe ne correspondent pas',
      'phoneInvalid': 'Veuillez saisir un numéro de téléphone valide',

      // Network errors
      'networkError': 'Erreur de connexion réseau',
      'serverError': 'Erreur du serveur',
      'timeoutError': 'Délai d\'attente dépassé',
      'noInternetConnection': 'Pas de connexion Internet',
      'connectionLost': 'Connexion perdue',
      'tryAgainLater': 'Veuillez réessayer plus tard',

      // Data states
      'noData': 'Aucune donnée disponible',
      'noResults': 'Aucun résultat trouvé',
      'emptyList': 'La liste est vide',
      'dataLoaded': 'Données chargées avec succès',
      'dataSaved': 'Données enregistrées avec succès',
      'dataDeleted': 'Données supprimées avec succès',
      'dataUpdated': 'Données mises à jour avec succès',

      // Time and dates
      'today': 'Aujourd\'hui',
      'yesterday': 'Hier',
      'tomorrow': 'Demain',
      'thisWeek': 'Cette semaine',
      'lastWeek': 'Semaine dernière',
      'thisMonth': 'Ce mois',
      'lastMonth': 'Mois dernier',
      'thisYear': 'Cette année',
      'lastYear': 'Année dernière',
      'now': 'Maintenant',
      'justNow': 'À l\'instant',
      'minuteAgo': 'il y a une minute',
      'minutesAgo': 'il y a quelques minutes',
      'hourAgo': 'il y a une heure',
      'hoursAgo': 'il y a quelques heures',
      'dayAgo': 'il y a un jour',
      'daysAgo': 'il y a quelques jours',
      'weekAgo': 'il y a une semaine',
      'weeksAgo': 'il y a quelques semaines',
      'monthAgo': 'il y a un mois',
      'monthsAgo': 'il y a quelques mois',
      'yearAgo': 'il y a un an',
      'yearsAgo': 'il y a quelques années',

      // Days of week
      'monday': 'Lundi',
      'tuesday': 'Mardi',
      'wednesday': 'Mercredi',
      'thursday': 'Jeudi',
      'friday': 'Vendredi',
      'saturday': 'Samedi',
      'sunday': 'Dimanche',

      // Months
      'january': 'Janvier',
      'february': 'Février',
      'march': 'Mars',
      'april': 'Avril',
      'may': 'Mai',
      'june': 'Juin',
      'july': 'Juillet',
      'august': 'Août',
      'september': 'Septembre',
      'october': 'Octobre',
      'november': 'Novembre',
      'december': 'Décembre',
    },
    'zh': {
      // Common UI
      'loading': '加载中...',
      'error': '错误',
      'success': '成功',
      'warning': '警告',
      'info': '信息',
      'confirm': '确认',
      'cancel': '取消',
      'ok': '确定',
      'yes': '是',
      'no': '否',
      'save': '保存',
      'delete': '删除',
      'edit': '编辑',
      'add': '添加',
      'remove': '移除',
      'update': '更新',
      'refresh': '刷新',
      'retry': '重试',
      'close': '关闭',
      'back': '返回',
      'next': '下一步',
      'previous': '上一步',
      'done': '完成',
      'continue': '继续',
      'skip': '跳过',
      'search': '搜索',
      'filter': '筛选',
      'sort': '排序',
      'clear': '清除',
      'reset': '重置',
      'submit': '提交',
      'send': '发送',
      'receive': '接收',
      'upload': '上传',
      'download': '下载',
      'share': '分享',
      'copy': '复制',
      'paste': '粘贴',
      'cut': '剪切',
      'select': '选择',
      'selectAll': '全选',
      'settings': '设置',
      'profile': '个人资料',
      'help': '帮助',
      'about': '关于',
      'logout': '退出登录',
      'login': '登录',
      'register': '注册',
      'forgotPassword': '忘记密码',
      'changePassword': '修改密码',
      'userName': '用户名',
      'email': '邮箱',
      'password': '密码',
      'confirmPassword': '确认密码',
      'firstName': '名',
      'lastName': '姓',
      'fullName': '全名',
      'phoneNumber': '电话号码',
      'address': '地址',
      'city': '城市',
      'country': '国家',
      'zipCode': '邮政编码',
      'birthday': '生日',
      'gender': '性别',
      'male': '男',
      'female': '女',
      'other': '其他',

      // Form validation
      'fieldRequired': '此字段为必填项',
      'emailInvalid': '请输入有效的邮箱地址',
      'passwordTooShort': '密码至少需要8个字符',
      'passwordsNotMatch': '密码不匹配',
      'phoneInvalid': '请输入有效的电话号码',

      // Network errors
      'networkError': '网络连接错误',
      'serverError': '服务器错误',
      'timeoutError': '请求超时',
      'noInternetConnection': '无网络连接',
      'connectionLost': '连接丢失',
      'tryAgainLater': '请稍后重试',

      // Data states
      'noData': '暂无数据',
      'noResults': '未找到结果',
      'emptyList': '列表为空',
      'dataLoaded': '数据加载成功',
      'dataSaved': '数据保存成功',
      'dataDeleted': '数据删除成功',
      'dataUpdated': '数据更新成功',

      // Time and dates
      'today': '今天',
      'yesterday': '昨天',
      'tomorrow': '明天',
      'thisWeek': '本周',
      'lastWeek': '上周',
      'thisMonth': '本月',
      'lastMonth': '上月',
      'thisYear': '今年',
      'lastYear': '去年',
      'now': '现在',
      'justNow': '刚刚',
      'minuteAgo': '1分钟前',
      'minutesAgo': '分钟前',
      'hourAgo': '1小时前',
      'hoursAgo': '小时前',
      'dayAgo': '1天前',
      'daysAgo': '天前',
      'weekAgo': '1周前',
      'weeksAgo': '周前',
      'monthAgo': '1个月前',
      'monthsAgo': '个月前',
      'yearAgo': '1年前',
      'yearsAgo': '年前',

      // Days of week
      'monday': '周一',
      'tuesday': '周二',
      'wednesday': '周三',
      'thursday': '周四',
      'friday': '周五',
      'saturday': '周六',
      'sunday': '周日',

      // Months
      'january': '一月',
      'february': '二月',
      'march': '三月',
      'april': '四月',
      'may': '五月',
      'june': '六月',
      'july': '七月',
      'august': '八月',
      'september': '九月',
      'october': '十月',
      'november': '十一月',
      'december': '十二月',
    },
  };

  /// Get localized string by key
  String get(String key) {
    final languageCode = locale.languageCode;
    final languageStrings =
        _localizedValues[languageCode] ?? _localizedValues['en']!;
    return languageStrings[key] ?? key;
  }

  // Getter methods for common strings
  String get loading => get('loading');
  String get error => get('error');
  String get success => get('success');
  String get warning => get('warning');
  String get info => get('info');
  String get confirm => get('confirm');
  String get cancel => get('cancel');
  String get ok => get('ok');
  String get yes => get('yes');
  String get no => get('no');
  String get save => get('save');
  String get delete => get('delete');
  String get edit => get('edit');
  String get add => get('add');
  String get remove => get('remove');
  String get update => get('update');
  String get refresh => get('refresh');
  String get retry => get('retry');
  String get close => get('close');
  String get back => get('back');
  String get next => get('next');
  String get previous => get('previous');
  String get done => get('done');
  String get continueText => get('continue');
  String get skip => get('skip');
  String get search => get('search');
  String get filter => get('filter');
  String get sort => get('sort');
  String get clear => get('clear');
  String get reset => get('reset');
  String get submit => get('submit');
  String get send => get('send');
  String get receive => get('receive');
  String get upload => get('upload');
  String get download => get('download');
  String get share => get('share');
  String get copy => get('copy');
  String get paste => get('paste');
  String get cut => get('cut');
  String get select => get('select');
  String get selectAll => get('selectAll');
  String get settings => get('settings');
  String get profile => get('profile');
  String get help => get('help');
  String get about => get('about');
  String get logout => get('logout');
  String get login => get('login');
  String get register => get('register');
  String get forgotPassword => get('forgotPassword');
  String get changePassword => get('changePassword');
  String get userName => get('userName');
  String get email => get('email');
  String get password => get('password');
  String get confirmPassword => get('confirmPassword');
  String get firstName => get('firstName');
  String get lastName => get('lastName');
  String get fullName => get('fullName');
  String get phoneNumber => get('phoneNumber');
  String get address => get('address');
  String get city => get('city');
  String get country => get('country');
  String get zipCode => get('zipCode');
  String get birthday => get('birthday');
  String get gender => get('gender');
  String get male => get('male');
  String get female => get('female');
  String get other => get('other');

  // Form validation
  String get fieldRequired => get('fieldRequired');
  String get emailInvalid => get('emailInvalid');
  String get passwordTooShort => get('passwordTooShort');
  String get passwordsNotMatch => get('passwordsNotMatch');
  String get phoneInvalid => get('phoneInvalid');

  // Network errors
  String get networkError => get('networkError');
  String get serverError => get('serverError');
  String get timeoutError => get('timeoutError');
  String get noInternetConnection => get('noInternetConnection');
  String get connectionLost => get('connectionLost');
  String get tryAgainLater => get('tryAgainLater');

  // Data states
  String get noData => get('noData');
  String get noResults => get('noResults');
  String get emptyList => get('emptyList');
  String get dataLoaded => get('dataLoaded');
  String get dataSaved => get('dataSaved');
  String get dataDeleted => get('dataDeleted');
  String get dataUpdated => get('dataUpdated');

  // Time and dates
  String get today => get('today');
  String get yesterday => get('yesterday');
  String get tomorrow => get('tomorrow');
  String get thisWeek => get('thisWeek');
  String get lastWeek => get('lastWeek');
  String get thisMonth => get('thisMonth');
  String get lastMonth => get('lastMonth');
  String get thisYear => get('thisYear');
  String get lastYear => get('lastYear');
  String get now => get('now');
  String get justNow => get('justNow');
  String get minuteAgo => get('minuteAgo');
  String get minutesAgo => get('minutesAgo');
  String get hourAgo => get('hourAgo');
  String get hoursAgo => get('hoursAgo');
  String get dayAgo => get('dayAgo');
  String get daysAgo => get('daysAgo');
  String get weekAgo => get('weekAgo');
  String get weeksAgo => get('weeksAgo');
  String get monthAgo => get('monthAgo');
  String get monthsAgo => get('monthsAgo');
  String get yearAgo => get('yearAgo');
  String get yearsAgo => get('yearsAgo');

  // Days of week
  String get monday => get('monday');
  String get tuesday => get('tuesday');
  String get wednesday => get('wednesday');
  String get thursday => get('thursday');
  String get friday => get('friday');
  String get saturday => get('saturday');
  String get sunday => get('sunday');

  // Months
  String get january => get('january');
  String get february => get('february');
  String get march => get('march');
  String get april => get('april');
  String get may => get('may');
  String get june => get('june');
  String get july => get('july');
  String get august => get('august');
  String get september => get('september');
  String get october => get('october');
  String get november => get('november');
  String get december => get('december');
}

/// Localization delegate for AppLocalizations
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales.any(
      (supportedLocale) => supportedLocale.languageCode == locale.languageCode,
    );
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
