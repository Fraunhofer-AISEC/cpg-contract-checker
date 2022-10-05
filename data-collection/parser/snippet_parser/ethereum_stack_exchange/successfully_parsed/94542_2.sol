function setPermission(address they, bytes topic, bool allowed) external {
  permissions[msg.sender][topic][they] = allowed;
}
