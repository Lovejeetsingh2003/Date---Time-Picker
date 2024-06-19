import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  var dateFormat = DateFormat("dd-MMM-yyyy");
  var timeFormat = DateFormat("hh-mm");
  var pickDate = "Date";
  var pickDate2 = "Date";
  var picktime = "Time";
  var picktime1 = "Time";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date-Time Picker"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () async {
                    var date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    );
                    var formatDate = dateFormat.format(
                      date ?? DateTime.now(),
                    );
                    pickDate = formatDate;
                    setState(() {});
                  },
                  child: const Text("Get date"),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Text(pickDate))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    var date = showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    ).then((value) {
                      var formatDate1 = dateFormat.format(
                        value ?? DateTime.now(),
                      );
                      pickDate2 = formatDate1;
                      setState(() {});
                    });

                    setState(() {});
                  },
                  child: const Text("Get date without await"),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Text(pickDate2),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () async {
                    var time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    var pickedTime = DateTime(
                        2024, 6, 8, time?.hour ?? 0, time?.minute ?? 0);
                    var formatedTime = timeFormat.format(pickedTime);
                    picktime = formatedTime;
                    setState(() {});
                  },
                  child: const Text("Get Time"),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Text(picktime),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    var time = showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then(
                      (value) {
                        var pickedTime = DateTime(
                            2024, 6, 8, value?.hour ?? 0, value?.minute ?? 0);
                        var formatedTime = timeFormat.format(pickedTime);
                        picktime1 = formatedTime;
                        setState(() {});
                      },
                    );
                  },
                  child: const Text("Get Time without await"),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Text(picktime1),
              )
            ],
          ),
        ],
      ),
    );
  }
}
