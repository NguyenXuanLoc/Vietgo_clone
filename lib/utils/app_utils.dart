import 'package:intl/intl.dart';
import 'package:mealup/model/single_restaurants_details_model.dart';

import 'constants.dart';

class AppUtils {
  static String formatMoney(int? money) {
    return NumberFormat('#,###,###,#,###,###,###', 'vi').format(money ?? 0);
  }

  static double getDiscountPrice(
      double currentPrice, VendorDiscount? vendorDiscount) {
    if (vendorDiscount == null) {
      return currentPrice;
    }
    String apiData = vendorDiscount.startEndDate ?? '';
    var parts = apiData.split(' - ');
    DateTime startDate = DateFormat('yyyy-MM-dd').parse(parts.first);
    DateTime endDate = DateFormat('yyyy-MM-dd').parse(parts.last);

    DateTime now = DateTime.now();

    if (startDate.isBefore(now) &&
            endDate.isAfter(now) &&
            vendorDiscount.type == Constants.percentage ||
        vendorDiscount.type == Constants.percent) {
      return (currentPrice -
          (currentPrice *
              (double.parse((vendorDiscount.discount ?? '0').toString())) /
              100));
    }
    return currentPrice;
  }
}
