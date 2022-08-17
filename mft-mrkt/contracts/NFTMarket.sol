// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTMarket is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("Gaming NFTs", "GNFT"){}

    function createNFT(string calldata tokenURI) public returns(uint256) {
        _tokenIds.increment();
        uint256 currentID = _tokenIds.current();
        _safeMint(msg.sender, currentID);
        _setTokenURI(currentID, tokenURI);
        return currentID;
    }
 }  