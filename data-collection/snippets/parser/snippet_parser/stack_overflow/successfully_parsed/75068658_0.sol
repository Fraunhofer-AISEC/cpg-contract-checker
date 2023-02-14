

pragma solidity >=0.7.0 <0.9.0;

contract WeddingCertificate{
  string private spouse1;
  string private spouse2;

  constructor(string memory _spouse1, string memory _spouse2) {
      spouse1 = _spouse1;
      spouse2 = _spouse2;
  }

  function getSpouses() public view returns (string memory,string memory) {
  return (spouse1,spouse2);
  } 

}

contract WeddingCertificateFactory{


   event Wedding(string _spouse1, string _spouse2, address indexed contract_adress );

   function Unite(string memory _spouse1, string memory _spouse2)public returns (bool success) {
           WeddingCertificate wedding = new WeddingCertificate(_spouse1, _spouse2);
           emit Wedding(_spouse1,_spouse2 , address(wedding));
           return true ;

   }


}
