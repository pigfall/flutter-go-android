// Copyright (c) 2021 Razeware LLC
//
// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use,
//     copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom
// the Software is furnished to do so, subject to the following
// conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// Notwithstanding the foregoing, you may not use, copy, modify,
//     merge, publish, distribute, sublicense, create a derivative work,
// and/or sell copies of the Software in any work that is designed,
// intended, or marketed for pedagogical or instructional purposes
// related to programming, coding, application development, or
// information technology. Permission for such use, copying,
//     modification, merger, publication, distribution, sublicensing,
//     creation of derivative works, or sale is expressly withheld.
//
// This project and source code may use libraries or frameworks
// that are released under various Open-Source licenses. Use of
// those libraries and frameworks are governed by their own
// individual licenses.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ffi_bridge.dart';
import 'dart:ffi';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key key}) : super(key:key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('tzzChannel');
  final FFIBridge _ffiBridge = FFIBridge();

  void _show(message) async {
    showDialog(
        builder: (ctx) => AlertDialog(content: Text(message.toString())),
        context: context);
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    print("call here");
    try {
      final int result = await platform.invokeMethod('getBatteryLevel',<String, dynamic>{"data":10});
      print('Battery level at $result % .');
    } on PlatformException catch (e) {
      print("Failed to get battery level: '${e.message}'.") ;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                child: const Text('Temperature'),
                onPressed:_getBatteryLevel,
                //onPressed: () async {
                //print("call method1");
                //try {
                //  print("here");
                //  final int result = await platform.invokeMethod('tzzFunc');
                //  print('Battery level at $result % .');
                //} on PlatformException catch (e) {
                //  print("Failed to get battery level: '${e.message}'.") ;
                //} finally{
                //  print("finally");
                //  _show(_ffiBridge.getTemperature());
                //}
                //}
            ),
            ElevatedButton(
                child: const Text('Today\'s forecast'),
                onPressed: () {
                  _show(_ffiBridge.getForecast());
                }),
            ElevatedButton(
                child: const Text('3-day forecast (Fahrenheit)'),
                onPressed: () {
                  _show(_ffiBridge.getThreeDayForecast(false));
                }),
            ElevatedButton(
                child: const Text('3-day forecast (Celsius)'),
                onPressed: () {
                  _show(_ffiBridge.getThreeDayForecast(true));
                }),
          ],
        ),
      ),
    );
  }
}
