pragma solidity ^0.4.18; 

contract PromoContract {
      uint256 public promoCreatedCount;

      function createPromoPerson(address _owner, string _name, uint256 _price) public onlyCOO {
        require(promoCreatedCount < 5000);

        address personOwner = _owner;
        if (personOwner == address(0)) {
          personOwner = cooAddress;
        }

        if (_price <= 0) {
          _price = startingPrice;
        }

        promoCreatedCount++;
        _createPerson(_name, personOwner, _price);
      }
}
