#!/bin/bash

AddHosts(){
    for line in $(cat hosts | egrep -v '^$|^#')
    do
        node_fqdn=$(echo ${line} | awk -F= '{print $1}')
        node=$(echo ${node_fqdn} | awk -F. '{print $1}')
        ip=$(echo ${line} | awk -F= '{print $2}')

        echo -e "${ip}\t${node}\t${node_fqdn}" >> /etc/hosts
        if [ $? -eq 0 ]; then
            echo -e "${GRE}[ OK ] ${node} 추가 완료${NC}"
        else
            echo -e "${RED}[ FAIL ] ${node} 추가 실패${NC}"
        exit 1
        fi
    done
}

SshPassRoot(){
    PKGInstaller sshpass
    ServiceStart sshd

    echo -e 'y\n' | ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "${GRE}[ OK ] Ssh 키 생성 성공${NC}"
    else
        echo -e "${RED}[ FAIL ] Ssh 키 생성 실패{$NC}"
        exit 4
    fi

    for host in $(cat hosts | egrep -v '^$|^#' | awk -F= '{print $1}')
    do
        sshpass -p ${pass} ssh-copy-id -o StrictHostKeyChecking=no root@${host} > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo -e "${GRE}[ OK ] ${host} Ssh 키 배포 성공${NC}"
        else
            echo -e "${RED}[ FAIL ] ${host} Ssh 키 배포 실패${NC}"
        exit 5
        fi
    done
}

AddAnsibleUser(){
    for host in $(cat hosts | egrep -v '^$|^#' | awk -F= '{print $1}')
    do
        ssh ${host} "useradd -G wheel ansible" > /dev/null 2>&1
        ssh ${host} "echo 'ansible' | passwd --stdin 'ansible'" > /dev/null 2>&1
        ssh ${host} "sed -i 's/^%wheel.*ALL$/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers"
        if [ $? -eq 0 ]; then
            echo -e "${GRE}[ OK ] ${host} Ansible 계정 생성 성공${NC}"
        else
            echo -e "${RED}[ FAIL ] ${host} Ansible 계정 생성 실패${NC}"
        exit 6
        fi
    done
}

SshPassAnsible(){
    su - ansible -c 'echo -e "y\n" | ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa > /dev/null 2>&1'
    if [ $? -eq 0 ]; then
        echo -e "${GRE}[ OK ] Ansible Ssh 키 생성 성공${NC}"
    else
        echo -e "${RED}[ FAIL ] Ansible Ssh 키 생성 실패{$NC}"
        exit 7
    fi
    
    for host in $(cat hosts | egrep -v "^$|^#" | awk -F= "{print \$1}")
    do
        su - ansible -c "sshpass -p ansible ssh-copy-id -o StrictHostKeyChecking=no ansible@${host}" > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo -e "${GRE}[ OK ] ${host} Ansible Ssh 키 배포 성공${NC}"
        else
            echo -e "${RED}[ FAIL ] ${host} Ansible Ssh 키 배포 실패${NC}"
        exit 8
        fi
    done
}

InstallAnsible(){
    PKGInstaller epel-release
    PKGInstaller ansible
}


cat << EOF
*************************************************
* Date    : 2025-07-13                          *
* Name    : Ansible 초기 설정 스크립트          *
* Author  : YGS                                 *
*************************************************
EOF

source common.sh

echo -en "${MGA}루트 패스워드를 입력해주세요. : ${NC}"
read pass

AddHosts
SshPassRoot
AddAnsibleUser
SshPassAnsible
InstallAnsible
