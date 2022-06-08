// SPDX-License-Identifier:MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract NFTMatket is ReentrancyGuard {
    using Counters for Counters.Counter;
    Counters.Counter private _itemIds;
    Counters.Counter private _itemsSold;

    address payable owner;
    uint256 listingPrice = 0.025 ether;
    
}

    struct MarketItem {
    uint itemId;
    address nftContract;
    uint tokenId;
    address payable seller;
    address payable owner;
    uint256 price;
    bool sold;
    }

    mapping(unit256 => MarketItem) private idToMarketItem;

    event MarketItemCreated (
        uint indexed itemId,
        address indexed nftContract,
        uint256 indexed tokenId,
        address seller,
        address owner,
        uint256 price,
        bool sol
    );
    
    function getListingPrice() public view returns (uint256) {
        return listingPrice;
    }

    function createMarketItem(
        address nftContract,
        uint256 tokenId,
        uint256 price
    )   public payable nonReentrant {
        require(price > 0, "price must be a least 1 wei");
        require(msg.value == listingPrice, "price must be equal to listing price");

        itemIds.increment();
        uint256 itemId = _itemIds.current();
        
        idToMarketItem = MarketItem(
            itemId,
            nftContract,
            tokenId,
            payable(msg.sender),
            payable(ddress(0)),
            price,
            false
        )
    }
}


