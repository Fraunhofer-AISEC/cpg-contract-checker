function () public payable {
      require(msg.data.length == 0);
      DoSomething();
    }
