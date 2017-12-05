module dgeom.size;

import dgeom.length;


class Size2D(T) if ( __traits(isArithmetic, T) )
{
    T width;
    T height;

    this(T _width, T _height)
    {
        width = _width;
        height = _height;
    }

    U area(U)()
    {
        return new U(width * height);
    }

    typeof(this) opBinary(string op : "*")(ScaleFactor!T scale)
    {
        return new Size2D(width * scale, height * scale);
    }

    typeof(this) opBinary(string op : "/")(ScaleFactor!T scale)
    {
        return new Size2D(width / scale, height / scale);
    }

    static init() @property
    {
        return new Size2D!T(T.init, T.init);
    }
}


unittest
{
    auto size2D = Size2D!uint.init;
    assert(size2D.width == 0);
    assert(size2D.height == 0);
}
