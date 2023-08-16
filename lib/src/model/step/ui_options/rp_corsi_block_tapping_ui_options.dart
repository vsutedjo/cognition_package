part of cognition_package_model;

class RPCorsiBlockTappingUIOptions {
  // Create custom widgets.
  final BlockWidget blockWidget;
  final InstructionsWidget instructionsWidget;
  const RPCorsiBlockTappingUIOptions({
    this.blockWidget = const DefaultBlockWidget(),
    this.instructionsWidget = const DefaultInstructionsWidget(),
  });
}

enum BlockStatus { inactive, highlighted, checked }

/// A custom block widget should return a widget for each possible status.
///
/// The UI class calls the [getWidgetFromStatus] function to get the correct widget.
abstract class BlockWidget {
  Widget getWidgetFromStatus(BlockStatus status);
}

/// This is an example implementation of a [BlockWidget].
class DefaultBlockWidget implements BlockWidget {
  const DefaultBlockWidget();

  @override
  Widget getWidgetFromStatus(BlockStatus status) {
    return Container(
      height: 60,
      width: 60,
      color: status == BlockStatus.highlighted ? Colors.red : Colors.blue,
      child: Center(
        child: status == BlockStatus.checked ? const Icon(Icons.check) : null,
      ),
    );
  }
}

/// A custom widget that indicates whether the user should wait or tap.
abstract class InstructionsWidget {
  Widget getWidgetFromStatus(bool readyForTap, String text);
}

class DefaultInstructionsWidget implements InstructionsWidget {
  const DefaultInstructionsWidget();
  @override
  Widget getWidgetFromStatus(bool readyForTap, String text) {
    return Container(
      height: 70,
      width: 200,
      color: readyForTap ? Colors.green : Colors.redAccent,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
