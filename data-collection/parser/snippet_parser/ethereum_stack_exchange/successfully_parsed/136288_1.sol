
pragma solidity 0.8.16;

contract Contract {

    uint256[] public validators;

    constructor() {
        validators.push(1);
        validators.push(2);
        validators.push(3);
        validators.push(4);
        validators.push(5);
        validators.push(6);
    }

    function getValidators() public view returns(uint256[] memory) {
        return validators;
    }

    function etc() public {
        for (uint256 i = 0; i < validators.length - 1;) {

            
            
            
            
           

            
            
            uint256 j = i;
            validators[j] = validators[++i];
            validators.pop();

            
            
            
            
            
            

            
            
            
        }
    }

}
