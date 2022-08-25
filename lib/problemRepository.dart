import 'package:task_one/AssociatedDrug.dart';

abstract class ProblemsRepository {
  Future<List<AssociatedDrug>> getAllProblem();
}
