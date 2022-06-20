    struct ReviewStruct {
        string rating;
        ...
    }

    struct Restaurant {
        ...
        uint reviewCount;
        mapping(uint => ReviewStruct) reviews;
    }

    uint public restaurantCount = 0;
    mapping(uint => Restaurant) public restaurants;
