



interface IPublished {
    XXXXX
}

contract New {
    IPublished publishedContract;

    constructor(
        address _publishedContract
    ) {
        publishedContract = IPublished(_publishedContract);
    }

    function getFromMapping(
        address caller,
        uint256 tokenId
    ) external returns (IPublished.Test memory test) {

        return publishedContract.tests(caller, tokenId); 

    }
}
