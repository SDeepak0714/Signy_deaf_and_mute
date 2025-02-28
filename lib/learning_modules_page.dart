import 'package:flutter/material.dart';
import 'AlphabetsPage.dart'; // Import the Alphabets page
import 'WordModuleCard.dart';
import 'Fruits.dart';
import 'Shape.dart';
import 'Vegetable.dart'; // Import the Word module page

class LearningModulesPage extends StatefulWidget {
  @override
  _LearningModulesPageState createState() => _LearningModulesPageState();
}

class _LearningModulesPageState extends State<LearningModulesPage> {
  int _selectedIndex = 0;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Add navigation logic if needed for each bottom nav item
    });
  }

  @override
  Widget build(BuildContext context) {
    // List of module names and their Gujarati translations
    final List<Map<String, String>> modules = [
      {'name': 'Alphabets', 'gujarati': 'અક્ષરમાળા'},
      {'name': 'Words', 'gujarati': 'શબ્દો'},
      {'name': 'Numbers', 'gujarati': 'અંક'},
      {'name': 'Colors', 'gujarati': 'રંગો'},
      {'name': 'Shapes', 'gujarati': 'આકારો'},
      {'name': 'Animals', 'gujarati': 'પ્રાણીઓ'},
      {'name': 'Fruits', 'gujarati': 'ફળો'},
      {'name': 'Vegetables', 'gujarati': 'શાકભાજી'},
      {'name': 'Body Parts', 'gujarati': 'શરીરના ભાગો'},
      {'name': 'Family', 'gujarati': 'પરિવાર'},
      {'name': 'Daily Activities', 'gujarati': 'દૈનિક પ્રવૃત્તિઓ'},
      {'name': 'Emotions', 'gujarati': 'ભાવનાઓ'},
      {'name': 'Weather', 'gujarati': 'હવામાન'},
      {'name': 'Transportation', 'gujarati': 'વાહનવ્યવસ્થા'},
      {'name': 'Occupations', 'gujarati': 'વ્યાવસાય'},
      {'name': 'Food and Drinks', 'gujarati': 'ખોરાક અને પીણાં'},
      {'name': 'Household Items', 'gujarati': 'ઘરના સામાન'},
      {'name': 'Nature', 'gujarati': 'કુદરત'},
      {'name': 'Hobbies', 'gujarati': 'શોખ'},
      {'name': 'Festivals', 'gujarati': 'તહેવારો'},
    ];

    // Filtered list of modules based on the search query
    final filteredModules = modules.where((module) {
      final moduleName = module['name']!.toLowerCase();
      final gujaratiName = module['gujarati']!.toLowerCase();
      return moduleName.contains(_searchQuery.toLowerCase()) ||
          gujaratiName.contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Signyy',
          style: TextStyle(color: Colors.lightBlue), // Blue text for the title
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.lightBlue), // Blue back arrow
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous page
          },
        ),
        backgroundColor: Colors.white, // White background for the AppBar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar at the top
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search modules...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          // Section with blue background and white text
          Container(
            color: Colors.lightBlue, // Light blue background
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Learning Modules',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text for this section
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredModules.length, // Number of filtered modules
              itemBuilder: (context, index) {
                return ModuleCard(
                  moduleName: filteredModules[index]['name']!,
                  gujaratiTranslation: filteredModules[index]['gujarati']!,
                  onTap: () {
                    // Navigation logic for specific modules
                    if (filteredModules[index]['name'] == 'Alphabets') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AlphabetsPage()),
                      );
                    } else if (filteredModules[index]['name'] == 'Words') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DailyWordsPage()),
                      );
                    } else if (filteredModules[index]['name'] == 'Shapes') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShapeAppPage()),
                      );
                    } else if (filteredModules[index]['name'] == 'Fruits') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FruitsPage()),
                      );
                    } else if (filteredModules[index]['name'] == 'Vegetables') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VegetableList()),
                      );
                    }
                    // Add more conditions if you have other specific pages
                  },
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.lightBlue, // Light blue background for the page body
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ModuleCard extends StatelessWidget {
  final String moduleName;
  final String gujaratiTranslation;
  final VoidCallback onTap;

  ModuleCard({required this.moduleName, required this.gujaratiTranslation, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger action when card is tapped
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                moduleName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue, // Light blue text for module name
                ),
              ),
              SizedBox(height: 8),
              Text(
                gujaratiTranslation,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black, // Black text for Gujarati translation
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'AlphabetsPage.dart'; // Import the Alphabets page
// import 'WordModuleCard.dart';
// import 'Animals.dart';
// import 'Fruits.dart';
// import 'Shape.dart';
// import 'Vegetable.dart'; // Import the Word module page

// class LearningModulesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Signyy', 
//           style: TextStyle(color: const Color.fromRGBO(3, 169, 244, 1)), // Blue text for the title
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.lightBlue), // Blue back arrow
//           onPressed: () {
//             Navigator.pop(context); // Navigates back to the previous page
//           },
//         ),
//         backgroundColor: Colors.white, // White background for the AppBar
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Section with blue background and white text
//           Container(
//             color: Colors.lightBlue, // Light blue background
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Learning Modules',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white, // White text for this section
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: 20, // Number of modules
//               itemBuilder: (context, index) {
//                 // Define the list of module names and their Gujarati translations
//                 final modules = [
//                   {'name': 'Alphabets', 'gujarati': 'અક્ષરમાળા'},
//                   {'name': 'Words', 'gujarati': 'શબ્દો'},
//                   {'name': 'Numbers', 'gujarati': 'અંક'},
//                   {'name': 'Colors', 'gujarati': 'રંગો'},
//                   {'name': 'Shapes', 'gujarati': 'આકારો'},
//                   {'name': 'Animals', 'gujarati': 'પ્રાણીઓ'},
//                   {'name': 'Fruits', 'gujarati': 'ફળો'},
//                   {'name': 'Vegetables', 'gujarati': 'શાકભાજી'},
//                   {'name': 'Body Parts', 'gujarati': 'શરીરના ભાગો'},
//                   {'name': 'Family', 'gujarati': 'પરિવાર'},
//                   {'name': 'Daily Activities', 'gujarati': 'દૈનિક પ્રવૃત્તિઓ'},
//                   {'name': 'Emotions', 'gujarati': 'ભાવનાઓ'},
//                   {'name': 'Weather', 'gujarati': 'હવામાન'},
//                   {'name': 'Transportation', 'gujarati': 'વાહનવ્યવસ્થા'},
//                   {'name': 'Occupations', 'gujarati': 'વ્યાવસાય'},
//                   {'name': 'Food and Drinks', 'gujarati': 'ખોરાક અને પીણાં'},
//                   {'name': 'Household Items', 'gujarati': 'ઘરના સામાન'},
//                   {'name': 'Nature', 'gujarati': 'કુદરત'},
//                   {'name': 'Hobbies', 'gujarati': 'શોખ'},
//                   {'name': 'Festivals', 'gujarati': 'તહેવારો'},
//                 ];

//               return ModuleCard(
//                   moduleName: modules[index]['name']!,
//                   gujaratiTranslation: modules[index]['gujarati']!,
//                   onTap: () {
//                     // Navigation logic for specific modules
//                     if (modules[index]['name'] == 'Alphabets') {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AlphabetsPage()),
//                       );
//                     } else if (modules[index]['name'] == 'Words') {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => DailyWordsPage()),
//                       );
//                     }

                   
//                     else if (modules[index]['name'] == 'Shapes') {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => ShapeAppPage()),
//                       );
//                     }
//                     else if (modules[index]['name'] == 'Fruits') {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => FruitsPage()),
//                       );
//                     }

//                     else if (modules[index]['name'] == 'Vegetables') {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => VegetableList()),
//                       );
//                     }
//                     // Add more conditions if you have other specific pages
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: Colors.lightBlue, // Light blue background for the page body
//     );
//   }
// }

// class ModuleCard extends StatelessWidget {
//   final String moduleName;
//   final String gujaratiTranslation;
//   final VoidCallback onTap;

//   ModuleCard({required this.moduleName, required this.gujaratiTranslation, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap, // Trigger action when card is tapped
//       child: Card(
//         margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 moduleName,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.lightBlue, // Light blue text for module name
//                 ),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 gujaratiTranslation,
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.black, // Black text for Gujarati translation
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
