import 'package:intl/intl.dart';

class AppUtils {
  static String formatMoney(int? money) {
    return NumberFormat('#,###,###,#,###,###,###', 'vi').format(money ?? 0);
  }
}
