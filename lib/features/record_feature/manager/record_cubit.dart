import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  RecordCubit() : super(RecordInitial());
  int height = 0;
  int weight = 0;
  int age = 0;

}
