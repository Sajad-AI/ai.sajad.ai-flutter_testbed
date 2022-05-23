import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_firebase/modules/controller.dart';

class MyView extends StatelessWidget {
  MyView();

  MyController ctr = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Obx(
              () => FutureBuilder<Widget>(
                future: _buildWidget(context, ctr.jsonString.value),
                builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  return snapshot.hasData
                      ? RepaintBoundary(
                          key: ctr.globalKey,
                          child: SizedBox(
                            child: snapshot.data,
                          ),
                        )
                      : Text("Loading...");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<Widget>? _buildWidget(BuildContext context, String jsonString) async {
  return DynamicWidgetBuilder.build(jsonString, context, new DefaultClickListener())!;
}

class DefaultClickListener implements ClickListener {
  @override
  void onClicked(String? event) {
    print("Receive click event: " + (event == null ? "" : event));
  }
}
