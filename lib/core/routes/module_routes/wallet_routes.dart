part of '../app_routes.dart';

class _WalletRoutes extends ModuleRoutesContract {
  const _WalletRoutes();

  static const String _wallet = '/wallet';
  static const String _currencyDetails = '/currency-details';
  static const String _selectCurrencyToAdd = '/select-currency-to-add';
  static const String _addCurrency = '/add-currency';

  String get wallet => _wallet;
  String get currencyDetails => _currencyDetails;
  String get selectCurrencyToAdd => _selectCurrencyToAdd;
  String get addCurrency => _addCurrency;

  @override
  Route<dynamic>? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case _wallet:
        return buildRoute(
          const WalletScreen(),
          guard: AuthGuard(),
        );
      case _currencyDetails:
        return buildRoute(
          CurrencyDetailsScreen(
            id: settings.arguments as int,
          ),
          guard: AuthGuard(),
        );
      case _selectCurrencyToAdd:
        return buildRoute(
          const SelectCurrencyToAddScreen(),
          guard: AuthGuard(),
        );
      case _addCurrency:
        return buildRoute(
          AddCurrencyScreen(
            id: settings.arguments as int,
          ),
          guard: AuthGuard(),
        );
      default:
        return null;
    }
  }
}
