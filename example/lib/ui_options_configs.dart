// Corsi Block Tapping configuration options.
import 'package:cognition_package/model.dart';
import 'package:flutter/material.dart';

final blockTappingUIOptions = RPCorsiBlockTappingUIOptions(
  blockWidget: CustomBlockWidget(),
  instructionsWidget: CustomInstructionsWidget(),
);

class CustomBlockWidget extends BlockWidget {
  @override
  Widget getWidgetFromStatus(BlockStatus status) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: status == BlockStatus.inactive
              ? Colors.grey
              : status == BlockStatus.highlighted
                  ? Colors.black
                  : Colors.green,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
    );
  }
}

class CustomInstructionsWidget extends InstructionsWidget {
  @override
  Widget getWidgetFromStatus(bool readyForTap, String text) {
    return Container(
      decoration: BoxDecoration(
          color: readyForTap ? Colors.blue : Colors.greenAccent,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      height: 80,
      width: 300,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
