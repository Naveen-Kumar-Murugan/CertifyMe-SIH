// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.4.24;

contract Certificate{
    struct certificate{
        string candidate_name;
        string organization_name;
        string position;
        string contest_name;
        uint256 date;
    }

    mapping (bytes32 => certificate) certificates;

    event GeneratedCertificate(bytes32 certificateId);

    function stringTobytes32(string memory source) private pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
        assembly {
                result := mload(add(source, 32))
        }
    }

    function generateCertificate(
        string memory id,
        string memory organization_name,
        string memory candidate_name,
        string memory position,
        string memory contest_name,
        uint256 date
    ) public {
        bytes32 _id = stringTobytes32(id);
        certificates[_id] = certificate(candidate_name, organization_name, position, contest_name, date);
        emit GeneratedCertificate(_id);
    }

    function getData(string memory _id) public view returns(string memory, string memory, string memory, string memory, uint256) {
        bytes32 byte_id = stringTobytes32(_id);
        certificate memory temp = certificates[byte_id];
        return (temp.candidate_name, temp.organization_name, temp.position, temp.contest_name, temp.date);
    }
}