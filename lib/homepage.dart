import 'package:age/age.dart';
import 'package:age_calculator/services/agecalculation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime todayDate = DateTime.now();
  DateTime dob = DateTime.now();
  AgeDuration _ageDuration;
  AgeDuration _nextBirthdate;
  int _nextBirthday;

  List<String> _months = [
    "months",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  List<String> _days = [
    "day",
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THURSDAY",
    "FRIDAY",
    "SATURDAY",
    "SUNDAY"
  ];
  Future<Null> _selectTodayDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate: dob,
        lastDate: DateTime(2101));
    if (picked != null && picked != todayDate) {
      setState(() {
        todayDate = picked;
        _ageDuration = AgeCalculation().caculateAge(todayDate, dob);
        _nextBirthdate = AgeCalculation().nextBirthday(todayDate, dob);
        _nextBirthday = AgeCalculation().nextday(todayDate, dob);
      });
    }
  }

  Future<Null> _selectDobDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: dob,
        firstDate: DateTime(1900),
        lastDate: todayDate);
    if (picked != null && picked != todayDate) {
      setState(() {
        dob = picked;
        _ageDuration = AgeCalculation().caculateAge(todayDate, dob);
        _nextBirthdate = AgeCalculation().nextBirthday(todayDate, dob);
        _nextBirthday = AgeCalculation().nextday(todayDate, dob);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _ageDuration = AgeCalculation().caculateAge(todayDate, dob);
    _nextBirthdate = AgeCalculation().nextBirthday(todayDate, dob);
    _nextBirthday = AgeCalculation().nextday(todayDate, dob);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 30,
                width: double.maxFinite,
              ),
              Text(
                "AGE CALCULATOR",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${todayDate.day} ${_months[todayDate.month]} ${todayDate.year}",
                          style: TextStyle(
                            color: Color(0xffCDDC39),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              _selectTodayDate(context);
                            },
                            child: Icon(Icons.calendar_today,
                                color: Colors.white)),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date Of Birth",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${dob.day} ${_months[dob.month]} ${dob.year}",
                          style: TextStyle(
                            color: Color(0xffCDDC39),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectDobDate(context);
                              });
                            },
                            child: Icon(Icons.calendar_today,
                                color: Colors.white)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                width: double.maxFinite,
                // height: 400,
                decoration: BoxDecoration(
                    color: Color(0xff333333),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          height: 200,
                          child: Column(
                            children: [
                              Text(
                                "AGE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${_ageDuration.years}",
                                    style: TextStyle(
                                        color: Color(0xffCDDC39),
                                        fontSize: 70,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 13),
                                    child: Text(
                                      "YEARS",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "${_ageDuration.months} months | ${_ageDuration.days} days",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 170,
                          width: 1,
                          color: Color(0xff999999),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "NEXT BIRTHDAY",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              Icon(
                                Icons.cake,
                                size: 40,
                                color: Color(0xffCDDC39),
                              ),
                              Text(
                                "${_days[_nextBirthday]}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "${_nextBirthdate.months} months | ${_nextBirthdate.days} days",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 1,
                      color: Color(0xff999999),
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "SUMMARY",
                        style: TextStyle(
                            color: Color(0xffCDDC39),
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "YEARS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${_ageDuration.years}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "MONTHS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${((_ageDuration.years) * 12) + (_ageDuration.months)}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "WEEKS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${(todayDate.difference(dob).inDays / 7).floor()}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "DAYS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${(todayDate.difference(dob).inDays).floor()}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "HOURS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${(todayDate.difference(dob).inHours).floor()}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "MINUTES",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${(todayDate.difference(dob).inMinutes).floor()}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
