contract GeometryShapesData {
    struct Point {
        uint x;
        uint y;
    }
}

contract A is GeometryShapesData {
    mapping (bytes32 => Point) public points;
    function addPoint(bytes32 idx, uint x, uint y) public { 
        points[idx] = Point(x, y);
    }
    function getPoint(bytes32 idx) constant public returns (uint x, uint y) {
        return (points[idx].x, points[idx].y);
    }
}

contract B is GeometryShapesData {
    Point[4] public vertexes;
    function addVertex(uint pos, uint x, uint y) public { 
        vertexes[pos] = Point(x, y);
    }
    function getVertex(uint pos) constant public returns (uint x, uint y) {
        return (vertexes[pos].x, vertexes[pos].y);
    }
}
