module dgeom.approxeq;

import std.math : abs, E;


template approx(T)
{
  static  if ( __traits(isFloating, T) ) {
    T approx_epsilon() @property
    {
      return 1.0 * E - 6;
    }

    bool approx(T other) @property
    {
      return approx_eq_eps(other, 1.0 * E - 6);
    }

    bool approx_eq_eps(T self, T other)
    {
      return abs(self - other) < approx_epsilon;
    }
  }
  else static assert(false);
}


mixin approx!float;
mixin approx!double;
