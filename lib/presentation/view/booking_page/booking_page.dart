import 'package:evcompanion2/presentation/view/payment_page_slot/payment_page_slot.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({
    Key? key,
    required this.stationName,
    required this.location,
  }) : super(key: key);

  final String stationName;
  final String location;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  double _sliderValue = 1.0;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 1,
        titleTextStyle: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        title: const Text('Book slot'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select schedule',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Calendar
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      blurRadius: 15,
                      offset: const Offset(4.0, 4.0),
                      spreadRadius: 1.0,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      blurRadius: 15,
                      offset: Offset(-4.0, -4.0),
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SfDateRangePicker(
                    minDate: DateTime.now(),
                    onSelectionChanged: _onSelectionChanged,
                    selectionTextStyle: const TextStyle(
                      fontSize: 18,
                    ),
                    monthCellStyle: const DateRangePickerMonthCellStyle(
                      todayTextStyle: TextStyle(
                        fontSize: 18,
                      ),
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    showNavigationArrow: true,
                    headerStyle: const DateRangePickerHeaderStyle(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    showTodayButton: true,
                    allowViewNavigation: true,
                    cancelText: 'back',
                    selectionMode: DateRangePickerSelectionMode.single,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Starting time
              GestureDetector(
                onTap: () {
                  _selectTime(context);
                },
                child: Container(
                  width: 170,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 15,
                        offset: const Offset(4.0, 4.0),
                        spreadRadius: 1.0,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        blurRadius: 15,
                        offset: Offset(-4.0, -4.0),
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Starting time',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _selectedTime.format(context),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Duration selection
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'How much time you need to change the vehicle?',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SfSlider(
                      labelPlacement: LabelPlacement.onTicks,
                      value: _sliderValue,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                      min: 1.0,
                      max: 10.0,
                      showTicks: true,
                      showDividers: true,
                      showLabels: true,
                      enableTooltip: true,
                      minorTicksPerInterval: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'hour',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '${_sliderValue.round()}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Price Estimation',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '${_sliderValue.round() * 150}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Continue button
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return PaymentSlot(
                      startingtime : _selectedTime.toString(),
                      stationName: widget.stationName,
                      duration: _sliderValue.round().toString(),
                      location: widget.location,
                      price: '${_sliderValue.round() * 150}',
                      date: DateFormat('yyyy-MM-dd').format(_selectedDate),
                      startTime: _selectedTime.format(context),
                    );
                  }));
                },
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        _selectedDate = args.value;
        print(DateFormat('yyyy-MM-dd').format(_selectedDate));
      }
    });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        print('Selected time: ${_selectedTime.format(context)}');
      });
    }
  }
}
