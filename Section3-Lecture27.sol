pragma solidity^0.5.2;
 
import "./SafeMath.sol";

contract Bank {
    
    using SafeMath for uint256;
    
    struct Account {
        address addr;
        uint256 amount;
    }
    
    mapping(address => uint256) balances;
    
    address public owner;
    
    Account[] internal accounts;
    
    modifier onlyOwner {
        require (msg.sender == owner, "You can only manage money in accounts you own.");
        _;
    }
    
    function addAdccount(address _addr, uint256 _amount) internal {
        accounts.push(Account(_addr, _amount));
    }
    
    function deposit(uint256 money) public payable {
        balances[msg.sender] = balances[msg.sender].add(money);
    }
    
    function withdraw(uint256 money) public payable onlyOwner {
        balances[msg.sender] = balances[msg.sender].sub(money);
    }
    
    function transfer(address _to, address _from, uint256 money) payable public onlyOwner {
        balances[_from] = balances[_from].sub(money);
        balances[_to] = balances[_to].add(money);
    }
    
}