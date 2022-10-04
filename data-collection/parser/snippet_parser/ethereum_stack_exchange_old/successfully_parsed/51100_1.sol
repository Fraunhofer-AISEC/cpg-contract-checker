bool isEnabled;


function enableToken() onlyOwner public {
  isEnabled = true;
}

function disableToken() onlyOwner public {
  isEnabled = false;
}
