pragma solidity ^0.4.19;

contract A {
    struct Rectangle {
      uint _x1;
      uint _y1;
      uint _x2;
      uint _y2;
    }   

    Rectangle[] _rectangles;

    function addRectangle(uint x1, uint y1, uint x2, uint y2) public {
      for (uint i = 0; i < _rectangles.length; i++) {
        Rectangle storage rectangle = _rectangles[i];

        
        require(x1 > rectangle._x2 || rectangle._x1 > x2);
        require(y1 > rectangle._y2 || rectangle._y1 > y2);
      }

      _rectangles.push(Rectangle(x1, y1, x2, y2));
    }
}
