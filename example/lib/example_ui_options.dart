// Corsi Block Tapping configuration options.
import 'package:cognition_package/model.dart';
import 'package:flutter/material.dart';

/// An example for a custom Block Tapping UI configuration.
final exampleBlockTappingUIOptions = RPCorsiBlockTappingUIOptions(
  blockWidget: CustomBlockWidget(),
  statusWidget: CustomBlockTappingStatusWidget(),
);

/// A custom implementation of a custom block in block tapping UI.
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

  @override
  Function fromJson(Map<String, dynamic> json) => () => CustomBlockWidget();
}

/// A custom implementation of the widget shown on top of the block tapping UI, showing the current status.
class CustomBlockTappingStatusWidget extends BlockTappingStatusWidget {
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

  @override
  Function fromJson(Map<String, dynamic> json) => () => CustomBlockTappingStatusWidget();
}

/// An example implementation of custom widget settings for a tile in trail making UI.
final exampleTrailMakingUIOptions = RPCorsiTrailMakingUIOptions(
    tileSettings: CorsiTrailMakingTileSettings(
  Colors.orange,
  TileShape.circle,
  false,
  const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  ),
));
