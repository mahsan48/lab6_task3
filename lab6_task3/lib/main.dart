import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> cardData = [
    {'title': 'Sales', 'value': '1,245', 'icon': Icons.bar_chart, 'details': 'Total sales this month'},
    {'title': 'Notifications', 'value': '7 New', 'icon': Icons.notifications, 'details': 'New notifications received'},
    {'title': 'Tasks', 'value': '85%', 'icon': Icons.task_alt, 'details': 'Tasks completed'},
    {'title': 'Messages', 'value': '12 Unread', 'icon': Icons.message, 'details': 'Unread messages'},
    {'title': 'New Users', 'value': '32', 'icon': Icons.person_add, 'details': 'New users registered'},
    {'title': 'Revenue', 'value': '\$23K', 'icon': Icons.attach_money, 'details': 'Revenue this month'},
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 200).floor();

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.2,
          ),
          itemCount: cardData.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(cardData[index]['title']),
                    content: Text(cardData[index]['details']),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        cardData[index]['icon'],
                        size: 40,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(height: 10),
                      Text(
                        cardData[index]['title'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        cardData[index]['value'],
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: DashboardPage()));
}
