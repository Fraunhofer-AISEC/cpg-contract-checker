function () payable {
      if (msg.value > 0) {
          if (!AddressA.send(msg.value)) throw; 
      }
}
