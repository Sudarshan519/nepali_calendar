// import 'package:flutter/material.dart';
// import 'package:flutter_calendar_carousel/classes/event.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';import 'package:intl/intl.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: Home(),
//     );
//   }
// }
 

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   DateTime _currentDate = DateTime.now();
//   DateTime _currentDate2 = DateTime.now();
//   String _currentMonth = DateFormat.yMMM().format(DateTime.now());
//   DateTime _targetDateTime = DateTime.now();

//   late CalendarCarousel _calendarCarouselNoHeader;

//   static Widget _eventIcon = new Container(
//     decoration: new BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(1000)),
//         border: Border.all(color: Colors.blue, width: 2.0)),
//     child: new Icon(
//       Icons.person,
//       color: Colors.amber,
//     ),
//   );

//   EventList<Event> _markedDateMap = new EventList<Event>(
//     events: {
//       new DateTime(2020, 2, 10): [
//         new Event(
//           date: new DateTime(2020, 2, 14),
//           title: 'Event 1',
//           icon: _eventIcon,
//           dot: Container(
//             margin: EdgeInsets.symmetric(horizontal: 1.0),
//             color: Colors.red,
//             height: 5.0,
//             width: 5.0,
//           ),
//         ),
//         new Event(
//           date: new DateTime(2020, 2, 10),
//           title: 'Event 2',
//           icon: _eventIcon,
//         ),
//         new Event(
//           date: new DateTime(2020, 2, 15),
//           title: 'Event 3',
//           icon: _eventIcon,
//         ),
//       ],
//     },
//   );

//   @override
//   void initState() {
//     _markedDateMap.add(
//         new DateTime(2020, 2, 25),
//         new Event(
//           date: new DateTime(2020, 2, 25),
//           title: 'Event 5',
//           icon: _eventIcon,
//         ));

//     _markedDateMap.add(
//         new DateTime(2020, 2, 10),
//         new Event(
//           date: new DateTime(2020, 2, 10),
//           title: 'Event 4',
//           icon: _eventIcon,
//         ));

//     _markedDateMap.addAll(new DateTime(2019, 2, 11), [
//       new Event(
//         date: new DateTime(2019, 2, 11),
//         title: 'Event 1',
//         icon: _eventIcon,
//       ),
//       new Event(
//         date: new DateTime(2019, 2, 11),
//         title: 'Event 2',
//         icon: _eventIcon,
//       ),
//       new Event(
//         date: new DateTime(2019, 2, 11),
//         title: 'Event 3',
//         icon: _eventIcon,
//       ),
//     ]);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _calendarCarouselNoHeader = CalendarCarousel<Event>(
//       // todayBorderColor: Colors.green,
//       // onDayPressed: (DateTime date, List<Event> events) {
//       //   this.setState(() => _currentDate2 = date);
//       //   events.forEach((event) => print(event.title));
//       // },
//       // daysHaveCircularBorder: true,
//     leftButtonIcon: Icon(Icons.arrow_back,color: Colors.grey,),
//       showOnlyCurrentMonthDate: false,
//       weekendTextStyle: TextStyle(
//         color: Colors.red,
//       ),
//       thisMonthDayBorderColor: Colors.grey,
//       weekFormat: false,
// //      firstDayOfWeek: 4,
//       markedDatesMap: _markedDateMap,
//       height: 420.0,
//       selectedDateTime: _currentDate2,
//       targetDateTime: _targetDateTime,
//       customGridViewPhysics: NeverScrollableScrollPhysics(),
//       // markedDateCustomShapeBorder:
//       //     CircleBorder(side: BorderSide(color: Colors.yellow)),
//       markedDateCustomTextStyle: TextStyle(
//         fontSize: 18,
//         color: Colors.blue,
//       ),
//       showHeader: false,
//       todayTextStyle: TextStyle(
//         color: Colors.blue,
//       ),

//       todayButtonColor: Colors.yellow,
//       selectedDayTextStyle: TextStyle(
//         color: Colors.yellow,
//       ),
//       minSelectedDate: _currentDate.subtract(Duration(days: 360)),
//       maxSelectedDate: _currentDate.add(Duration(days: 360)),
//       prevDaysTextStyle: TextStyle(
//         fontSize: 16,
//         color: Colors.pinkAccent,
//       ),
//       inactiveDaysTextStyle: TextStyle(
//         color: Colors.tealAccent,
//         fontSize: 16,
//       ),
//       onCalendarChanged: (DateTime date) {
//         this.setState(() {
//           _targetDateTime = date;
//           _currentMonth = DateFormat.yMMM().format(_targetDateTime);
//         });
//       },
//       onDayLongPressed: (DateTime date) {
//         print('long pressed date $date');
//       },
//     );

//     return new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Calendar'),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               //custom icon

//               Container(
//                 margin: EdgeInsets.only(
//                   top: 30.0,
//                   bottom: 16.0,
//                   left: 16.0,
//                   right: 16.0,
//                 ),
//                 child: new Row(
//                   children: <Widget>[
//                     Expanded(
//                         child: Text(
//                       _currentMonth,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 24.0,
//                       ),
//                     )),
//                     FlatButton(
//                       child: Text('PREV'),
//                       onPressed: () {
//                         setState(() {
//                           _targetDateTime = DateTime(
//                               _targetDateTime.year, _targetDateTime.month - 1);
//                           _currentMonth =
//                               DateFormat.yMMM().format(_targetDateTime);
//                         });
//                       },
//                     ),
//                     FlatButton(
//                       child: Text('NEXT'),
//                       onPressed: () {
//                         setState(() {
//                           _targetDateTime = DateTime(
//                               _targetDateTime.year, _targetDateTime.month + 1);
//                           _currentMonth =
//                               DateFormat.yMMM().format(_targetDateTime);
//                         });
//                       },
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 16.0),
//                 child: _calendarCarouselNoHeader,
//               ), //
//             ],
//           ),
//         ));
//   }
// }

 
import 'package:flutter/material.dart';
import 'package:nepali_utils/nepali_utils.dart';

import 'calendar.dart';

void main() {
  runApp(MaterialApp(home: MyApp(
    
  )));
}

enum CalendarViews{ dates, months, year }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
const Color white=Colors.white;const Color black=Colors.black;
const Color yellow  =Colors.yellow;

class _MyAppState extends State<MyApp> {

  late DateTime? _currentDateTime;
  late DateTime? _selectedDateTime;
  late List<Calendar>? _sequentialDates;
  late int? midYear;

  
  CalendarViews _currentView = CalendarViews.dates;
  final List<String> _weekDays = [ 'SUN','MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
  final List<String> _monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
final List<String> _monthNepali=['पुष-माघ',
'माघ-फाल्गुन','फाल्गुन-चैत्र','चैत्र-बैशाख','बैशाख-जेठ','जेठ-असार',  'असार-श्रावण','श्रावण-भदौ','भदौ-आश्विन','आश्विन-कार्तिक','कार्तिक-मंसिर','मंसिर-पुष'];
  @override
  void initState() {
    super.initState();
    final date = DateTime.now();
    _sequentialDates=[];
    _currentDateTime = DateTime(date.year, date.month);
    _selectedDateTime = DateTime(date.year, date.month, date.day);
     
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() => _getCalendar());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.deepOrange.withOpacity(.1),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          // padding: EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            //  color: Colors.deepOrange.withOpacity(.1),
            borderRadius: BorderRadius.circular(20),
          ),
          // child: _datesView()
        child:  (_currentView == CalendarViews.dates) ? _datesView() 
          : (_currentView == CalendarViews.months) ? _showMonthsList() : _yearsView(midYear ?? _currentDateTime!.year)
        ),
      ),
    );
  }

  // dates view
  Widget _datesView(){
    return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // header
              Container(decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),),color: Colors.deepOrange.withOpacity(.1),),
               padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: <Widget>[
                    // prev month button
                    _toggleBtn(false),
                    // month and year
                    InkWell(
                      // onTap: () => setState(() => _currentView = CalendarViews.months),
                      child: Center(
                        child: Text(
                          '${_monthNames[_currentDateTime!.month-1]}-${_currentDateTime!.year}',
                          style: TextStyle(color: black, fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    // next month button
                    _toggleBtn(true),
                    Spacer(),
                    Text('${_monthNepali[_currentDateTime!.month-1]}, ',style: TextStyle(color: black, fontSize: 18, fontWeight: FontWeight.w700),)
                ,Text(nepalilanguage.format( getnepali(_currentDateTime!,isYear: true)).toString(),style: TextStyle(color: black, fontSize: 18, fontWeight: FontWeight.w700)
                 ,), 
                ],
                ),
              ),
              // SizedBox(height: 20,),
              // Divider(color: white,),
              // SizedBox(height: 20,),
              Container(
                color: Colors.white,
                child: Container( 
                  height: 50,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                 decoration: BoxDecoration( color: black,borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [..._weekDays.map((e) => _weekDayTitle(e))],),
                ),
              ),
      //           child: GridView.builder(
      // shrinkWrap: true,
      // padding: EdgeInsets.zero,
      // itemCount: _weekDays.length,
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   mainAxisSpacing: 20,
      //   crossAxisCount: 7,
      //   crossAxisSpacing: 20,
      // ), 
      // itemBuilder: (context, index){
      //  return _weekDayTitle(index);}),
      //         ),
              Flexible(child: _calendarBody()),
            ],
          );
  }

  // next / prev month buttons
  Widget _toggleBtn(bool next) {
    return InkWell(
      onTap: (){
        if(_currentView == CalendarViews.dates){
          setState(() => (next) ? _getNextMonth() : _getPrevMonth());
        }
        else if(_currentView == CalendarViews.year){
          if(next){
            midYear = (midYear == null) ? _currentDateTime!.year + 9 : midYear! + 9;
          }
          else{
            midYear = (midYear == null) ? _currentDateTime!.year - 9 : midYear! - 9;
          }
          setState(() {});
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 50,
        height: 50,
       
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(25),
          // border: Border.all(color: white),
          // boxShadow: [
          //   BoxShadow(
          //     color: white.withOpacity(0.5),
          //     offset: Offset(3, 3),
          //     blurRadius: 3,
          //     spreadRadius: 0,
          //   ),
          // ],
          // gradient: LinearGradient(
          //   colors: [black, black.withOpacity(0.1)],
          //   stops: [0.5, 1],
          //   begin: Alignment.bottomRight,
          //   end: Alignment.topLeft,
          // )
        ),
        child: Icon((next) ? Icons.arrow_forward_ios : Icons.arrow_back_ios, color: black,),
      ),
    );
  }

  // calendar
  Widget _calendarBody() {
    if(_sequentialDates == null) return Container();
    return Container(
      height: MediaQuery.of(context).size.height ,
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),color: Colors.white),
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: _sequentialDates!.length ,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisCount: 7,
          crossAxisSpacing: 20,
           
        ), 
        itemBuilder: (context, index){
          // if(index < 7) return _weekDayTitle(index);
          if(_sequentialDates![index  ].date == _selectedDateTime) 
            return _selector(_sequentialDates![index  ]);
          return _calendarDates(_sequentialDates![index ]);
        },
      ),
    );
  }

  // calendar header
  Widget _weekDayTitle(e){
    return Text(e, style: TextStyle(color: Colors.yellow, fontSize: 12),);
  }

  // calendar element
  Widget _calendarDates(Calendar calendarDate){
    return Container(
      child: InkWell(
        onTap: (){
          if(_selectedDateTime != calendarDate.date){
            if(calendarDate.nextMonth){
              _getNextMonth();
            }
            else if(calendarDate.prevMonth){
              _getPrevMonth();
            }
            setState(() => _selectedDateTime = calendarDate.date);
          } 
        },
        child: Stack(children: [
          
             Center(
            child: Text(
              '${calendarDate.date.day}',
              style: TextStyle(
                color: (calendarDate.thisMonth) 
              ? (calendarDate.date.weekday == DateTime.sunday) ? Colors.yellow : black 
              : (calendarDate.date.weekday == DateTime.sunday) ? Colors.yellow.withOpacity(0.5) : black.withOpacity(0.5),
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          Align(alignment: Alignment.bottomRight,
          child: Text(
             getnepali(calendarDate.date ).toString()
            // DateTime(_currentDateTime.day).day.toString()+
            // today.format( getnepali(_currentDateTime.day).toNepaliDateTime())
            ,style: TextStyle(
            fontSize: 12,
            color: (calendarDate.thisMonth) 
              ? (calendarDate.date.weekday == DateTime.sunday) ? Colors.yellow : black 
              : (calendarDate.date.weekday == DateTime.sunday) ? Colors.yellow.withOpacity(0.5) : black.withOpacity(0.5),
            // color: black,
                fontWeight: FontWeight.w700),),)
          ],)
         ,
        // child: Center(
        //   child: Text(
        //     '${calendarDate.date.day}', 
        //     style: TextStyle(
        //       color: (calendarDate.thisMonth) 
        //       ? (calendarDate.date.weekday == DateTime.sunday) ? Colors.yellow : white 
        //       : (calendarDate.date.weekday == DateTime.sunday) ? Colors.yellow.withOpacity(0.5) : white.withOpacity(0.5),
        //     ),
        //   )
        // ),
      ),
    );
  }

  // date selector
  Widget _selector(Calendar calendarDate) {
    return Container(
      width: 30,
      height: 30,
       
      decoration: BoxDecoration(
        color: Colors.deepOrange,
         borderRadius: BorderRadius.circular(50),
        // border: Border.all(color: white, width: 4),
        // gradient: LinearGradient(
        //   colors: [black.withOpacity(0.1), white],
        //   stops: [0.1, 1],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
      ),
      child: CircleAvatar(backgroundColor:   Colors.deepOrange,
        child: Container(
          decoration: BoxDecoration(
            color:  Colors.deepOrange,// white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(50),
          ),
          child:Stack(children: [
             Positioned(
              left:10,bottom:15,
            child: Text(
              '${calendarDate.date.day}',
              style: TextStyle(
                color: white,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          Positioned(bottom: 5,right: 5,
          child: Text(today.format(calendarDate.date.toNepaliDateTime()) ,style: TextStyle(
            fontSize: 12,
            color: white,
                fontWeight: FontWeight.w700),),)
          ],)
        ),
      ),
    );
  }

  // get next month calendar
  void _getNextMonth(){
    if(_currentDateTime!.month == 12) {
      _currentDateTime = DateTime(_currentDateTime!.year+1, 1);
    }
    else{
      _currentDateTime = DateTime(_currentDateTime!.year, _currentDateTime!.month+1);
    }
    _getCalendar();
  }

  // get previous month calendar
  void _getPrevMonth(){
    if(_currentDateTime!.month == 1){
      _currentDateTime = DateTime(_currentDateTime!.year-1, 12);
    }
    else{
      _currentDateTime = DateTime(_currentDateTime!.year, _currentDateTime!.month-1);
    }
    _getCalendar();
  }

  // get calendar for current month
  void _getCalendar(){
    _sequentialDates = CustomCalendar().getMonthCalendar(_currentDateTime!.month, _currentDateTime!.year, startWeekDay: StartWeekDay.sunday);
  }

  // show months list
  Widget _showMonthsList(){
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () => setState(() => _currentView = CalendarViews.year),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('${_currentDateTime!.year}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: black),),
          ),
        ),
        Divider(color: white,),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _monthNames.length,
            itemBuilder: (context, index) => ListTile(
              onTap: (){
                _currentDateTime = DateTime(_currentDateTime!.year, index+1);
                _getCalendar();
                setState(() => _currentView = CalendarViews.dates);
              },
              title: Center(
                child: Text(
                  _monthNames[index], 
                  style: TextStyle(fontSize: 18, color: (index == _currentDateTime!.month-1) ? Colors.yellow : white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // years list views
  Widget _yearsView(int midYear){
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _toggleBtn(false),
            Spacer(),
            _toggleBtn(true),
          ],
        ),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ), 
            itemBuilder: (context, index){
              int thisYear;
              if(index < 4){
                thisYear = midYear - (4 - index);
              }
              else if(index > 4){
                thisYear = midYear + (index - 4);
              }
              else{
                thisYear = midYear;
              }
              return ListTile(
                onTap: (){
                  _currentDateTime = DateTime(thisYear, _currentDateTime!.month);
                  _getCalendar();
                  setState(() => _currentView = CalendarViews.months);
                },
                title: Text(
                  '$thisYear', 
                  style: TextStyle(fontSize: 18, color: (thisYear == _currentDateTime!.year) ? Colors.yellow : white),
                ),
              );
            }
          ),
        ),
      ],
    );
  }
}
var nepalilanguage = NepaliNumberFormat(
    // inWords: true,
    language: Language.nepali,
    isMonetory: true,
    decimalDigits: 0,
);
var today = NepaliDateFormat.d(Language.nepali);

  getnepali(DateTime date, {bool isYear=false}){ 
    
    // print(( date.toNepaliDateTime().day));
    if(isYear)
    
    // print(date.toNepaliDateTime().year);
    return date.toNepaliDateTime().year.toString();
    else
return nepalilanguage.format(date.toNepaliDateTime().day);

// DateTime(DateTime.now().year,date,date);
 
}