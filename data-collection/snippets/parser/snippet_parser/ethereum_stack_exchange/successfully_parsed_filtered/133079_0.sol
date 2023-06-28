int256 constant REAL_BITS = 128;
int256 constant REAL_FBITS = 40;
int256 constant REAL_IBITS = REAL_BITS - REAL_FBITS;
int128 constant REAL_ONE = int128(1) << int128(REAL_FBITS);
int128 constant REAL_HALF = REAL_ONE >> int128(1);
int128 constant REAL_TWO = REAL_ONE << int128(1);
