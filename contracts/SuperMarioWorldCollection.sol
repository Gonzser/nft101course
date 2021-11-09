// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contract/token/ERC1155.sol";
import "@openzeppelin/contract/access/Ownable.sol";
import "@openzeppelin/contract/utils/Strings.sol";

contract SuperMarioWorldCollection is ERC1155, Ownable {
  string public name;
  string public symbol;
  uint256 public tokenCount;
  string public baseUri;

  constructor(
    string memory _name,
    string memory _symbol,
    string memory _baseUri,
  ) ERC1155(_baseUri) {
    name = _name;
    symbol = _symbol;
    baseUri = _baseUri;
  }
}
