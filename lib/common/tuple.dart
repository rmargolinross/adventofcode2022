class Tuple<T> {
  Tuple(this.x, this.y);

  T x;
  T y;

  @override
  bool operator ==(Object other) {
    return other is Tuple<T> && other.x == x && other.y == y;
  }
  
  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() {
    return '($x, $y)';
  }
}