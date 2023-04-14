/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter V2
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2023-present initappz.
*/
import 'package:get/get.dart';
import 'package:handyman_freelancer/app/backend/api/api.dart';
import 'package:handyman_freelancer/app/helper/shared_pref.dart';
import 'package:handyman_freelancer/app/util/constant.dart';

class ProductParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ProductParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getMyProducts(var body) async {
    var response = await apiService.postPrivate(AppConstants.getMyProducts,
        body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  Future<Response> deleteProduct(var body) async {
    var response = await apiService.postPrivate(AppConstants.deleteProduct,
        body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  Future<Response> updateStatus(var body) async {
    var response = await apiService.postPrivate(
        AppConstants.updateStatusOfProduct,
        body,
        sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  String getCurrenySymbol() {
    return sharedPreferencesManager.getString('currencySymbol') ??
        AppConstants.defaultCurrencySymbol;
  }

  String getCurrenySide() {
    return sharedPreferencesManager.getString('currencySide') ??
        AppConstants.defaultCurrencySide;
  }
}
