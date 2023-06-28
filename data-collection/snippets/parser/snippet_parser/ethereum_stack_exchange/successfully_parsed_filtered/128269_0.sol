pragma solidity ^0.8.13;

contract AssetTracker{

    struct State{
        string description;
        address currentOwner;
    }

    struct Product{
        address manufacturer;
        string productName;
        string productId;
        uint256 date;
        uint256 totalStates;
        mapping (uint256 => State) states;
    }

    mapping (string => Product) allProducts;


    function newItem(string memory _productId, string memory _name, uint _date) public returns (bool){

        Product storage createdItem = allProducts[_productId];
        createdItem.manufacturer = msg.sender;
        createdItem.productName = _name;
        createdItem.productId = _productId;
        createdItem.date = _date;
        createdItem.totalStates = 0;

        return true;

    }


    function addState(string memory _productId, string memory info) public returns (string memory){

        State memory newState = State({currentOwner: msg.sender, description: info});
        uint256 currentState = allProducts[_productId].totalStates;
        allProducts[_productId].states[currentState] = newState;
        currentState = currentState + 1;
        allProducts[_productId].totalStates = currentState;

        return info;

    }

    function searchProduct(string memory _productId) public view returns (address manufacturer, string memory productName, 
    string memory productId, uint256 date, uint256 totalStates, State[] memory descriptionsArray){
        
        Product storage searchedProduct = allProducts[_productId];
        State[] memory statesArray;

        for (uint256 i=0; i<searchedProduct.totalStates; i++){
            statesArray[i] = searchedProduct.states[i];
        }

        return (searchedProduct.manufacturer, searchedProduct.productName, 
        searchedProduct.productId, searchedProduct.date, searchedProduct.totalStates, statesArray);

    }

}
