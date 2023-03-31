
pragma solidity ^0.8.0;


contract buildTree{
    bytes32[] private leaves;
    bytes32 private root;

    constructor(bytes32[] memory _leaves){
        uint n = _leaves.length;

        require(n>0 , "we cannot build a tree");
        require(n%2 ==0 , "number of leaves must be even");

        leaves = _leaves;
        root = buildRoot(_leaves);

    }

    function buildRoot(bytes32[] memory _elements) private  pure returns (bytes32) {
        uint n = _elements.length;
        if(n==1){
            return _elements[0];
        }

        bytes32[] memory  parents=new bytes32[](n/2);

        for(uint i=0;i<n/2;i++){
            bytes32 left = _elements[i*2];
            bytes32 right = _elements[i*2 +1];
            bytes32 parent = sha256(abi.encodePacked(left,right));
            parents[i] = parent;
        }

        return buildRoot(parents);
    }   
    function getRoot() public view returns(bytes32){
        return root;
    }

}
