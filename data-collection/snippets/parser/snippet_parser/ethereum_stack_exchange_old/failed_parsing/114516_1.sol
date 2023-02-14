if (_subtractedValue > oldValue) {
  allowed[msg.sender][_spender] = 0;
} else {
  allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
}

emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
return true;
