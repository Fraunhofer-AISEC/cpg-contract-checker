contract C {
    struct Point {
        uint256 x;
        uint256 y;
    }

    struct Image {
        Point[] points;
        string name;
    }
    Image img;
    function C(){
        img.points[0]=Point({x:1,y:1});
        img.name= 'sebi';
    }

    function func() {

        delete img;
    }
}
