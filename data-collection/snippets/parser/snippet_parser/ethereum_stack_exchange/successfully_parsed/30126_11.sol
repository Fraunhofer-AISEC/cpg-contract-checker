pragma solidity ^0.4.23;


library MathUtil {
  function ceilLog2(uint _x) pure internal returns(uint) {
    require(_x > 0);

    uint x = _x;
    uint y = (((x & (x - 1)) == 0) ? 0 : 1);
    uint j = 128;
    uint k = 0;

    k = (((x & 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000) == 0) ? 0 : j);
    y += k;
    x >>= k;
    j >>= 1;

    k = (((x & 0xFFFFFFFFFFFFFFFF0000000000000000) == 0) ? 0 : j);
    y += k;
    x >>= k;
    j >>= 1;

    k = (((x & 0xFFFFFFFF00000000) == 0) ? 0 : j);
    y += k;
    x >>= k;
    j >>= 1;

    k = (((x & 0x00000000FFFF0000) == 0) ? 0 : j);
    y += k;
    x >>= k;
    j >>= 1;

    k = (((x & 0x000000000000FF00) == 0) ? 0 : j);
    y += k;
    x >>= k;
    j >>= 1;

    k = (((x & 0x00000000000000F0) == 0) ? 0 : j);
    y += k;
    x >>= k;
    j >>= 1;

    k = (((x & 0x000000000000000C) == 0) ? 0 : j);
    y += k;
    x >>= k;
    j >>= 1;

    k = (((x & 0x0000000000000002) == 0) ? 0 : j);
    y += k;
    x >>= k;
    j >>= 1;

    return y;
  }
}
