class ApiResponse<T> {
  int status;
  T data;
  String message;


  ApiResponse();

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}