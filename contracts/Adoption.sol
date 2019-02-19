pragma solidity ^0.5.0;

import  "./ERC721Full.sol";

//Base---ERC721---
//---contract---
//Achievement 取得したもの
//Target 実施した内容
//Star　場の評価
//HashData　別途記録したいデータのハッシュ
//TokenDetail　内訳を示す別トークンへのリンク
//Author　このトークンを認定した人や組織(ERC725ID管理と連携の計画)
//

//---Token---
//From　
//To　ERC721トークンで自動割当ERC721トークンで自動割当
//Role　場における役割(学生とか、教授とか、部長とか)
//Token_Star　個別の評価
//

contract RightConnect_ERC721 is ERC721Full  {
    string public Achievement;
    string public Target;
    uint[] public Star;
    string public HashData;
    address[] public TokenDetail;
    address private Author;

    mapping (uint256 => string) public Role;
    mapping (uint256 => string) public Token_Star;

    address[16] public adopters;

    function adopt(uint petId) public returns (uint) {
        require(petId >= 0 && petId <= 15);

        adopters[petId] = msg.sender;

        return petId;
    }

    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }



    function get_Role(uint256 tokenID) public view returns(string memory){
        string memory role  = Role[tokenID];
        return role;
    }

    function set_Role(uint256 tokenID , string memory role) public {
        if (is_authorized_user(msg.sender)) Role[tokenID]  = role;
    }


    function get_Token_Star(uint256 tokenID) public view returns(string memory){
        string memory tstar  = Token_Star[tokenID];
        return tstar;
    }

    function set_Token_Star(uint256 tokenID , string memory token_star) public {
        if (is_authorized_user(msg.sender)) Token_Star[tokenID]  = token_star;
    }


    function set_Achievement(string memory a)  public  {
        if (is_authorized_user(msg.sender)) Achievement = a;
    }
    
    function set_Target(string memory t)  public  {
        if (is_authorized_user(msg.sender)) Target = t;
    }

       function set_Star(uint s)  public  {
        if ( 1 <= s && s <= 5  ) Star.push(s);
    } 

       function set_HashData(string memory h)  public  {
        HashData = h;
    } 
    
       function set_TokenDetail(address token_address)  public  {
        TokenDetail.push(token_address);
    } 


       function get_Achievement()  public view returns (string memory) {
        return Achievement;
    } 

       function get_Target()  public  view returns (string memory) {
        return Target;
    } 


    function get_Star()  public view returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < Star.length; i++){
            sum += Star[i];
        }
        return sum/Star.length;
    }
    

       function get_HashData()  public view returns (string memory) {
        return HashData;
    } 

       function get_TokenDetail(uint256 number)  public view returns (address) {
        return TokenDetail[number];
    } 

       function get_Author()  public view returns (address) {
        return Author;
    } 
    
      function is_authorized_user(address) public view returns (bool){
          //ToDo:ERC725によって正当性が認められているユーザのみがtrueになる
          return true;
      }



    constructor() ERC721Full("UNIV", "UNIV2") public
    {
//        _mint(msg.sender, tokenId);
//        _setTokenURI(tokenId, tokenURI);
//        if (is_authorized_user(author)) Author = author;
     //   _mint(0xe3EeE18A530acc43D2F30946a5FF7E6eB9732f10, 1);
     //   _mint(0xd986d7E95663d5dE8CACda286431DB4313567c4c , 2);
     //   _mint(0xE35B827177398D8d2FBA304d9cF53bc8fC1573B7 , 3);
        _mint(0x5Fc7EB7c5c6e093Ec42ea859760dddb137542505 , 1);
        _mint(0xAbCf086b7c477d3c39d452F1A792f6C8Fd8038ED , 2);
    }
}
