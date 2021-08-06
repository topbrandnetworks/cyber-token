// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ERC20.sol";

/**
 * ERC20Pausable Token Implementation
 *
 * @author Mubashir Rasool Razvi <rizimore@outlook.com>
 */
contract Pausable is ERC20 {
    bool private __paused;

    event Paused(address _account);
    event Unpaused(address _account);

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply) ERC20(_name, _symbol, _decimals, _totalSupply) {
        __paused = false;
    }

    // Main Method

    function _beforeTokenTransfer(address _from, address _to, uint256 _value) internal virtual override {
        super._beforeTokenTransfer(_from, _to, _value);

        require(!paused(), "ERC20Pausable: token transfer while paused");
    }

    // Pausable Methods

    function paused() public view returns (bool) {
        return __paused;
    }

    function _pause() internal whenNotPaused {
        __paused = true;
        emit Paused(msg.sender);
    }

    function _unpause() internal whenPaused {
        __paused = false;
        emit Unpaused(msg.sender);
    }

    // Modifiers

    modifier whenNotPaused() {
        require(!paused(), "Pausable: paused");
        _;
    }

    modifier whenPaused() {
        require(paused(), "Pausable: not paused");
        _;
    }
}