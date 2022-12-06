contract Example {
     event claimed(address owner);
     function claimStar() public {
          owner = msg.sender;
          emit claimed(msg.sender);
     }
}
