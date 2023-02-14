contract First {

struct Emission {
    string accountIdHash;
    string orderIdHash;
}

function getData(string memory _orderIdHash) public view returns (string memory,string memory)
{
    return (
        "Account1",
        "Order1"
    );
  }
}

interface IFirst {
   function getData(string memory) external view returns (
        string memory,
        string memory
    );
 }

contract Second {

address contractFirst;

struct Emission {
    string accountId;
    string orderId;
}

Emission emission;

constructor(address _addressContractFirst)
{
    contractFirst = _addressContractFirst;
}

function mint(string memory _orderIdHash) public {

 
  (string memory accountIdHash, string memory orderIdHash) = IFirst(contractFirst).getData(_orderIdHash);

   emission = Emission(accountIdHash, orderIdHash);
}
}
