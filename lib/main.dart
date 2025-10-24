import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // This removes the "DEBUG" banner from the top right
      debugShowCheckedModeBanner: false,
      title: 'Mappa Terminal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Define a clean, modern color scheme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // This is the starting position of the camera
  static const CameraPosition _sanFernandoCenter = CameraPosition(
    target: LatLng(15.0333, 120.6833), // Center of San Fernando, Pampanga
    zoom: 14.0, // Zoom level (14 is good for a city)
  );

  void _onAdminLoginPressed() {
    // This function will be called when the button is pressed.
    // For now, we'll just show a simple message.
    // In the future, this will navigate to a new login screen.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Admin Login button pressed!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title on the top left
        title: const Text('Mappa Terminal'),
        // 'actions' is a list of widgets to place on the top right
        actions: [
          // This is your new Admin Login button
          TextButton(
            onPressed: _onAdminLoginPressed,
            child: const Text(
              'Admin Login',
              style: TextStyle(color: Colors.black87), // Style the button text
            ),
          ),
          // We add a little space on the right edge
          const SizedBox(width: 8),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _sanFernandoCenter,
        // This removes the "Zoom" buttons on Android
        zoomControlsEnabled: false,
        // This shows the blue dot for the user's current location
        // You will also need to request location permissions for this to work
        myLocationEnabled: true,
        // This adds a button to center the map on the user's location
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          // You can save this controller to move the camera later
        },
      ),
    );
  }
}
