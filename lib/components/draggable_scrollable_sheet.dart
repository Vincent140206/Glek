import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDraggableScrollableSheet extends StatefulWidget {
  const CustomDraggableScrollableSheet({super.key});

  @override
  State<CustomDraggableScrollableSheet> createState() => _CustomDraggableScrollableSheetState();
}

class _CustomDraggableScrollableSheetState extends State<CustomDraggableScrollableSheet> {
  bool isActive = true;

  TimeOfDay? selectedTime;

  void _pickTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.3,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(1, -1),
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ListView(
                    controller: scrollController,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Next Schedule',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0XFF1A1A1A),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: _pickTime , icon: Icon(Icons.add)
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      ScheduleItem(
                        amount: '1000',
                        time: '10:00 AM',
                        isActive: isActive,
                      ),
                      SizedBox(height: 12,),
                      ScheduleItem(
                        amount: '500',
                        time: '12:00 PM',
                        isActive: !isActive,
                      ),
                      SizedBox(height: 12,),
                      ScheduleItem(
                        amount: '750',
                        time: '02:00 PM',
                        isActive: isActive,
                      ),
                      SizedBox(height: 20,),
                      const Text(
                        'Water Intake History',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...List.generate(
                        10,
                            (index) {
                          int hour = 10 + index;
                          String period = hour < 12 ? 'AM' : 'PM';
                          int displayHour = hour <= 12 ? hour : hour - 12;

                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '$displayHour:00 $period',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Glass ${index + 1}',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${200 + (index * 50)} ml',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ScheduleItem extends StatelessWidget {
  final String amount;
  final String time;
  final bool isActive;

  const ScheduleItem({
    super.key,
    required this.amount,
    required this.time,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 24,
            decoration: BoxDecoration(
              color: isActive ? Colors.blue[300] : Colors.grey[400],
              borderRadius: BorderRadius.circular(12),
            ),
            child: AnimatedAlign(
              duration: Duration(milliseconds: 250),
              alignment: isActive ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 20,
                height: 20,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time: $time',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0XFF1A1A1A),
                    ),
                  ),
                  Text(
                    '$amount ml',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              )
          ),
          Icon(Icons.more_horiz)
        ],
      ),
    );
  }
}
