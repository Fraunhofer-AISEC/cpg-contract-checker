contract d13 {
    bool public car;
    function setCar() public returns (bool) {
        car=true;
        return car;
    }

    function removeCar() public returns (bool) {
        car=false;
        return car;
    }
    function showMemory() pure returns (uint) {
        uint ms;
        assembly {
           ms := msize()
        }
        return ms;
    }
}


contract d12 is d13 {
    function isCar() public view returns (bool) {
        return car; 
    }

    function newCar() public {
        car=true;
    }

    function oldCar() public {
        car=false;
    }
    function showMemory() pure returns (uint) {
        uint ms;
        assembly {
           ms := msize()
        }
        return ms;
    }
}

contract d14 {
    function isCar() view returns (bool) {
        return (new d13()).car();
    }

    function setCar() returns (bool) {
        d13 d13instance = new d13();
        d13instance.setCar();
        return (d13instance.car());
    }
    function showMemory() pure returns (uint) {
        uint ms;
        assembly {
           ms := msize()
        }
        return ms;
    }

}
