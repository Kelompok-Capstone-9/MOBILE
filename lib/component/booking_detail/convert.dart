import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {
  final formatter = DateFormat("MMMM, d'th' h a");
  String formattedDate = formatter.format(dateTime);

  if (dateTime.hour >= 5 && dateTime.hour < 12) {
    formattedDate += " - ${dateTime.hour}AM";
  } else if (dateTime.hour >= 12 && dateTime.hour < 17) {
    formattedDate += " - ${dateTime.hour - 12}PM";
  }

  return formattedDate;
}

String formatDateOnly(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Menggunakan DateFormat untuk mengambil tahun, bulan, dan tanggal
  String formattedDate = DateFormat.yMMMMd().format(dateTime);

  return formattedDate;
}

String formatCurrency(int amount) {
  final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ');
  return currencyFormat.format(amount);
}

String formatCurrencyNonLabel(int amount) {
  final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: '');
  return currencyFormat.format(amount);
}

String formatTimeOnly(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Menggunakan DateFormat dengan pola "hh:mm a" untuk mengambil jam beserta informasi AM/PM
  String formattedTime = DateFormat("hh:mm a").format(dateTime);

  return formattedTime;
}
