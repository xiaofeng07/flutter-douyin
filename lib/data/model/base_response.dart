class ResultData {
  var data;
  bool isSuccess;
  int code;
  String message;
  var headers;


  ResultData(this.data, this.isSuccess, this.code, this.message, {this.headers});

}


class ResultData1 {
 final dynamic data;
  bool isSuccess;
  int code;
  var headers;

  ResultData1(this.data, this.isSuccess, this.code, {this.headers});
}