abstract class APIResults {}

class APISucsess<T> extends APIResults {
  T sucsses;
  APISucsess({
    required this.sucsses,
  });
}

class APIFailure<T> extends APIResults {
  T error;
  APIFailure({
    required this.error,
  });
}
