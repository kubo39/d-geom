module dgeom.point;

import dgeom.scalefactor;
import dgeom.size;


class Point(T)
{
  T x;
  T y;

  this(T _x, T _y)
  {
    x = _x;
    y = _y;
  }

  typeof(this) opBinary(string op)(Point!T other)
  {
    static if (op == "+") return new Point(x + other.x, y + other.y);
    else static if (op == "-") return new Point(x - other.x, y - other.y);
    else static assert(false);
  }

  typeof(this) opBinary(string op)(Size2D!T other)
  {
    static if (op == "+") return new Point(x + other.width, y + other.height);
    else static assert(false);
  }

  typeof(this) opBinary(string op)(ScaleFactor!T scale)
  {
    static if (op == "*") return new Point(x * scale, y * scale);
    else static if (op == "/") return new Point(x / scale, y / scale);
    else static assert(false);
  }
}