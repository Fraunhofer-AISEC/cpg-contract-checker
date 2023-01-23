contract Root {
   ​Service private service;
   address immutable owner;
   ​constructor() {
      ​service = new Service(address(this));
      owner = msg.sender;
   ​}
   modifier onlyOwner {
      require(msg.sender==owner,"only Owner");
      _;
   }
   ​mapping(address=>bool) private serviceUsers;
   ​function authorize(address user) public onlyOwner {
    ​serviceUsers[user] = true;
   ​}
   function isAuthorized(address user) public view returns(bool) {
    ​ return serviceUsers[user];
   ​}
   ​function doService() public {
     ​service.performService();
   ​}
}​
​contract Service {
   ​address rootAddress
   ​constructor() {
     ​rootAddress = msg.sender;
   ​}
   ​modifier onlyAuthorized {
     ​root = Root(rootAddress)
     ​require(root.isAuthorized(tx.origin), "not authorized);
   ​}
   ​function performService() public onlyAuthorized() {
      ​
   ​}
}
