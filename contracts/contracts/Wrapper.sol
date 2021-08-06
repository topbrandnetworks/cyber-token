// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

/**
 * ERC20Wrapper Token Implementation
 *
 * @author Mubashir Rasool Razvi <rizimore@outlook.com>
 */

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Wrapper.sol";

contract Permit is ERC20Wrapper {
    constructor() ERC20Wrapper("CyberToken", "CT") {
    }
}
