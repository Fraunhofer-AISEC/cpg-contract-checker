pragma solidity >=0.7.0 <0.9.0;

contract StructParams {

    struct createParams {
        string title;
        string creator;
        uint editionLimit;
    }

    string title;
    string creator;
    uint editionLimit;

   
    function initialize(createParams memory params) public {
        title = params.title;
        creator = params.creator;
        editionLimit = params.editionLimit;
    }
    function getTitle() public view returns(string memory) {
        return title;
    }
}
