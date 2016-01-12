module dgeom.rectangle;

import dgeom.point;
import dgeom.size;


class Rectangle(T)
{
  Point2D!T origin;
  Size2D!T size;

  this(Point2D!T _origin, Size2D!T _size)
  {
    origin = _origin;
    size = _size;
  }

  Rectangle!T translate(Point2D!T other)
  {
    return new Rectangle!T(
      new Point2D!T(origin.x + other.x, origin.y + other.y),
      size);
  }

  bool contains(Point2D!T other)
  {
    return origin.x <= other.x && other.x < origin.x + size.width &&
      origin.y <= other.y && other.y < origin.y + size.height;
  }

  static init() @property
  {
    return new Rectangle!T(Point2D!T.init, Size2D!T.init);
  }
}


unittest
{
  auto r = Rectangle!uint.init;
  assert(r.size.width == uint.init);
  assert(r.size.height == uint.init);
  assert(r.origin.x == uint.init);
  assert(r.origin.y == uint.init);
}


unittest
{
  auto p = new Rectangle!uint(new Point2D!uint(0, 0),
                              new Size2D!uint(50, 40));
  auto pp = p.translate(new Point2D!uint(10, 15));

  assert(pp.size.width == 50);
  assert(pp.size.height == 40);
  assert(pp.origin.x == 10);
  assert(pp.origin.y == 15);
}


unittest
{
  auto r = new Rectangle!int(new Point2D!int(-20, 15), new Size2D!int(100, 200));
  assert(r.contains(new Point2D!int(0, 50)));
  assert(r.contains(new Point2D!int(-10, 200)));
}
