import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:twitter_clone/camera/widgets/flash_options.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool _hasPermission = false;

  bool _isSelfieMode = false;

  late FlashMode _flashMode;

  late CameraController _cameraController;

  Future<void> initCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        // Handle no camera error
        return;
      }

      _cameraController = CameraController(
        cameras[_isSelfieMode ? 1 : 0],
        ResolutionPreset.ultraHigh,
      );

      await _cameraController.initialize();

      _flashMode = _cameraController.value.flashMode;
    } catch (e) {
      print('Camera Initialization Error: $e');
      // Handle the error
    }
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();
    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;
    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;
    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    initPermissions();
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  Future<void> _onTapCamera() async {
    if (!_cameraController.value.isInitialized) {
      return;
    }

    XFile file = await _cameraController.takePicture();
    String imagePath = file.path;

    Navigator.of(context).pop(imagePath);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: !_hasPermission || !_cameraController.value.isInitialized
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Initializing...",
                    style:
                        TextStyle(color: Colors.white, fontSize: Sizes.size20),
                  ),
                  Gaps.v20,
                  CircularProgressIndicator.adaptive()
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  CameraPreview(_cameraController),
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 20,
                    left: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: Sizes.size36,
                      ),
                      onPressed: () {
                        Navigator.pop(
                            context); // Navigates back to the previous screen
                      },
                    ),
                  ),
                  Positioned(
                    bottom: Sizes.size44 + Sizes.size2,
                    right: Sizes.size56,
                    child: Column(
                      children: [
                        IconButton(
                          color: Colors.white,
                          onPressed: _toggleSelfieMode,
                          icon: const Icon(
                            Icons.cameraswitch,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: Sizes.size44,
                    left: Sizes.size56,
                    child: Column(
                      children: [
                        FlashOptions(
                          currentFlashMode: _flashMode,
                          flashMode: FlashMode.off,
                          setFlashMode: _setFlashMode,
                          icon: Icons.flash_off_rounded,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: Sizes.size40,
                    child: GestureDetector(
                      onTap: _onTapCamera,
                      child: Container(
                        width: Sizes.size64 +
                            Sizes
                                .size4, // Considering 2 pixels for border, 2 pixels for gap, and 60 pixels for inner circle
                        height: Sizes.size64 + Sizes.size4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width:
                                2.0, // This determines the thickness of the border
                          ),
                          color: Colors.transparent, // Making it transparent
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              2.0), // This provides the transparent gap
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Center(
                                // You can put your tappable function or button here.
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

// Gaps.v10,
                        // FlashOptions(
                        //   currentFlashMode: _flashMode,
                        //   flashMode: FlashMode.off,
                        //   setFlashMode: _setFlashMode,
                        //   icon: Icons.flash_off_rounded,
                        // ),
                        // Gaps.v10,
                        // FlashOptions(
                        //   currentFlashMode: _flashMode,
                        //   flashMode: FlashMode.always,
                        //   setFlashMode: _setFlashMode,
                        //   icon: Icons.flash_on_rounded,
                        // ),
                        // Gaps.v10,
                        // FlashOptions(
                        //   currentFlashMode: _flashMode,
                        //   flashMode: FlashMode.auto,
                        //   setFlashMode: _setFlashMode,
                        //   icon: Icons.flash_auto_rounded,
                        // ),
                        // Gaps.v10,
                        // FlashOptions(
                        //   currentFlashMode: _flashMode,
                        //   flashMode: FlashMode.torch,
                        //   setFlashMode: _setFlashMode,
                        //   icon: Icons.flashlight_on_rounded,
                        // ),