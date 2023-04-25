extension IntExtension on int{
   format(){
    String str;
    if (this > 10000) {
      double numWan = this / 10000.0;
      str = "${numWan.toStringAsFixed(1)}万";
    } else {
      str = toString();
    }
    return str;
  }
}