part of cognition_package_model;

/// A class that stores different UI options for the Corsi trail making UI.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPCorsiTrailMakingUIOptions {
  // Create custom widgets.
  @JsonKey(includeFromJson: false, includeToJson: false)
  final CorsiTrailMakingTileSettings tileSettings;
  final AssetImage numbersInstructionImage, mixedInstructionImage;
  const RPCorsiTrailMakingUIOptions({
    this.tileSettings = const CorsiTrailMakingTileSettings.defaultSettings(),
    this.numbersInstructionImage = defaultNumbersInstructionImage,
    this.mixedInstructionImage = defaultMixedInstructionImage,
  });

  Function get fromJson => _$RPCorsiTrailMakingUIOptionsFromJson;
  factory RPCorsiTrailMakingUIOptions.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPCorsiTrailMakingUIOptions;
}

/// The shape a tile should have.
enum TileShape { rectangle, circle }

/// A settings class that stores different variations for a tile design.
class CorsiTrailMakingTileSettings {
  final Color color;
  final TileShape shape;
  final bool outlined;
  final TextStyle textStyle;

  CorsiTrailMakingTileSettings(this.color, this.shape, this.outlined, this.textStyle);

  /// The default settings for a tile.
  const CorsiTrailMakingTileSettings.defaultSettings()
      : color = Colors.white,
        shape = TileShape.rectangle,
        outlined = true,
        textStyle = const TextStyle(
          color: Colors.black,
          fontSize: 20,
        );
}

const AssetImage defaultNumbersInstructionImage =
    AssetImage("packages/cognition_package/assets/images/trailmaking_a.png");
const AssetImage defaultMixedInstructionImage =
    AssetImage("packages/cognition_package/assets/images/trailmaking_b.png");
