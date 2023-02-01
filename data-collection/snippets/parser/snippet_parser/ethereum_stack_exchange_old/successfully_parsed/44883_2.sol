contract X {
    uint x = 100;

    function doSomething() public {
        x++;    
    }
}

contract Y {
    function a(address _x) public {
        X x = X(_x);
        x.doSomething();
    }
}

contract Z {
    function a(X _x) public {
        X x = _x;
        x.doSomething();
    }
}
