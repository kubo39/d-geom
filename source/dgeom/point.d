module dgeom.point;

import dgeom.scalefactor;
import dgeom.size;


class Point2D(T) if ( __traits(isArithmetic, T) )
{
    T x;
    T y;

    this(T _x, T _y)
    {
        x = _x;
        y = _y;
    }

    typeof(this) opBinary(string op : "+")(Point2D!T other)
    {
        return new Point2D(x + other.x, y + other.y);
    }

    typeof(this) opBinary(string op : "-")(Point2D!T other)
    {
        return new Point2D(x - other.x, y - other.y);
    }

    typeof(this) opBinary(string op : "+")(Size2D!T other)
    {
        return new Point2D(x + other.width, y + other.height);
    }

    typeof(this) opBinary(string op : "*")(ScaleFactor!T scale)
    {
        return new Point2D(x * scale, y * scale);
    }

    typeof(this) opBinary(string op : "/")(ScaleFactor!T scale)
    {
        return new Point2D(x / scale, y / scale);
    }

    static init() @property
    {
        return new Point2D!T(T.init, T.init);
    }
}


unittest
{
    auto p = Point2D!uint.init;
    assert(p.x == 0);
    assert(p.y == 0);
}
