class Translate {
  String transalteMonth(String month) {
    switch (month) {
      case "January":
        return "يناير";
      case "February":
        return "فبراير";
      case "March":
        return "مارس";

      case "April":
        return "ابريل";

      case "May":
        return "مايو";

      case "June":
        return "يونيو";

      case "July":
        return "يولو";

      case "August":
        return "أغسطس";

      case "September":
        return "سبتمبر";

      case "October":
        return "أكتوبر";

      case "November":
        return "نوفمبر";

      case "December":
        return "ديسمبر";

      default:
        return "month not found";
    }
  }

  String translateDate(String text) {
    //input 5th October 2024
    List<String> date = text.split(" ");
    String day = date[0];
   // print(day);
    String month = date[1];
    String year = date[2];
    if (day.contains("st")) {
      day = day.replaceFirst("st", "");
    }
    if (day.contains("nd")) {
      day = day.replaceFirst("nd", "");
    }
    if (day.contains("rd")) {
      day = day.replaceFirst("rd", "");
    }
    if (day.contains("th")) {
      day = day.replaceFirst("th", "");
    }
    day = translateNumberToArabic(day);
    month = transalteMonth(month);
    year = translateNumberToArabic(year);
    return "$day $month $year";
  }

  String translateNumberToArabic(String number) {
    String result = "";
    // Handle special cases for numbers 1-10
    for (int i = 0; i < number.length; i++) {
      switch (number[i]) {
        case "0":
          result += '٠';
        case "1":
          result += '١';
        case "2":
          result += '٢';
        case "3":
          result += '٣';
        case "4":
          result += '٤';
        case "5":
          result += '٥';
        case "6":
          result += '٦';
        case "7":
          result += '٧';
        case "8":
          result += '٨';
        case "9":
          result += '٩';
        case ".":
          result += ",";
        case ":":
          result += ":";
      }
    }


    return result;
  }
}
