// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage {
    // Basic types
    //bool hasFavoriteNumber = true;
    //uint256 favoriteNumber = 88;
    //string favoriteNumberInText = "eighty-eight";
    //int256 favoriteInt = -88;
    //address myAddress = 0x54c378FE83Ec1565Ef60f7CE094bC17cC8ECF528;
    //bytes32 favoriteBytes32 = "cat";
    
    //bytes1 minBytes = "I am a fixed size byte array of 1 byte";
    //bytes32 maxBytes = "I am a fixed size byte array of 32 bytes";
    //bytes dynamicBytes = "I am a dynamic array, so you can manipulate my size";

   // uint256 favoriteIntNumber;
    //Every variable in Solidity comes with a _default value_. 
    //Uninitialized uint256 for example, defaults to `0` (zero) 
    //and an uninitialized boolean defaults to `false`.

    uint256 public favoriteNumber; // a function will update this variable


    //Array and Struct
    //0, 1, 2
    //[77,78,79]
    // uint256[] listOfFavoriteNumber;
    struct Person{
    uint256 favoriteNumber;
    string name;    
    }

    // dynamic array
    Person[] public listOfPeople; // [] the blank array will return blank result. 

    // chelsea -> 232
    mapping(string => uint256) public nameToFavoriteNumber;

    // static array
    //Person[3] public listOfPeople;

    //Person public pat = Person({favoriteNumber: 7, name: "Pat"});
    //Person public tom = Person({favoriteNumber: 22, name:"Tom"});
    //Person public Mary = Person({favoriteNumber:77, name:"Mary"});

    // the function will be written here
    function store(uint _favoriteNumber) public {
        // the variable favorite number is updated with the value that is 
        //contained into the parameter `_favoriteNumber`
        favoriteNumber = _favoriteNumber;
        //favoriteNumber = favoriteNumber+1;
        //uint256 testVar = 5;
    }

    function retreive() public view returns (uint256){
        return favoriteNumber;
    }

    //function something() public {
    //    testVar = 6; // will raise a compilation error
    //    favoriteNumber = 7; // this can be accessed because it's in the main contract scope
    //}


    //Data Location
    //Calldata
    //Memory
    //Storage
    //Code
    //Logs

    //`calldata` and `memory` are temporary storage locations for variables during function execution.
    //`calldata` is read-only, used for function inputs that can't be modified.
    //`memory` allows for read-write access, letting variables be changed within the function.
    //To modify `calldata` variables, they must first be loaded into `memory`.

    //Most variable types default to `memory` automatically.
    //> However, for **strings**, you must specify either `memory` or `calldata` due to the way arrays are handled in memory.
    


    function addPerson(string memory _name, uint256 _favoriteNumber) public {
       listOfPeople.push(Person(_favoriteNumber, _name));
       nameToFavoriteNumber[_name] = _favoriteNumber;
       
       // Person memory newPerson = Person(_favoriteNumber, _name);
       // listOfPeople.push(newPerson);
    }  

    //function addPerson(string calldata _name, uint256 _favoriteNumber) public {
    //    _name = "cat"; -> calldata variables cannot be modified.
    //    listOfPeople.push(Person(_favoriteNumber, _name));
    //}

    //fuction addPerson(string memorty _name, uint256 memory _favoriteNumber) public {
    //    listOfPeople.push(Person(_favoriteNumber, _name));       
    
    // If you try to specify the `memory` keyword for an `uint256` variable, you'll encounter this error:
    //> Data location can only be specified for array, struct, or mapping type
    //uint256 favoriteNumber; // this is a storage variable

    //function addPerson(string storage memory _name, uint256 _favoriteNumber) public {
    //   listOfPeople.push(Person(_favoriteNumber, _name));
    // data stores into storage that is persistant data rather then temporary data.
}