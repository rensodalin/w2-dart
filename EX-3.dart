class CustomDuration {
  final int _millisecond ; 

  const CustomDuration ._( this._millisecond ) : assert(_millisecond >= 0  , "Duration cannot be negative" );

  factory CustomDuration.fromHours ( int hours){
    return CustomDuration._( hours * 60 * 60 * 1000);
  }

  factory CustomDuration.fromMinutes ( int minutes){
    return CustomDuration._( minutes * 60 * 1000);
  }

  factory CustomDuration.fromSeconds ( int seconds){
    return CustomDuration._( seconds * 1000);
  }

  int get inMilliseconds => _millisecond ;
  bool operator > (CustomDuration other){
    return _millisecond > other._millisecond ;
  }
  CustomDuration operator + (CustomDuration other){
    return CustomDuration._( _millisecond + other._millisecond );
  }
  CustomDuration operator -(CustomDuration other) {
    int result = _millisecond - other._millisecond;
    if (result < 0) result = 0; 
    return CustomDuration._(result);
  }
  @override
  String toString() {
    int hours = _millisecond ~/ (60 * 60 * 1000);
    int minutes = (_millisecond % (60 * 60 * 1000)) ~/ (60 * 1000);
    int seconds = (_millisecond % (60 * 1000)) ~/ 1000;
    int milliseconds = _millisecond % 1000;
    return '${hours}h ${minutes}m ${seconds}s ${milliseconds}ms';
  }


}

void main () {
  var d1 = CustomDuration.fromHours(2);
  var d2 = CustomDuration.fromMinutes(30);

  print(d1);
  print(d2);

  print(d1>d2);
  print(d1+d2);
  print(d1-d2);
}