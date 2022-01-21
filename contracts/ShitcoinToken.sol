//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract ShitcoinToken {
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
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

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

    function balanceOf(address _account) public view returns (uint256) {
        return balances[_account];
    }

    function getTotalSupply() external view returns (uint256) {
        return totalSupply;
    }

    function allowance(address _owner, address _spender)
        public
        view
        returns (uint256)
    {
        return allowances[_owner][_spender];
    }

    // payable contract methods
    // allowance manipulation functions
    function approve(address _spender, uint256 _amount)
        external
        returns (bool)
    {
        _approve(msg.sender, _spender, _amount);
        return true;
    }

    function increaseAllowance(address _spender, uint256 _amount)
        external
        returns (bool)
    {
        uint256 _currentAllowance = allowance(msg.sender, _spender);
        _approve(msg.sender, _spender, _currentAllowance + _amount);
        return true;
    }

    function decreaseAllowance(address _spender, uint256 _amount)
        external
        returns (bool)
    {
        uint256 _currentAllowance = allowance(msg.sender, _spender);
        require(
            _currentAllowance >= _amount,
            "It's impossible to lower the value below zero"
        );
        _approve(msg.sender, _spender, _currentAllowance - _amount);
        return true;
    }

    // totalSupply changing functions
    function mint(address _to, uint256 _amount) external _onlyOwner {
        require(_to != address(0), "Transfer to the zero address");
        require(_amount > 0, "Zero tokens amount for mint");
        totalSupply += _amount;
        balances[_to] += _amount;
        emit Transfer(address(0), _to, _amount);
    }

    function burn(address _from, uint256 _amount) external _onlyOwner {
        require(_from != address(0), "Can't burn tokens from zero addrress");
        require(balanceOf(_from) >= _amount, "Burn amount exceeds balance");
        totalSupply -= _amount;
        balances[_from] -= _amount;
        emit Transfer(_from, address(0), _amount);
    }

    //functions

    function transfer(address _to, uint256 _amount) external returns (bool) {
        _transfer(msg.sender, _to, _amount);
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _amount
    ) external returns (bool) {
        uint256 _currentAllowance = allowance(_from, msg.sender);
        _transfer(_from, _to, _amount);
        require(_currentAllowance >= _amount, "Amount exceeds allowance");
        _approve(_from, msg.sender, _currentAllowance - _amount);
        return true;
    }

    // utility functions
    function _approve(
        address _from,
        address _to,
        uint256 _amount
    ) internal {
        require(_from != address(0), "Approve from the zero address");
        require(_to != address(0), "Approve to the zero address");
        allowances[_from][_to] = _amount;
        emit Approval(_from, _to, _amount);
    }

    function _transfer(
        address _from,
        address _to,
        uint256 _amount
    ) internal {
        require(_from != address(0), "Transfer from the zero address");
        require(_to != address(0), "Transfer to the zero address");
        require(balances[_from] >= _amount, "Transfer amount exceeds balance");
        balances[_from] -= _amount;
        balances[_to] += _amount;
        emit Transfer(_from, _to, _amount);
    }
}
