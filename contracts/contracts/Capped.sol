// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ERC20.sol";

/**
 * ERC20Capped Token Implementation
 *
 * @author Mubashir Rasool Razvi <rizimore@outlook.com>
 */
contract Capped is ERC20 {
    uint256 immutable private __cap;

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply, uint256 _cap) ERC20(_name, _symbol, _decimals, _totalSupply) {
        require(_cap > 0, "ERC20Capped: cap is 0");
        __cap = _cap;
    }

    function cap() public view returns (uint256) {
        return __cap;
    }
}