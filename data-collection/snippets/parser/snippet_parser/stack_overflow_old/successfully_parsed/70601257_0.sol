
contract RateContract {
    struct Rate {
        bool isValue;
        bytes32[] remark;
        uint32[] rates;
    }
   
  mapping (bytes32 => Rate) public ratesReceived;
 
  bytes32[] public candidateList;

  constructor(bytes32[] memory candidateNames) public {
    candidateList = candidateNames;
  }

  function totalRatesFor(bytes32 candidate) view public returns (uint32, uint32, bytes32[] memory) {
    bytes32[] memory remark = ratesReceived[candidate].remark;
    if (ratesReceived[candidate].isValue != true)
    {
        return (0, 0, remark);
    }

    uint32 count = 0;
    uint32 sum = 0;
    for (uint j = 0; j < ratesReceived[candidate].rates.length; j++) {
        count += 1;
        sum += ratesReceived[candidate].rates[j];
    }
    return (sum/count, count, remark);
  }

  function rateCandidate(bytes32 candidate, uint32 score, bytes32 comment) public {
    ratesReceived[candidate].isValue = true;
    ratesReceived[candidate].rates.push(score);
    ratesReceived[candidate].remark.push(comment);
  }
}

