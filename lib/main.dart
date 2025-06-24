import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Styled Tabs Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TabScreen(),
    );
  }
}

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int? selectedIndex;

  final List<String> tabNames = ["Tab 1", "Tab 2"];
  final List<String> tabSubtitles = ["Profile Info", "Settings Info"];
  final List<Widget> tabContents = [
    Container(
      color: Color(0xFFE3F2FD),
      alignment: Alignment.center,
      child: Text(
        "This is Tab 1 Content",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
    ),
    Container(
      color: Color(0xFFFFF3E0),
      alignment: Alignment.center,
      child: Text(
        "This is Tab 2 Content",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: Text("Dynamic Styled Tabs")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: List.generate(tabNames.length, (index) {
                final isSelected = selectedIndex == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // If same tab is clicked again → unselect it
                        if (selectedIndex == index) {
                          selectedIndex = null;
                        } else {
                          selectedIndex = index;
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? Colors.blue
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.3),
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ]
                            : [],
                      ),
                      child: Column(
                        children: [
                          Icon(
                            index == 0 ? Icons.person : Icons.settings,
                            color: isSelected ? Colors.white : Colors.black87,
                          ),
                          SizedBox(height: 4),
                          Text(
                            tabNames[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            tabSubtitles[index],
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected
                                  ? Colors.white70
                                  : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: selectedIndex != null
                ? tabContents[selectedIndex!]
                : Center(
                    child: Text(
                      "Please select a tab",
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
