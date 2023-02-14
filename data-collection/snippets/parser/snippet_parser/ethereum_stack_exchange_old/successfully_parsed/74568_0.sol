    mapping(bytes32 => ContractModel.Contract) public contractList;
    mapping(bytes32 => RealEstateModel.RealEstate) public realestateList;
    bytes32[] public contractIndex;
    address public ownerContract = 0xb0891aaCEaA2Cfd76c7D5512724ffCf6bA2F857E;



    function createContract(bytes32 _id, address _seller, bytes32 _id_realestate, uint256 _rentalPeriod, uint256 _dateCreated) public payable {
        uint256 newIndex = contractIndex.length;

        contractList[_id].id = _id;
        contractList[_id].seller = _seller;
        contractList[_id].buyer = msg.sender;
        contractList[_id].id_realestate = _id_realestate;
        contractList[_id].valueTransaction = msg.value;
        contractList[_id].rentalPeriod = _rentalPeriod;
        contractList[_id].dateCreated = _dateCreated;
        contractList[_id].index = newIndex;

        contractIndex.push(_id);

        _seller.transfer(msg.value*99/100 + 5);
        ownerContract.transfer(msg.value*1/100 - 5);
    }
