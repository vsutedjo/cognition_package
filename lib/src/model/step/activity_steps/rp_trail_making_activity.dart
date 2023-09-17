part of cognition_package_model;

/// Trail Making Test.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPTrailMakingActivity extends RPActivityStep {
  final RPCorsiTrailMakingUIOptions uiOptions;

  /// Contructor for creating a Trail Making Test.
  RPTrailMakingActivity(
      {required super.identifier,
      super.includeInstructions,
      super.includeResults,
      this.trailType = TrailType.A,
      this.uiOptions = const RPCorsiTrailMakingUIOptions()});

  /// The type of trail used in the test.
  TrailType trailType;

  @override
  Widget stepBody(
    dynamic Function(dynamic) onResultChange,
    RPActivityEventLogger eventLogger,
  ) =>
      RPUITrailMakingActivityBody(this, eventLogger, onResultChange, uiOptions);

  /// Results is number of mistakes made in the trailmaking task.
  /// Maximum score is 5 with -1 for each mistake made.
  @override
  int calculateScore(dynamic result) => 5 - (result['mistakeCount'] as int);

  @override
  Function get fromJsonFunction => _$RPTrailMakingActivityFromJson;
  factory RPTrailMakingActivity.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPTrailMakingActivity;
  @override
  Map<String, dynamic> toJson() => _$RPTrailMakingActivityToJson(this);
}

/// The type of trails used in a Trail Making test.
enum TrailType {
  /// Numbers only.
  A,

  /// Numbers and letters alternating.
  B,
}
