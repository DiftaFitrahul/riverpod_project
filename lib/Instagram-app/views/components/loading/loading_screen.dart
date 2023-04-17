import 'dart:async';

import 'package:flutter/material.dart';

import '../constants/string.dart';
import './loading_screen_controller.dart';

class LoadingScreen {
  LoadingScreen._sharedInstance();
  static final LoadingScreen _instance = LoadingScreen._sharedInstance();
  factory LoadingScreen.instance() => _instance;

  LoadingScreenController? _controller;

  void show({
    required BuildContext context,
    String message = Strings.loading,
  }) {
    if (_controller?.updateLoadingScreen(message) != null) {
      return;
    } else {
      _controller = showOverlay(context: context, message: message);
    }
  }

  void hide() {
    _controller?.closeLoadingScreen();
    _controller = null;
  }

  LoadingScreenController? showOverlay({
    required BuildContext context,
    required String message,
  }) {
    final state = Overlay.of(context);
    if (state == null) {
      return null;
    }
    final textController = StreamController<String>();
    textController.add(message);

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final overlay = OverlayEntry(builder: (context) {
      return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
              child: Container(
            constraints: BoxConstraints(
              maxWidth: size.width * 0.8,
              maxHeight: size.height * 0.8,
              minWidth: size.width * 0.5,
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircularProgressIndicator(),
                    ),
                    StreamBuilder<String>(
                      stream: textController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.requireData,
                            style: const TextStyle(color: Colors.black),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          )));
    });
    state.insert(overlay);
    return LoadingScreenController(closeLoadingScreen: () {
      textController.close();
      overlay.remove();
      return true;
    }, updateLoadingScreen: (text) {
      textController.add(text);
      return true;
    });
  }
}
