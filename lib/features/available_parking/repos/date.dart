class Date{
  String convert3(String date) {
    //input 2024-09-08 17:30:00.000
    List<String> splitted = date.split(" ");
    String splittedDate = splitted[0];
    List<String> splittedDate2 = splittedDate.split("-");
       Map months = {
      "01": "January",
      "02": "February",
      "03": "March",
      "04": "April",
      "05": "May",
      "06": "June",
      "07": "July",
      "08": "August",
      "09": "September",
      "10": "October",
      "11": "November",
      "12": "December",
    };
    String convertedDate =
        "${splittedDate2[2]}${months[splittedDate2[1]]} ${splittedDate2[0]}";

 
    String ordinalDate =
        convertedDate.replaceFirstMapped(RegExp(r'\d+'), (match) {
      int day = int.parse(match.group(0) ?? "0");
      String suffix = getOrdinalSuffix(day);
      return '$day$suffix ';
    });

    return ordinalDate;
    //output 8th September 2024
  }

  String getOrdinalSuffix(int number) {
    if (number >= 11 && number <= 13) {
      return 'th';
    }
    switch (number % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

}