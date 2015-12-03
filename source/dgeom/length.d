module dgeom.length;

import dgeom.scalefactor;
import std.conv;


class Length(T) if ( __traits(isArithmetic, T) )
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

  typeof(this) opBinary(string op)(Length!T other)
  {
    static if (op == "+") return new Length(get + other.get);
    else static if (op == "-") return new Length(get - other.get);
    else static if (op == "*") return new Length(get * other.get);
    else static assert(false);
  }

  typeof(this) opBinary(string op)(ScaleFactor!T scale)
  {
    static if (op == "+") return new Length(get + scale.get);
    else static if (op == "-") return new Length(get - scale.get);
    else static if (op == "*") return new Length(get * scale.get);
    else static assert(false);
  }

  float opCmp(typeof(this) other)
  {
    return get - other.get;
  }

  alias opCmp = Object.opCmp;

  bool opEquals(typeof(this) other)
  {
    return get == other.get;
  }

  override bool opEquals(Object other)
  {
    scope(failure) return false;
    return opEquals(other.to!(typeof(this)));
  }

  alias opEquals = Object.opEquals;
}


unittest
{
  import std.stdio;
  import std.exception;

  auto mm_per_inch = new ScaleFactor!float(25.4);

  auto one_foot = new Length!float(12.0);
  auto two_feet = one_foot + one_foot;
  auto zero_feet = one_foot - one_foot;

  assert(one_foot.get == 12.0);
  assert(two_feet.get == 24.0);
  assert(zero_feet.get == 0.0);

  assert(one_foot == one_foot);
  assert(two_feet != one_foot);

  assert(zero_feet < one_foot);
  assert(zero_feet <= one_foot);
  assert(two_feet > one_foot);
  assert(two_feet >= one_foot);

  assert(two_feet <= two_feet);
  assert(two_feet >= two_feet);
  assert(!(two_feet > two_feet));
  assert(!(two_feet < two_feet));

  auto one_foot_in_mm = one_foot * mm_per_inch;
  assert(one_foot_in_mm == new Length!float(304.8));
  assert(!(one_foot_in_mm == new ScaleFactor!float(304.8)));
}
