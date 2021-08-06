# Cyber Token
A tool to easily create ERC20 Token, ICO and manage it.

## Features
- Create ERC20 Token
- Build ICO
- Token Management

## ERC20 Token Features
- Core
    - ERC20
    - ERC20Metadata
- Extensions
    - Burnable
    - Capped
    - Pausable
- Extras Methods
    - increaseAllowance
    - decreaseAllowance

### ERC20 - Core

```
function totalSupply() public view returns (uint256);
function balanceOf(address _owner) public view returns (uint256 balance);
function transfer(address _to, uint256 _value) public returns (bool success);
function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function approve(address _spender, uint256 _value) public returns (bool success);
function allowance(address _owner, address _spender) public view returns (uint256 remaining);
event Transfer(address indexed _from, address indexed _to, uint256 _value);
event Approval(address indexed _owner, address indexed _spender, uint256 _value);
```

### Metadata
extended ERC20 including `name`, `symbol`, `decimals`, `totalSupply`

```
function name() external view returns (string memory);
function symbol() external view returns (string memory);
function decimals() external view returns (uint8);
function totalSupply() public view returns (uint256);
```

### Extra Methods

```
function increaseAllowance(address _spender, uint256 _value) public returns (bool) {};
function decreaseAllowance(address _spender, uint256 _value) public returns (bool) {};
```

#### Burnable
destruction of own tokens

```
function burn(uint256 amount) public virtual {};
function burnFrom(address account, uint256 amount) public virtual {};
```

#### Capped
enforcement of a cap to the total supply when mining tokens

```
function cap() public view virtual returns (uint256) {};
```

#### Pausable
ability to pause token transfers
