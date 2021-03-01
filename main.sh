#! /bin/bash

# SET BRANCH TO DEPLOY
if [[ $# -eq 0 ]]; then
    echo "Please provide argument deploy or destroy"
    exit 1
fi

case $1 in
    deploy)
        SCRIPT="deploy.sh"
        ;;
    destroy)
        SCRIPT="destroy.sh"
        ;;
    *)
        echo "Please provide argument deploy or destroy"
        exit 1
        ;;
esac
shift 

BRANCH="master"
KEY_FILE=""

while getopts ":b:i:" option; do
    case "${option}" in
        b)
            BRANCH=${OPTARG}
            ;;
        i)
            KEY_FILE=${OPTARG}
            ;;
        *)
            echo "Usage: bash main.sh deploy|destroy [-b <branche>] [-i <clé ssh>]"
            exit 1
            ;;
    esac
done

VM_ADDRESS="ec2-15-237-150-46.eu-west-3.compute.amazonaws.com"
VM_USER="ubuntu"

if [[ -z $KEY_FILE ]]
then
    ssh $VM_USER@$VM_ADDRESS "bash -s" < docker.sh
    ssh $VM_USER@$VM_ADDRESS "bash -s" < $SCRIPT $BRANCH
else
    ssh -i $KEY_FILE $VM_USER@$VM_ADDRESS "bash -s" < docker.sh
    ssh -i $KEY_FILE $VM_USER@$VM_ADDRESS "bash -s" < $SCRIPT $BRANCH
fi

exit 0