// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract StudentToken is ERC20, Ownable {
    mapping(address => bool) public isCustomerWhiteListed;
    mapping(address => uint256) public customerTierLevel;
    
    constructor() ERC20("qb4jqpsq", "qb4jqpsq") {
        _mint(msg.sender, 178597862000000000000000000);
    }

    function getToken() external returns (bool) {
        require(isCustomerWhiteListed[msg.sender], "Not whitelisted");
        _mint(msg.sender, 100 * 10**18);
        return true;
    }

    function buyToken() external payable returns (bool) {
        require(isCustomerWhiteListed[msg.sender], "Not whitelisted");
        require(msg.value > 0, "Must send ETH");
        
        uint256 tokensToMint;
        if (customerTierLevel[msg.sender] == 1) {
            tokensToMint = msg.value * 1000;
        } else if (customerTierLevel[msg.sender] == 2) {
            tokensToMint = msg.value * 2000;
        } else {
            revert("Invalid tier level");
        }
        
        _mint(msg.sender, tokensToMint);
        return true;
    }

    function setCustomerStatus(address customer, bool whitelisted, uint256 tier) external onlyOwner {
        isCustomerWhiteListed[customer] = whitelisted;
        customerTierLevel[customer] = tier;
    }
} 