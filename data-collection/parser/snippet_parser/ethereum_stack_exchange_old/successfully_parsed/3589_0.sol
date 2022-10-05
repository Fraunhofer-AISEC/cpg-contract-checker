contract Test {
    struct Point {
        int x;
        int y;
    }

    Point point;

    function getPoint() returns (int x, int y) {
        x = point.x;
        y = point.y;
    }
}
