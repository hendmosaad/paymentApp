class Failure {
  String errMessage;
  Failure({required this.errMessage});
}
class ServerError extends Failure{
  ServerError({required super.errMessage});

}
