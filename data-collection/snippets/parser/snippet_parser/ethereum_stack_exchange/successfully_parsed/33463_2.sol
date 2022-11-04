library Cars {
    struct Car {
        uint wheels;
        uint fuel;
        bool breaks;
    }

    function startEngine(Car car, uint fuel) pure internal returns (bool) {
        car.fuel = fuel;
        return true;
    }

    function enableBrakes(Car car, bool enable) pure internal returns (bool) {
        car.breaks = enable;
        return enable;
    }
}

contract House {
    using Cars for Cars.Car;
    Cars.Car public myCar;

    function startCar(uint fuel) public {
        myCar.startEngine(fuel);
        myCar.enableBrakes(false);
    }
}
