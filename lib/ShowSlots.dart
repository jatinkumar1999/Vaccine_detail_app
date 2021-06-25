import 'package:flutter/material.dart';

class ShowSlots extends StatefulWidget {
  final List showData;
  const ShowSlots({
    Key key,
    @required this.showData,
  }) : super(key: key);

  @override
  _ShowSlotsState createState() => _ShowSlotsState();
}

class _ShowSlotsState extends State<ShowSlots> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "Vaccination Detail",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: widget.showData.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Center ID: ${widget.showData[index]["center_id"].toString()}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Center Name  : ${widget.showData[index]["name"]}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      Text(
                          "Pincode: ${widget.showData[index]["pincode"].toString()}"),
                      const SizedBox(height: 5),
                      Text(
                          "Date  : ${widget.showData[index]["date"].toString()}"),
                      const SizedBox(height: 5),
                      Text("Address  : ${widget.showData[index]["address"]}"),
                      const SizedBox(height: 5),
                      Text(
                        "State Name : ${widget.showData[index]["state_name"]}",
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "District Name  : ${widget.showData[index]["district_name"]}",
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Age Limit  : ${widget.showData[index]["min_age_limit"].toString()}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      Text(
                          "Fees  : Rs. ${widget.showData[index]["fee"].toString()}"),
                      const SizedBox(height: 5),
                      Text(
                        "Vaccine  : ${widget.showData[index]["vaccine"].toString()}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Timming  : ${widget.showData[index]["from"].toString()}  to ${widget.showData[index]["to"].toString()}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
