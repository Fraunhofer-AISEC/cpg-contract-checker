const [_owner, addr1, addr2] = await ethers.getSigners();
const Library = await ethers.getContractFactory("Library");
const library = await Library.deploy();
await library.deployed();
const Token = await ethers.getContractFactory("LIB");
const token = await Token.attach(library.token());
const preparedSignature = await onAttemptToApprove(token,library,_owner.address,"0.01");
