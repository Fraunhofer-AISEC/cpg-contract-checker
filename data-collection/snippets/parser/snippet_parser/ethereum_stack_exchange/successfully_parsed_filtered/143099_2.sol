    
    function calculateCoordinateY(
        int256 x,
        int256 minX,
        int256 maxX,
        int256 minY,
        int256 maxY
    ) internal pure returns (int256 _y) {
        
        _y = (((maxY - minY) / (maxX - minX)) * (x - maxX)) + maxY;
    }
