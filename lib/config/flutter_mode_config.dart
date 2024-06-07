class FlutterModeConfig {
  static bool get isOwner => true;

  static bool get isEmployee => true;

  static bool get isCustomer => true;

  static String get flutterMode => isOwner
      ? 'owner'
      : isEmployee
          ? 'employee'
          : 'customer';
}
