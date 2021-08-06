// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

/**
 * ERC20FlashMint Token Implementation
 *
 * @author Mubashir Rasool Razvi <rizimore@outlook.com>
 */

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20FlashMint.sol";

contract FlashMint is ERC20FlashMint {
    constructor() ERC20FlashMint("CyberToken", "CT") {
    }
}
