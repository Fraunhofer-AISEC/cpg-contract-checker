function update(
        mapping(int24 => Tick.Info) storage _self,
        int24 _tick,
        int128 _liquidityDelta,
        bool _upper
    ) internal returns(bool flipped){
    ...
    flipped = (liquidityAfter == 0) != (liquidityBefore == 0);  
    ...
}
