part of cognition_package_model;

/// Flanker Test Result
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPFlankerResult extends RPActivityResult {
  RPFlankerResult({required String identifier}) : super(identifier: identifier);

  /// make result for Flanker Test
  /// wrong: number of wrong answers
  /// right: number of right answers
  /// time: time taken to finish the test
  /// score: score of the test calculated in model class
  RPActivityResult makeResult(int wrong, int right, int time, int score) {
    var res = RPActivityResult(identifier: identifier);
    res.results.addAll({'wrong swipes': wrong});
    res.results.addAll({'right swipes': right});
    res.results.addAll({'time': time});
    res.results.addAll({'score': score});
    return res;
  }

  factory RPFlankerResult.fromJson(Map<String, dynamic> json) =>
      _$RPFlankerResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RPFlankerResultToJson(this);
}
