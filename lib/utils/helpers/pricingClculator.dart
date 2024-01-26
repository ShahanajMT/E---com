// ignore: file_names

class TPriceCalculator {
  // ---- Calculate Price based on tax and Shipping ---- //
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);

    double taxAmount = productPrice * taxRate;

    double shippingCoast = getShippingCoast(location);

    double totalPrice = productPrice + taxAmount + shippingCoast;
    return totalPrice;
  }

  // ---- Calculate Shipping Coast ---- //

  static String calculateShippingCoast(double productPrice, String location) {
    double shippingCoast = getShippingCoast(location);
    return shippingCoast.toStringAsFixed(2);
  }

  // ---- Calculate Tax ---- //
  static String calculateTax(double productPrice, String location) {
    
    double taxRate = getTaxRateForLocation(location);

    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    return 0.10;
  }

  static double getShippingCoast(String location) {
    return 5.00;
  }
}
