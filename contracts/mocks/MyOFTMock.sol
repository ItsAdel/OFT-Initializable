// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import { MyOFTTokenV1 } from "../MyOFTTokenV1.sol";

// @dev WARNING: This is for testing purposes only
contract MyOFTTokenV1Mock is MyOFTTokenV1 {
    constructor(
        
    ) MyOFTTokenV1() {}

    function mint(address _to, uint256 _amount) public {
        _mint(_to, _amount);
    }

    function mock_initialize(string memory name_, string memory symbol_, uint256 initialSupply_, uint8 decimals_, address _lzEndpoint, address delegate_) public {
        (this).initialize(name_, symbol_, initialSupply_, decimals_, _lzEndpoint, delegate_);
    }
}
