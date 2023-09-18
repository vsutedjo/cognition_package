part of cognition_package_model;

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPCorsiBlockTappingUIOptions {
  // Create custom widgets.
  final BlockWidget blockWidget;
  final BlockTappingStatusWidget statusWidget;
  final AssetImage instructionsImage;
  const RPCorsiBlockTappingUIOptions(
      {this.blockWidget = const DefaultBlockWidget(),
      this.statusWidget = const DefaultBlockTappingStatusWidget(),
      this.instructionsImage = defaultInstructionsImage});

  Function get fromJson => _$RPCorsiBlockTappingUIOptionsFromJson;
  factory RPCorsiBlockTappingUIOptions.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPCorsiBlockTappingUIOptions;
}

enum BlockStatus { inactive, highlighted, checked }

/// A custom block widget should return a widget for each possible status.
///
/// The UI class calls the [getWidgetFromStatus] function to get the correct widget.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
abstract class BlockWidget {
  Widget getWidgetFromStatus(BlockStatus status);
  Function fromJson(Map<String, dynamic> json);
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

  @override
  Function fromJson(Map<String, dynamic> json) {
    return () => const DefaultBlockWidget();
  }

  factory DefaultBlockWidget.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as DefaultBlockWidget;
}

/// A custom widget that indicates whether the user should wait or tap.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
abstract class BlockTappingStatusWidget {
  Widget getWidgetFromStatus(bool readyForTap, String text);
  Function fromJson(Map<String, dynamic> json);
}

class DefaultBlockTappingStatusWidget implements BlockTappingStatusWidget {
  const DefaultBlockTappingStatusWidget();
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

  @override
  Function fromJson(Map<String, dynamic> json) => () => const DefaultBlockTappingStatusWidget();
}

const AssetImage defaultInstructionsImage = AssetImage('packages/cognition_package/assets/images/Corsiintro.png');
