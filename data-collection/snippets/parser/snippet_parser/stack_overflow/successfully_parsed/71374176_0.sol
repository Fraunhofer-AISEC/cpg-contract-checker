string amount = "10";
string nonce = "1";
string msg1 = "asdasd";
var privateKey = "0x00000privateKey";
var signer1 = new EthereumMessageSigner();

var abiEnconde = new ABIEncode(); 
var byteArray = abiEnconde.GetABIEncodedPacked(msg1,amount, nonce);
var messageHashed = "0x" + Convert.ToHexString(byteArray).ToLower();         
var signature1 = signer1.Sign(byteArray, new EthECKey(privateKey));
