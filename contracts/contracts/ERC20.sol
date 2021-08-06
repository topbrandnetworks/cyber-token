// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

/**
 * ERC20 Token Implementation
 *
 * @author Mubashir Rasool Razvi <rizimore@outlook.com>
 */
contract ERC20 {
    string private __name;
    string private __symbol;
    uint8 private __decimals;
    uint256 private __totalSupply;
    mapping(address => uint256) private __balances;
    mapping(address => mapping(address => uint256)) private __allowances;

    // Events
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply) {
        __name = _name;
        __symbol = _symbol;
        __decimals = _decimals;
        __totalSupply = _totalSupply;
        __balances[msg.sender] = _totalSupply;
    }

    // Metadata

    function name() public view returns (string memory) {
        return __name;
    }

    function symbol() public view returns (string memory) {
        return __symbol;
    }

    function decimals() public view returns (uint8) {
        return __decimals;
    }

    function totalSupply() public view returns (uint256) {
        return __totalSupply;
    }

    // Standards Methods of EIPS-20
    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return __balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        _transfer(_from, _to, _value);

        uint256 currentAllowance = __allowances[_from][msg.sender];
        require(currentAllowance >= _value, "ERC20: transfer amount exceeds allowance");
        unchecked {
            _approve(_from, msg.sender, currentAllowance - _value);
        }

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        _approve(msg.sender, _spender, _value);

        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return __allowances[_owner][_spender];
    }

    // Extra Methods

    function increaseAllowance(address _spender, uint256 _value) public returns (bool) {
        _approve(msg.sender, _spender, __allowances[msg.sender][_spender] + _value);

        return true;
    }

    function decreaseAllowance(address _spender, uint256 _value) public returns (bool) {
        uint256 currentAllowance = __allowances[msg.sender][_spender];
        require(currentAllowance >= _value, "ERC20: decreased allowance below zero");
        unchecked {
            _approve(msg.sender, _spender, currentAllowance - _value);
        }

        return true;
    }

    // Helper Methods

    function _transfer(address _from, address _to, uint256 _value) internal {
        require(_from != address(0), "ERC20: transfer from the zero address");
        require(_to != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(_from, _to, _value);

        uint256 senderBalance = __balances[_from];
        require(senderBalance >= _value, "ERC20: transfer amount exceeds balance");
        unchecked {
            __balances[_from] = senderBalance - _value;
        }
        __balances[_to] += _value;

        emit Transfer(_from, _to, _value);
    }

    function _approve(address _owner, address _spender, uint256 _value) internal {
        require(_owner != address(0), "ERC20: approve from the zero address");
        require(_spender != address(0), "ERC20: approve to the zero address");

        __allowances[_owner][_spender] = _value;
        emit Approval(_owner, _spender, _value);
    }

    function _burn(address _account, uint256 _value) internal virtual {
        require(_account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(_account, address(0), _value);

        uint256 accountBalance = __balances[_account];
        require(accountBalance >= _value, "ERC20: burn amount exceeds balance");
        unchecked {
            __balances[_account] = accountBalance - _value;
        }
        __totalSupply -= _value;

        emit Transfer(_account, address(0), _value);
    }

    function _mint(address _account, uint256 _value) internal virtual {
        require(_account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), _account, _value);

        __totalSupply += _value;
        __balances[_account] += _value;
        emit Transfer(address(0), _account, _value);
    }

    // Hook

    function _beforeTokenTransfer(address _from, address _to, uint256 _value) internal virtual {}
}
