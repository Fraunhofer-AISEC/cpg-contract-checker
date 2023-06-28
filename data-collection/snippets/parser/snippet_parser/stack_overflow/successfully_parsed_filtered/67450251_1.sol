pragma solidity ^0.5.0;
import "./Products.sol";

contract Orders {
    uint256 public ordersCount = 0;

    struct Order {
        uint256 id;
        int256 totalPrice;
        string date;
        Products[] products;
    }

    mapping(uint256 => Order) public orders;

    constructor() public {
        createOrder(
            150,
            "01.01.2021",
            [Products.createProduct("name", "category", 1)]
        );
    }

    function createOrder(
        int256 _totalPrice,
        string memory _date,
        Products[] memory _products
    ) public {
        ordersCount++;
        orders[ordersCount] = Order(ordersCount, _totalPrice, _date, _products);
    }
}
