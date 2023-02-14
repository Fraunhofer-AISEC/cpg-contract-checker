  function approveExternalTransaction(address externalAddress) {
    count++;
    if (count == 3) {
      releaseFunds(externalAddress);
    }
  }

  function sendCoin(address sendAddress, address receiver, uint amount) returns(bool sufficient) {
            MetaCoin m = MetaCoin(sendAddress);
          m.sendCoin(owner, fee);
      }

function releaseFunds (address releaseAddress) {
    sendCoin(releaseAddress, owner, fee);
  }
