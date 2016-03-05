module dgeom.scalefactor;


class ScaleFactor(T) if ( __traits(isArithmetic, T) )
{
  T x;

  this(T _x)
  {
    x = _x;
  }

  T get()
  {
    return x;
  }

  typeof(this) inv()
  {
    return new ScaleFactor(1 / get);
  }

  typeof(this) opBinary(string op)(typeof(this) other)
  {
    final switch (op) {
    case "+": return new ScaleFactor(get + other.get);
    case "-": return new ScaleFactor(get - other.get);
    case "*": return new ScaleFactor(get * other.get);
    }
  }

  alias opEquals = Object.opEquals;
}


unittest
{
  import std.stdio;

  auto mm_per_inch = new ScaleFactor!float(25.4);
  auto cm_per_mm = new ScaleFactor!float(0.1);

  auto mm_per_cm = cm_per_mm.inv();
  assert(mm_per_cm.get() == 10.0);
}
