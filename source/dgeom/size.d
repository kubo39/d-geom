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

  typeof(this) opBinary(string op)(ScaleFactor!T scale)
  {
    final switch (op) {
    case "*": return new Size2D(width * scale, height * scale);
    case "/": return new Size2D(width / scale, height / scale);
    }
  }
}
