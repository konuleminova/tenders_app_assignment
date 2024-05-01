part of result;

abstract class Result<S, F extends Failure> {
  R fold<R>({
    required R Function(S? success) onSuccess,
    required R Function(F failure) onFailure,
  });
}
