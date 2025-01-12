// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Web3Voting {

//*******************struct Candidate === candidates information***************
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    string public name1;
    string public name2;
 //************candidates = All the candidates being voted for*****************   
    mapping(uint=>Candidate) public candidates;

//********************How many candidates are running***************************
    uint public candidateCount;

//****************************Who has already voted*****************************  
    mapping(address=>bool) public voters;

//****throw an event so external contracts or UIs can subscribe to that event****
//***********************indexed so we can search********************************
//**************can trigger other contracts if subscribed to*********************
    event VoteEvent(uint indexed _candidateId);

//*****************hard coding candidtaes till we create add later***************
    constructor (){
       name1 = "Kathy Hochul";
       name2 = "Bruce Blakeman";
        addCandidate(name1);
        addCandidate(name2);

    }
    function addCandidate(string memory _name) private {
//*******private that noone externally should be able to call this function*******
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount,_name,0);
    }


    function vote(uint _candidateId) public {

//**************************check if they voted already****************************        
        require(!voters[msg.sender],"You have already Voted!!!");
//**************************check if candidate id is valid*************************        
        require(_candidateId>0 && _candidateId<=candidateCount,"Invalid Candidate Id!!!");
//**************************main operations****************************************
//*****************************set voter has voted*********************************
        voters[msg.sender]=true;
//*****************************add vote to vote count for the candate voted for****
        candidates[_candidateId].voteCount++;
//************************emit the candidate voter for*****************************        
        emit VoteEvent(_candidateId);        
    }

///******************SillyNFTier***************************************************    
}
