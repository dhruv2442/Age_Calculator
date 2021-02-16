import 'package:age/age.dart';

class AgeCalculation {
  //Calculate Age of a Person
  AgeDuration caculateAge(DateTime today, DateTime birthDay) {
    AgeDuration age;
    age = Age.dateDifference(
        fromDate: birthDay, toDate: today, includeToDate: false);
    return age;
  }

  //Calculate the nextbirthday
  AgeDuration nextBirthday(DateTime today, DateTime birthday) {
    DateTime temp = DateTime(today.year, birthday.month, birthday.day);

    DateTime nextDob = temp.isBefore(today)
        ? Age.add(date: temp, duration: AgeDuration(years: 1))
        : temp;

    AgeDuration nextDobDuration =
        Age.dateDifference(fromDate: today, toDate: nextDob);
    return nextDobDuration;
  }

  //Calculate the  Next Birthday Weekday
  int nextday(DateTime today, DateTime birthday) {
    DateTime temp = DateTime(today.year, birthday.month, birthday.day);

    DateTime nextDob = temp.isBefore(today)
        ? Age.add(date: temp, duration: AgeDuration(years: 1))
        : temp;

    return nextDob.weekday;
  }
}
