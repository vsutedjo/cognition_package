/// The domain model of Cognition Package.
library cognition_package_model;

import 'package:flutter/material.dart';
import 'package:research_package/research_package.dart';
import 'package:cognition_package/ui.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:carp_serializable/carp_serializable.dart';

part 'src/model/step/activity_steps/rp_corsi_block_tapping_activity.dart';
part 'src/model/step/activity_steps/rp_letter_tapping_activity.dart';
part 'src/model/step/activity_steps/rp_paired_associative_learning_activity.dart';
part 'src/model/step/activity_steps/rp_rapid_visual_info_processing_activity.dart';
part 'src/model/step/activity_steps/rp_reaction_time_activity.dart';
part 'src/model/step/activity_steps/rp_stroop_effect_activity.dart';
part 'src/model/step/activity_steps/rp_tapping_activity.dart';
part 'src/model/step/activity_steps/rp_trail_making_activity.dart';
part 'src/model/step/activity_steps/rp_flanker_activity.dart';
part 'src/model/step/activity_steps/rp_picture_sequence_memory_activity.dart';
part 'src/model/step/activity_steps/rp_word_recall_activity.dart';
part 'src/model/step/activity_steps/rp_delayed_recall_activity.dart';
part 'src/model/step/activity_steps/rp_visual_array_change_activity.dart';
part 'src/model/step/activity_steps/rp_continuous_visual_tracking_activity.dart';

part 'src/result/rp_visual_tracking_result.dart';
part 'src/result/rp_flanker_result.dart';
part 'src/result/rp_picture_sequence_memory_result.dart';
part 'src/result/rp_visual_array_change_result.dart';
part 'src/result/rp_word_recall_result.dart';
part 'src/result/rp_delayed_recall_result.dart';

// JSON
part 'model.g.dart';
part 'model.json.dart';

/// Start class for this researc package library. Just create a singleton instance:
///
///    ResearchPackage();
///
class CognitionPackage {
  static final _instance = CognitionPackage._();
  factory CognitionPackage() => _instance;
  CognitionPackage._() {
    ResearchPackage();
    _registerFromJsonFunctions();
  }
}
