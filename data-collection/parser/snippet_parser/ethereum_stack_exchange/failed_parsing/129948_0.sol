
pragma solidity 0.8.13;

contract Carshop{
    constructor()
    {address[] carAssets;
    function createChildContract(string brand , string model) public payable{
        address newCarAsset = new CarAsset(brand, model, msg.sender);
        carAssets.push(newCarAsset);
    }
    function getDevelopedChildContracts() public view returns (address[]){
        return carAssets;
    }
    }

}
contract CarAsset{
    string public brand;
    string public model;
    string public owner;
    function CarAsset(string _brand, string _model, address _owner) public{
        brand = _brand;
        model = _model;
        owner = _owner;
    }
}
