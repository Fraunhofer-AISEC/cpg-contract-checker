 struct DrugBox {
        uint256 weight; 
        uint256 creationDate;
        address producer;
        string drugName;
        uint256 id;
    }
  function getAllBoxes() public view returns (DrugBox[] memory box1)  {
        return boxes;
    }
