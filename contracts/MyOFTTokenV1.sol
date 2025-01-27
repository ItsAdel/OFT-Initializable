// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { OFTInitializable } from "./OFTInitializable.sol";

contract MyOFTTokenV1 is OFTInitializable {
    constructor() OFTInitializable() {}
}
