module dgeom.sideoffsets;


class SideOffsets2D(T) if ( __traits(isArithmetic, T) )
{
  T top;
  T right;
  T left;
  T bottom;

  this(T _top, T _right, T _left, T _bottom)
  {
    top = _top;
    right = _right;
    left = _left;
    bottom = _bottom;
  }

  T horizontal()
  {
    return left + right;
  }

  T vertical()
  {
    return top + bottom;
  }

  typeof(this) opBinary(string op)(SideOffsets2D!T other)
  {
    static if (op == "+") {
      return new SideOffsets2D(top + other.top,
                               right + other.right,
                               left + other.left,
                               bottom + other.bottom);
    }
    else static assert(false);
  }

  bool empty()
  {
    return top == 0 && right == 0 && left == 0 && bottom == 0;
  }
  
}


unittest
{
  auto zero = new SideOffsets2D!int(0, 0, 0, 0);
  auto one = new SideOffsets2D!int(1, 1, 1, 1);
  
  assert(zero.empty);
  assert(!one.empty);

  assert(one.horizontal == 2);
  assert(one.vertical == 2);
}
