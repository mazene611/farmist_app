import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/datetime.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:farmist/models/todo_dm.dart';
import 'package:farmist/ui/providers/list_provider.dart';

import 'package:farmist/ui/todo/list/todo_widget_item.dart';
import 'package:provider/provider.dart';

class ListTodo extends StatefulWidget {
  @override
  State<ListTodo> createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  late ListProvider provider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.refershTodoList();
    });

  }
  // List<TodoDm> todos = [];

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    if(provider.todos.isEmpty){
    }
    return Column(
      children: [
        TimelineCalendar(

          calendarType: CalendarType.GREGORIAN,
          calendarLanguage: "en",
          dateTime: provider.selectedDate,
          calendarOptions: CalendarOptions(
            viewType: ViewType.DAILY,
            toggleViewType: true,
            headerMonthElevation: 10,
            headerMonthShadowColor: Colors.black26,
            headerMonthBackColor: Colors.transparent,
          ),
          dayOptions: DayOptions(
            compactMode: true,
            weekDaySelectedColor: Color.fromRGBO(32, 220, 45, 100), // Color for the selected week day
            selectedBackgroundColor: Color.fromRGBO(32, 220, 45, 100), // Color for the selected date
            disableDaysBeforeNow: false,
            disableDaysAfterNow: false,

            // Allow selection of dates after the current date
          ),
          headerOptions: HeaderOptions(
            weekDayStringType: WeekDayStringTypes.SHORT,
            monthStringType: MonthStringTypes.FULL,
            backgroundColor: Color.fromRGBO(32, 220, 45, 100),
            headerTextColor: Colors.black,
          ),
          onChangeDateTime: (datetime) {
              provider.selectedDate = datetime;
              provider.refershTodoList();
          },
        )


        ,
        Expanded(
          child: ListView.builder(itemBuilder:
          (context , index)=> TodoItem(model: provider.todos[index])
          ,
            itemCount: provider.todos.length,
          ),
        ),
      ],
    );
  }




}
