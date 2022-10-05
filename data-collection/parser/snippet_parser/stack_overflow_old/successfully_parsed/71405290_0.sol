
pragma solidity >0.4.23 <0.9.0;

contract NebCrewFactory {

    
    NebCrew[] public NebCrewAddresses;

    function addNebCrew() public {

        
        NebCrew nebCrewAddress = new NebCrew();

        
        NebCrewAddresses.push(nebCrewAddress);
    }
}

contract NebCrew{

    address public crew;

    constructor() {
        crew = msg.sender;
    }

    function welcomeCrew() public pure returns (string memory _greeting) {
        return "Welcome to the truth...";
    }
}
