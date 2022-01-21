//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract VRN {
    // initial state
    address private contractOwner;
    uint256 private totalSupply;
    uint256 private decimals;
    string private name;
    string private symbol;

    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowances;

    // emits
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // contract constructor
    constructor() {
        contractOwner = msg.sender;
        name = "Shitcoin Token";
        symbol = "SHT";
        decimals = 18;
    }

    //modifiers

    modifier _onlyOwner() {
        require(msg.sender == contractOwner, "You are not the owner");
        _;
    }

    // view contract methods

    function getName() external view returns (string memory) {
        return name;
    }

    function getSymbol() external view returns (string memory) {
        return symbol;
    }

    function getDecimals() external view returns (uint256) {
        return decimals;
    }

    function balanceOf(address memory account) view public returns (uint256) {
        return balances[account];
    }

    function totalSupply() external view returns (uint256) {
        return totalSupply;
    }

    function allowance(
        address memory owner,
        address memory spender
    ) public view returns (uint256) {
        return allowances[owner][spender];
    }

    // payable contract methods
    // allowance manipulation functions
    function approve(
        address memory recipient,
        uint256 memory value
    ) public returns (bool) {
        require(recipient != address(0), "Approve to the zero address");
        address memory owner = msg.sender;
        allowances[owner][recipient] = amount;
        emit Approval(owner, recipient, amount);
        return true;
    }


    function increaseAllowance(
        address calldata spender,
        uint256 calldata amount
    ) external returns (bool) {
        uint256 memory currentAllowance = allowance(msg.sender, spender);
        approve(
            msg.sender,
            spender,
            currentAllowance + amount
        );
        return true;
    }

    function decreaseAllowance(
        address calldata spender,
        uint256 calldata amount
    ) external returns (bool)    {
        uint256 memory currentAllowance = allowance(msg.sender, spender);
        require(currentAllowance >= amount, "It's impossible to lower the value below zero");
        approve(
            msg.sender,
            spender,
            currentAllowance - amount
        );
        return true;
    }

    // totalSupply changing functions
    function mint(
        address calldata to,
        uint256 calldata amount
    ) external _onlyOwner {
        require(to != address(0), "Transfer to the zero address");
        require(amount > 0, "Zero tokens amount for mint");
        balances[to] += amount;
        totalSupply += amount;
        emit Transfer(address(0), to, amount);
    }

    function burn(
        address calldata from,
        uint256 calldata amount
    ) external _onlyOwner {
        require(from != address(0), "Transfer to the zero address");
        require(balanceOf(from) >= amount, "Burn amount exceeds balance");
        balances[from] -= amount;
        totalSupply -= amount;
        emit Transfer(from, address(0), amount);
    }

//    //functions
//
//    function transfer(address to, uint256 value) public override returns (bool) {
//        _transfer(msg.sender, to, value);
//        return true;
//    }
//
//    function transferFrom(
//        address from,
//        address to,
//        uint256 value
//    ) public override returns (bool) {
//        _transfer(from, to, value);
//        require(_allowances[from][msg.sender] >= value, "Amount exceeds allowance");
//        _approve(from, msg.sender, _allowances[from][msg.sender] - value);
//        return true;
//    }
//
//
//
//
//
//    //special function
//
//    function _transfer(
//        address sender,
//        address recipient,
//        uint256 amount
//    ) internal {
//        require(sender != address(0), "Transfer from the zero address");
//        require(recipient != address(0), "Transfer to the zero address");
//
//        require(_balances[sender] >= amount, "Transfer amount exceeds balance");
//        _balances[sender] -= amount;
//        _balances[recipient] += amount;
//
//        emit Transfer(sender, recipient, amount);
//    }

}
