import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_old_crm/providers/CartProvider.dart';
import 'package:flutter_old_crm/screens/AddProductScreen.dart';
import 'package:flutter_old_crm/screens/AddVendorScreen.dart';
import 'package:flutter_old_crm/screens/CartScreen.dart';
import 'package:flutter_old_crm/screens/HomeScreen.dart';
import 'package:flutter_old_crm/screens/OrderDetailScreen.dart';
import 'package:flutter_old_crm/screens/OrdersScreen.dart';
import 'package:flutter_old_crm/screens/ProductsScreen.dart';
import 'package:flutter_old_crm/screens/SettingsScreen.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_old_crm/widgets/ProductWidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => CartProvider(),
              ),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                // primaryColor: Color.fromRGBO(65, 165, 42, 1),
                colorScheme: const ColorScheme(
                  brightness: Brightness.dark,
                  primary: Color.fromRGBO(65, 165, 42, 1),
                  onPrimary: Color.fromRGBO(75, 175, 52, 1),
                  // secondary: Color.fromRGBO(65, 165, 42, 1),
                  secondary: Colors.lightBlue,
                  onSecondary: Colors.lightBlue,
                  error: Colors.red,
                  onError: Colors.red,
                  background: Color.fromRGBO(15, 15, 15, 1),
                  onBackground: Color.fromRGBO(35, 35, 35, 1),
                  surface: Color.fromRGBO(40, 40, 40, 1),
                  onSurface: Color.fromRGBO(70, 70, 70, 1),
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    // textStyle: const MaterialStatePropertyAll(
                    //   TextStyle(color: Colors.white),
                    // ),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                  ),
                ),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Color.fromRGBO(65, 165, 42, 1),
                  elevation: 3,
                  iconSize: 24,
                  foregroundColor: Colors.white,
                ),
              ),
              home: const NavigationPage(),
              routes: {
                // ProductDetailScreen.routeName: (ctx) =>
                //     const ProductDetailScreen(),
                AddProductScreen.routeName: (context) =>
                    const AddProductScreen(),
                AddVendorScreen.routeName: (context) => const AddVendorScreen(),
                OrderDetailScreen.routeName: (context) =>
                    const OrderDetailScreen(),
              },
            ),
          );
        });
  }
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    ProductsScreen(),
    OrdersScreen(),
    CartScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            label: 'Ordina',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_filled),
            label: 'Cronologia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carello',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Impostazioni',
          ),
        ],
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
