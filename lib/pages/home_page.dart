import 'package:flutter/material.dart';
import 'package:go_moon/widgets/custom_dropdown_button.dart';

class HomePage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          child: Stack(
            children: [
              _astroImageWidget(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _pageTitle(_deviceWidth),
                  _bookRideWidget(_deviceHeight, _deviceWidth),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _pageTitle(double deviceWidth) {
  return Container(
    
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.10),
    child: const Text(
      "#GoMoon",
      style: TextStyle(
        color: Colors.white,
        fontSize: 70,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}

Widget _astroImageWidget() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("assets/images/moon_go.jpg"),
      ),
    ),
  );
}

Widget _bookRideWidget(double deviceHeight, double deviceWidth) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.10),
    height: deviceHeight * 0.25,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _destinationDropdownWidget(deviceWidth),
        _travellersInformationDropdownWidget(deviceWidth),
        _rideButtonWidget(deviceWidth, deviceHeight),
      ],
    ),
  );
}

Widget _destinationDropdownWidget(double deviceWidth) {
  List<String> _items = ['James Webb Station', 'Preneure Station'];
  return CustomDropdownButton(values: _items, width: deviceWidth);
}

Widget _travellersInformationDropdownWidget(double deviceWidth) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CustomDropdownButton(
        values: const ['1', '2', '3', '4', '5'],
        width: deviceWidth * 0.35,
      ),
      CustomDropdownButton(
        values: const ['Economy', 'Business', 'Private'],
        width: deviceWidth * 0.35,
      ),
    ],
  );
}

Widget _rideButtonWidget(double deviceWidth, double deviceHeight) {
  return Container(
    width: deviceWidth,
    margin: EdgeInsets.only(bottom: deviceHeight * 0.01),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: MaterialButton(
      onPressed: () {},
      child: Text("Book Ride!", style: TextStyle(color: Colors.black)),
    ),
  );
}
