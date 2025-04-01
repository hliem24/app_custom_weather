import 'package:flutter/material.dart';

@override
State<WeatherHome> createState() => _WeatherHomeState();

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 80),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    'Seongnam-si',
                    style: TextStyle(fontSize: 37, color: Colors.white),
                  ),
                  Text(
                    '21°',
                    style: TextStyle(fontSize: 102, color: Colors.white),
                  ),
                  Text(
                    'Partly Cloudy',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text(
                    'H:29°  L:15°',
                    style: TextStyle(fontSize: 21, color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              width: 400,
              height: 212,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey,
              ),
              child: Column(
                children: [
                  Text(
                    'Cloudy conditions from 1AM-9AM, with showers expected at 9AM.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  'Now',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 14),
                                Icon(Icons.cloud, color: Colors.white),
                                SizedBox(height: 14),
                                Text(
                                  '21°',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 500,
              height: 305,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '10-DAY FORECAST',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Today',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.sunny, color: Colors.amber),
                            Text(
                              '15°',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 4,
                              width: 150,
                              color: Colors.amber,
                            ),
                            Text(
                              '29°',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 15),
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.grey,
                  ),
                  width: 200,
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.thermostat, color: Colors.white, size: 18),
                          SizedBox(width: 5),
                          Text(
                            'CẢM NHẬN',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                      Text(
                        '14',
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                      SizedBox(height: 60),
                      Text(
                        'Gió đang khiến bạn thấy mát hơn',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 15, 15),
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.grey,
                  ),
                  width: 200,
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.wb_sunny, color: Colors.white, size: 18),
                          SizedBox(width: 5),
                          Text(
                            'CHỈ SỐ UV',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                      Text(
                        '0',
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                      Container(height: 4, width: 150, color: Colors.amber),
                      SizedBox(height: 85),
                      Text(
                        'Tránh nắng đến 4h',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 15),
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.grey,
                  ),
                  width: 200,
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.water_drop, color: Colors.white, size: 18),
                          SizedBox(width: 5),
                          Text(
                            ' LƯỢNG MƯA',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                      Text(
                        '0mm',
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                      Text(
                        'Hôm nay',
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'dự báo tiếp theo là 4 mm vào thứ 7',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 15, 15),
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.grey,
                  ),
                  width: 200,
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.visibility_sharp,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'TẦM NHÌN ',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                      Text(
                        '0KM',
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                      SizedBox(height: 60),
                      Text(
                        'Tầm nhìn hoàn toàn rõ',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.grey,
              ),
              width: 150,
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.visibility_sharp,
                        color: Colors.white,
                        size: 18,
                      ),
                      Text(
                        'TẦM NHÌN ',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                  Text(
                    '0KM',
                    style: TextStyle(fontSize: 23, color: Colors.white),
                  ),
                  Text(
                    'Tầm nhìn hoàn toàn rõ',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
