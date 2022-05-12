// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract DecentralizedLibrary {
    string public LibraryName;

    constructor() {
        LibraryName = "Decentralized Library";
    }

    address[] public uploaders;

    string[] public uploadedFiles;

    mapping(address => string[]) public uploadedCids;

    mapping(address => bool) public isAnUploader;

    enum Status {
        unknown,
        success,
        failure,
        warning, 
        info
    }

    //events
    event statusMessage(string _msg, Status _status);

    function upload(string[] memory _cidString) external {
        uploadedCids[msg.sender] = _cidString;
        uploaders.push(msg.sender);
        isAnUploader[msg.sender] = true;

        for (uint256 index = 0; index < _cidString.length; index++) {
            uploadedFiles.push(_cidString[index]);
        }

        emit statusMessage("File has been successfully uploaded to library", Status.success);
    }

    function getUploadedFiles() public view returns(string[] memory){
        return uploadedFiles;
    }

    function uploaderFiles(address _addr) public view returns(string[] memory) {
        return uploadedCids[_addr];
    }

    function countOfLibraryFile() public view returns(uint){
        return uploadedFiles.length;
    }

    function totalUploaderCount() public view returns(uint){
        return uploaders.length;
    }


}
