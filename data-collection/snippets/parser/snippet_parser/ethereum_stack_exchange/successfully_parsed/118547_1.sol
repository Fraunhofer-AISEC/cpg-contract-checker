contract FixedPoint {
    int128 immutable someFixedPointInteger;

    constructor() {
        someFixedPointInteger = ABDKMath64x64.fromUInt(123);
    }
}
