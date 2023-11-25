
abstract class TaskState {}

class TaskInitial extends TaskState {}
class LoadingDate extends TaskState {}
class LoadedDate extends TaskState {}
class ErrorDate extends TaskState {}
class LoadingStartTime extends TaskState {}
class LoadedStartTime extends TaskState {}
class ErrorStartTime extends TaskState {}
class LoadingEndTime extends TaskState {}
class LoadedEndTime extends TaskState {}
class ErrorEndTime extends TaskState {}
class LoadingColor extends TaskState {}
class LoadedColor extends TaskState {}
class ErrorColor extends TaskState {}
