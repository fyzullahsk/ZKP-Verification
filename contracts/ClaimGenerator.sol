//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClaimGenerator {
    struct Claim {
        string claimType;
        string value;
        uint256 timestamp;
    }

    mapping(address => Claim[]) private claims;

    event ClaimAdded(address indexed user, string claimType, string value, uint256 timestamp);

    function addClaim(string memory claimType, string memory value) public {
        claims[msg.sender].push(Claim(claimType, value, block.timestamp));
        emit ClaimAdded(msg.sender, claimType, value, block.timestamp);
    }

    function getClaims(address user) public view returns (Claim[] memory) {
        return claims[user];
    }
}