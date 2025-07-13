#!/bin/bash

RED='\033[0;31m'
GRE='\033[0;32m'
YLW='\033[0;33m'
BLE='\033[0;34m'
MGA='\033[0;35m'
CYN='\033[0;36m'
NC='\033[0m'

PKGInstaller(){
    PKGS=$*

    yum -qy install ${PKGS}    > /dev/null 2>&1
    rpm -q ${PKGS}             > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "${GRE}[ OK ] ${PKGS} 패키지 설치 완료${NC}"
    else
        echo -e "${RED}[ FAIL ] ${PKGS} 패키지 설치 실패${NC}"
        exit 2
    fi
}

ServiceStart(){
    SVC=$1

    systemctl enable ${SVC}  > /dev/null 2>&1
    systemctl start ${SVC}   > /dev/null 2>&1
    STATUS=$(systemctl is-active ${SVC})
    if [ ${STATUS} == "active" ]; then
        echo -e "${GRE}[ OK ] ${SVC} 서비스 기동 완료${NC}"
    else
        echo -e "${RED}[ FAIL ] ${SVC} 서비스 기동 실패${NC}"
        exit 3
    fi
}