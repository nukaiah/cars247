import 'dart:developer';

import 'package:carwash/Constants/AppButtons.dart';
import 'package:carwash/Constants/AppColors.dart';
import 'package:carwash/Constants/AppStyles.dart';
import 'package:carwash/Constants/SliverAppBar.dart';
import 'package:carwash/Views/DashboardView.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BookAppointmentView extends StatefulWidget {
  CarWashService carWashService;

  BookAppointmentView({super.key, required this.carWashService});

  @override
  State<BookAppointmentView> createState() => _BookAppointmentViewState();
}

class _BookAppointmentViewState extends State<BookAppointmentView> {

  List<DateTime> datelist = [];
  LoopDates() {
    for (int i = 0; i <= 6; i++) {
      datelist.add(DateTime.now().add(Duration(days: i)));
    }
  }
  var currentDateSelectedIndex = 0;
  updateIndex({value}) {
    currentDateSelectedIndex = value;
    setState(() {});
  }
  DateTime selectedDate = DateTime.now();
  setDate({value}) {
    selectedDate = value;
    setState(() {});
  }

  List<TimeOfDay> generateTimeSlots() {
    List<TimeOfDay> timeSlots = [];
    for (int hour =10; hour <= 22; hour++) {
      timeSlots.add(TimeOfDay(hour: hour, minute: 0));
      timeSlots.add(TimeOfDay(hour: hour, minute: 30));
    }
    timeSlots = timeSlots.where((time) => !(time.hour == 22 && time.minute == 30)).toList();
    return timeSlots;
  }
  List<TimeOfDay> timeSolotslist = [];
  var activeTimeIndex;
  ChangeactiveTimeIndex({value}) {
    activeTimeIndex = value;
    setState(() {});
  }


  @override
  void initState() {
    LoopDates();
    timeSolotslist = generateTimeSlots();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          slivers: [
            MySliverAppBar1(context, title: widget.carWashService.name),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Icon(
                    widget.carWashService.icon,
                    color: widget.carWashService.color,
                    size: 100,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.carWashService.name,
                          style: TxtStyles.labelStyle),
                      Text("\$98", style: TxtStyles.labelStyle),
                    ],
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("Select Vehicle", style: TxtStyles.headerStyle),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 100,
              width: size.width,
              child: ListView.separated(
                separatorBuilder: (_, i) => const SizedBox(width: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemCount: AppList.servicesList.length - 6,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (_, i) {
                  return Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: greyClr.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.electric_bike,
                          size: 30,
                          color: AppList.servicesList[i].color,
                        ),
                        Text("Bike", style: TxtStyles.smallHintStyle),
                        Text("TS09AB01$i$i", style: TxtStyles.inputStyle)
                      ],
                    ),
                  );
                },
              ),
            )),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("Select Date", style: TxtStyles.headerStyle),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 90,
                child: ListView.separated(
                  separatorBuilder: (_,i)=>SizedBox(width: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: datelist.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final data = datelist[index];
                    return InkWell(
                      onTap: () {
                        updateIndex(value: index);
                        setDate(value: data);
                      },
                      child: Container(
                        width: 60,
                        decoration: BoxDecoration(
                          color: currentDateSelectedIndex == index
                              ? indClr
                              : bgColor,
                            borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: greyClr.withOpacity(0.25)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                DateFormat("MMM").format(data),
                                style: currentDateSelectedIndex == index
                                    ? TxtStyles.inputWhiteStyle
                                    : TxtStyles.inputStyle,
                              ),
                              Text(
                                DateFormat("dd").format(data),
                                style: currentDateSelectedIndex == index
                                    ? TxtStyles.inputWhiteStyle
                                    : TxtStyles.inputStyle,
                              ),
                              Text(
                                DateFormat("yyyy").format(data),
                                style: currentDateSelectedIndex == index
                                    ? TxtStyles.inputWhiteStyle
                                    : TxtStyles.inputStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("Select Timeslot", style: TxtStyles.headerStyle),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverToBoxAdapter(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size.width<650?4:size.width<1000?6:8,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2
                ),
                itemCount: timeSolotslist.length,
                itemBuilder: (_, i) {
                  final data = timeSolotslist[i];
                  final currentTime = DateTime.now();
                  final timeSlotDateTime = DateTime(
                    currentTime.year,
                    currentTime.month,
                    currentTime.day,
                    data.hour,
                    data.minute,
                  );
                  final hour = data.hourOfPeriod.toString().padLeft(2, '0');
                  final minute = data.minute.toString().padLeft(2, '0');
                  final period = data.period == DayPeriod.am ? 'AM' : 'PM';
                  final isBeforeCurrentTime =
                  currentTime.isAfter(timeSlotDateTime);
                  final text = "$hour:$minute $period";
                  return currentDateSelectedIndex == 0
                      ? InkWell(
                    onTap: isBeforeCurrentTime
                        ? null
                        : () {
                      ChangeactiveTimeIndex(
                          value: text);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: activeTimeIndex == text
                                  ? indClr
                                  : greyClr.withOpacity(0.25)),
                          color: isBeforeCurrentTime
                              ? greyClr.withOpacity(0.25)
                              : activeTimeIndex == text
                              ? indClr
                              : bgColor,
                        ),
                        alignment: Alignment.center,
                        child: Text(text,
                            style: activeTimeIndex != text ||
                                isBeforeCurrentTime
                                ? TxtStyles.inputStyle
                                : TxtStyles.inputWhiteStyle)),
                  )
                      : InkWell(
                    onTap: () {
                      ChangeactiveTimeIndex(value: text);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: activeTimeIndex == text
                                  ? bgColor
                                  : greyClr),
                          color: activeTimeIndex == text
                              ? indClr
                              : bgColor,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                           text,
                          style: activeTimeIndex == text
                              ? TxtStyles.inputWhiteStyle
                              : TxtStyles.inputStyle
                        )),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 70,
        child: MyButton(title: "Book Appointment", onTap: () {
          opeChe();
        }),
      ),
    );
  }

  final _razorpay = Razorpay();
  var options;
  var textLength = 0;
  var textLength1 = 0;
  bool isLoad = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  opeChe() {
    var options = {
      'key': 'rzp_test_2fNgmxneP6dNQE',
      'amount': num.parse("97")*100,
      'name': 'Yalagala Srinivas',
      'description': 'Pay Secure',
      'prefill': {'contact': "", 'email': ""},
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      log(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("sri..................");
    print(response.orderId);
    print("sri..................");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    setState(() {
    });
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    final snackBar = SnackBar(content: Text(response.walletName.toString()));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}


List engineCheck = [
  "Oil Change: Replace the engine oil and filter, which is crucial for maintaining proper lubrication and cooling of the engine.",
  "Oil Filter Replacement: Change the oil filter to ensure that contaminants are filtered out of the engine oil.",
  "Coolant Level Check: Check and top up the coolant to prevent the engine from overheating.",
  "Air Filter Inspection: Check and replace the air filter if necessary to ensure proper airflow to the engine.",
  "Fuel Filter Check: Inspect or replace the fuel filter to ensure clean fuel enters the engine."
];


//SliverToBoxAdapter(
//             child: ListView(
//               physics: const NeverScrollableScrollPhysics(),
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//               shrinkWrap: true,
//               children: [
//                 Text("1. Engine Checks", style: TxtStyles.labelStyle),
//                 const SizedBox(height: 10),
//                 ...engineCheck.map((e) => Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         const Text("• ", style: TextStyle(fontSize: 20)),
//                         // Bullet point symbol
//                         Expanded(
//                           child: Text(e,
//                               style: TxtStyles.inputStyle), // Bullet text
//                         ),
//                       ],
//                     )),
//                 const SizedBox(height: 10),
//                 Text("2. Fluid Checks", style: TxtStyles.labelStyle),
//                 const SizedBox(height: 10),
//                 ...engineCheck.map((e) => Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         const Text("• ", style: TextStyle(fontSize: 20)),
//                         // Bullet point symbol
//                         Expanded(
//                           child: Text(e,
//                               style: TxtStyles.inputStyle), // Bullet text
//                         ),
//                       ],
//                     )),
//                 const SizedBox(height: 10),
//                 Text("3. Brake System", style: TxtStyles.labelStyle),
//                 const SizedBox(height: 10),
//                 ...engineCheck.map((e) => Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         const Text("• ", style: TextStyle(fontSize: 20)),
//                         // Bullet point symbol
//                         Expanded(
//                           child: Text(e,
//                               style: TxtStyles.inputStyle), // Bullet text
//                         ),
//                       ],
//                     )),
//                 const SizedBox(height: 10),
//                 Text("4. Suspension and Steering", style: TxtStyles.labelStyle),
//                 const SizedBox(height: 10),
//                 ...engineCheck.map((e) => Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         const Text("• ", style: TextStyle(fontSize: 20)),
//                         // Bullet point symbol
//                         Expanded(
//                           child: Text(e,
//                               style: TxtStyles.inputStyle), // Bullet text
//                         ),
//                       ],
//                     )),
//                 const SizedBox(height: 10),
//                 Text("5. Tyres and Wheels", style: TxtStyles.labelStyle),
//                 const SizedBox(height: 10),
//                 ...engineCheck.map((e) => Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         const Text("• ", style: TextStyle(fontSize: 20)),
//                         // Bullet point symbol
//                         Expanded(
//                           child: Text(e,
//                               style: TxtStyles.inputStyle), // Bullet text
//                         ),
//                       ],
//                     )),
//               ],
//             ),
//           )