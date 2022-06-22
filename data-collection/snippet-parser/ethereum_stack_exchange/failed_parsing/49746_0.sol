  event NewUser(
    address userAddress,
    uint amount
  );
  function addUser() public payable{
    require(msg.value <= maxValue && msg.value > 0);
    require(allowedValues[msg.value]);
    require(accountAmount() < 5);

    if (users[msg.sender] > 0) {
        userPullout(); 
    }

    userAddresses.push(msg.sender);
    partAmounts.push(msg.value);
    users[msg.sender] = msg.value;

    emit NewUser(msg.sender, msg.value);
}
