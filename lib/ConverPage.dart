import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ConvertPage extends StatefulWidget {
  const ConvertPage({super.key});

  @override
  _ConvertPageState createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  CameraController? _cameraController;
  Future<void>? _initializeCameraFuture;
  List<CameraDescription>? cameras;
  int selectedCameraIndex = 0;
  Timer? timer;
  bool isProcessing = false;
  String detectedText = "Waiting for prediction...";
  final String apiUrl = 'http://192.168.1.6:5000/predict';

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    if (cameras == null || cameras!.isEmpty) {
      print("No cameras available.");
      return;
    }

    _cameraController?.dispose();

    _cameraController = CameraController(
      cameras![selectedCameraIndex],
      ResolutionPreset.high,
      enableAudio: false,
    );

    _initializeCameraFuture = _cameraController!.initialize();
    if (!mounted) return;
    setState(() {});

    timer = Timer.periodic(Duration(milliseconds: 500), (_) => captureAndPredict());
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    timer?.cancel();
    super.dispose();
  }

  Future<void> captureAndPredict() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized || isProcessing) return;

    try {
      isProcessing = true;
      final XFile imageFile = await _cameraController!.takePicture();
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var decoded = jsonDecode(responseData);
        if (decoded.containsKey('prediction') && decoded['prediction'].isNotEmpty) {
          setState(() {
            detectedText = decoded['prediction'];
          });
        }
      } else {
        print("Server Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in captureAndPredict: $e");
    } finally {
      isProcessing = false;
    }
  }

  void _switchCamera() async {
    if (cameras == null || cameras!.isEmpty) return;
    selectedCameraIndex = (selectedCameraIndex + 1) % cameras!.length;
    await _initializeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Signyy',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Camera Preview with 9:14 Aspect Ratio
            AspectRatio(
              aspectRatio: 9 / 13,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FutureBuilder(
                  future: _initializeCameraFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CameraPreview(_cameraController!);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: _switchCamera,
              icon: const Icon(Icons.switch_camera, color: Colors.blue),
              label: const Text("Switch Camera"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.black,
              child: Column(
                children: [
                  Text(
                    "Detected Sign:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white70),
                  ),
                  SizedBox(height: 10),
                  Text(
                    detectedText,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.greenAccent),
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
