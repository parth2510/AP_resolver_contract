//SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

import "@openzeppelin/contracts/utils/introspection/IERC165.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";


/**
 * AP resolver contract
 */
contract AP_resolver {

    struct receipt_contract {
        address owner;
        address registry;
        address receipt_address;
        uint256 standard;
        string cid;
        string is_endpoint;
        string identifier;
        // artist
    }

    /**
    standard supported
    1 - ERC721
    2- ERC1155
    */

    mapping(address => receipt_contract) receipt;
    mapping(address => mapping(address => bool)) operators;
    mapping(string => address) asset_receipt;

    event receipt_registered(indexed address, uint, address, uint256);
    event asset_receipt_registered(indexed address, uint, address, uint256);
    event asset_expired(string, address, address);

    event Confirmation(address indexed sender, uint indexed transactionId);
    event Revocation(address indexed sender, uint indexed transactionId);

    
    // modifier validRequirement(uint ownerCount, uint _required) {
    //     if (   ownerCount > MAX_OWNER_COUNT
    //         || _required > ownerCount
    //         || _required == 0
    //         || ownerCount == 0)
    //         revert();
    //     _;
    // }

    constructor(address _owner)
        public
    {    
        owners = _owner;
        receipt_id = 0;
    
    }

    function register_receipt(
        address _owner;
        address _registry;
        address _receipt_address;
        uint256 _standard;
        string _cid;
        string _is_endpoint;
        string _identifier;
    )
    public
    //modifier 
    {
        
        receipt_contract rc;
        rc.owner = _owner;
        rc.registry = _registry;
        rc._receipt_address = _receipt_address;
        rc.standard = _standard;
        rc.cid = _cid;
        rc.is_endpoint = _is_endpoint;
        rc._identifier = _identifier;

        receipt_id ++;

        emit receipt_registered(_owner, receipt_id, _receipt_address, _standard);
        return receipt_id ;
    }

    function if_exist(string _cid) public 
    {
        if(asset_receipt[cid] != 0){
            revert;
        }
    }

    // function revoke_receipt(
    //     address _owner;
    //     address _registry;
    //     address _receipt_address;
    //     uint256 _standard;
    //     string _cid;
    //     string _is_endpoint;
    //     string _identifier;
    // )
    // public
    // //modifier 
    // {
    //     exist(_cid);
    // }




