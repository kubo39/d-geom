module dgeom.approxeq;

import std.math : abs, E;


template approx(T) if ( __traits(isFloating, T) )
{
    T approxEpsilon() @property @nogc @safe nothrow pure
    {
        return 1.0 * E - 6;
    }

    bool approx(T other) @property @nogc @safe pure
    {
        return approxEqEps(other, 1.0 * E - 6);
    }

    bool approxEqEps(T self, T other) @nogc @safe pure
    {
        return abs(self - other) < approxEpsilon;
    }
}


mixin approx!float;
mixin approx!double;
