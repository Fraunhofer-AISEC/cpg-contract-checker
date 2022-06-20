pragma solidity 0.5.0;

contract PartProduction {

    enum State {
        productionRequested,
        parametersObtained,
        manufacturerObtained,
        productionForwardedToManufacturer,
        printing,
        printed,
        postProcessing,
        postProcessed,
        qualityChecking,
        qualityChecked,
        productionFinished
    }

    enum Priority {
        low,
        normal,
        high
    }

    struct Company {
        address vehicleEthAddress;
        address myWebService;
    }

    struct Manufacturer {
        string id;
        string location;
        address productionMachine1;
        address productionMachine2;
        address productionMachine3;
    }

    struct Production {
        string productionParameters;
        string designParameters;
        State state;
        Priority priority;
        string partNumber;
        uint256 cost;
        uint256 productionForwardedTime;
        uint256 productionStartTime;
        uint256 productionEndTime;
        address partID;
        string myIdentifier;
        string location;
    }

    Company public company;
    Manufacturer public manufacturer;
    Production public production;

    constructor(

        address _vehicleEthAddress,
        string memory _myIdentifier,
        string memory _vehicleLocation,
        string memory _partNumber,
        Priority _priority)internal {

        company.myWebService = msg.sender;
        company.vehicleEthAddress = _vehicleEthAddress;
        production.partID = address(this);
        production.state = State.productionRequested;
        production.partNumber = _partNumber;
        production.priority = _priority;
        production.myIdentifier = _myIdentifier;
        production.location = _vehicleLocation;
    }

    function setParameters(string calldata _designParametersHash, string calldata _productionParametersHash) external {
        require(msg.sender == company.myWebService);
        require(production.state == State.productionRequested);
        production.designParameters = _designParametersHash;
        production.productionParameters = _productionParametersHash;
        production.state = State.parametersObtained;
    }

    function setManufacturer(string calldata _manufacturerId, string calldata _manufacturerLocation) external {
        require(msg.sender == company.myWebService);
        require(production.state == State.parametersObtained);
        manufacturer.id = _manufacturerId;
        manufacturer.location = _manufacturerLocation;
        production.state = State.manufacturerObtained;
    }

    function forwardProductionData(uint256 _productionForwardedTime) external {
        require(msg.sender == company.myWebService);
        require(production.state == State.manufacturerObtained);
        production.state = State.manufacturerObtained;
        production.productionForwardedTime = _productionForwardedTime;
    }

    function registerproductionMachine1(address _productionMachine1) external {
        require(msg.sender == company.myWebService);
        manufacturer.productionMachine1 = _productionMachine1;
    }

}
