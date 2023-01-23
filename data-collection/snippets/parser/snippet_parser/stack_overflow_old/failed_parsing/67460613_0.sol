contract MyContract {
    string private secretField
}

function getSecretField() public view returns {
  ... some controls here...
  return secretField;

}
