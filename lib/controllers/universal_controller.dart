import 'package:energy_services/models/engine_model.dart';
import 'package:energy_services/models/task_model.dart';
import 'package:get/get.dart';

class UniversalController extends GetxController {
  List<TaskModel> tasks = <TaskModel>[].obs;
  List<EngineModel> engines = <EngineModel>[].obs;
}
