module dgeom.approxeq;

import std.math : abs, E;


template approx(T) if ( __traits(isFloating, T) )
{
  T approxEpsilon() @property
  {
    return 1.0 * E - 6;
  }

  bool approx(T other) @property
  {
    return approxEqEps(other, 1.0 * E - 6);
  }

  bool approxEqEps(T self, T other)
  {
    return abs(self - other) < approxEpsilon;
  }
}


mixin approx!float;
mixin approx!double;
