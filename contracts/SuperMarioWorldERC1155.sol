// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./ERC1155.sol";

contract SuperMarioWorldERC1155 is ERC1155 {

    string public name; // ERC1155Metadata

    string public symbol; // ERC1155Metadata

    uint256 public tokenCount;

    mapping(uint256 => string) private _tokenURIs;

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
    }

    // Returns a URL that points to the metadata
    function tokenURI(uint256 tokenId) public view returns (string memory) { // ERC1155Metadata
        
        return _tokenURIs[tokenId];
    }

    // Creates a new NFT inside our collection
    function mint(uint256 amount, string memory _tokenURI) public {
        require(msg.sender != address(0), "Mint to the zero address, not possible.");
        tokenCount += 1; // tokenId
        _balances[tokenCount][msg.sender] += amount;
        //_owners[tokenCount] = msg.sender;
        _tokenURIs[tokenCount] = _tokenURI;

        emit TransferSingle(msg.sender, address(0), msg.sender, tokenCount, amount);
    }

    function supportsInterface(bytes4 interfaceId) public pure override returns(bool) {
        return interfaceId == 0xd9b67a26 || interfaceId == 0x0e89341c;
    }
}
