import 'package:yin/services/db/poem_tune_entity.dart';
import 'package:yin/services/db/poem_tune_form_entity.dart';

class PoemTuneDetail {
  final PoemTuneEntity index;
  final List<PoemTuneFormEntity> forms;

  String get name => index?.name;

  String get description => index?.description;

  PoemTuneDetail(this.index, this.forms);
}
