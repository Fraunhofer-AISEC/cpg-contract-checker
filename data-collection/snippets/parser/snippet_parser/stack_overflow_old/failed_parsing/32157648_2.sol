bytes memory b;

b = abi.encodePacked("hello");
b = abi.encodePacked(b, " world");

string memory s = string(b);

