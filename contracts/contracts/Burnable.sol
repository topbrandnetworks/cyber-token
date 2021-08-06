// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ERC20.sol";

/**
 * ERC20Burnable Token Implementation
 *
 * @author Mubashir Rasool Razvi <rizimore@outlook.com>
 */
contract Burnable is ERC20 {
    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply) ERC20(_name, _symbol, _decimals, _totalSupply) {}

    function burn(uint256 _value) public {
        _burn(msg.sender, _value);
    }

    function burnFrom(address _account, uint256 _value) public {
        uint256 currentAllowance = allowance(_account, msg.sender);
        require(currentAllowance >= _value, "ERC20: burn amount exceeds allowance");
        unchecked {
            _approve(_account, msg.sender, currentAllowance - _value);
        }
        _burn(_account, _value);
    }
}