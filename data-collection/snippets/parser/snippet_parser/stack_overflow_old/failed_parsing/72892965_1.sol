modifier onlyContractB {
        require(
            msg.sender == _contractBAddress,
            "Only contractB can call this function."
        );
        _;
    }

function changeMap() onlyContractB {
   
}
