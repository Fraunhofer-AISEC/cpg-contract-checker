  modifier notCompleted() {
    require(
      exampleExternalContract.completed = false
    );
    _;
  }
