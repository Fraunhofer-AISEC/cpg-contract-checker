contract CarShop {

    address owner;
    uint256 toyotaCount;
    uint256 audiCount;
    uint256 bmwCount;

    constructor(uint256 _toyotaCount, uint256 _audiCount, uint256 _bmwCount) {

        owner = msg.sender;
        toyotaCount = _toyotaCount;
        audiCount = _audiCount;
        bmwCount = _bmwCount;

    }

    enum CarType {None, Toyota, Audi, Bmw}
    

    struct Cars {
        CarType carType;
        uint count;
    }

    Cars public item;

    Cars memory toyota = Cars(carType, toyotaCount)
    
}
