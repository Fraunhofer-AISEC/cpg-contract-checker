contract HackTokenA is ERC20("HACKA", "HACK"){
  constructor() {
    _mint(msg.sender, 1000)));
  }
}
