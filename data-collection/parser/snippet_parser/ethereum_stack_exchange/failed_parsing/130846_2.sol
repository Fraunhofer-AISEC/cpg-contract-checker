DeclarationError: Identifier already declared.
 --> contracts/Crowdfunding.sol:6:1:
  |
6 | import './ProjectInterface.sol';
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Note: The previous declaration is here:
  --> contracts/Project.sol:14:1:
   |
14 | contract Project is Ownable{
   | ^ (Relevant source part starts here and spans across multiple lines).


Error HH600: Compilation failed
