#!/bin/bash
set -e

usage="$(basename "$0") [-h] [-t broker_type][-u user] [-p password] [-m masterIP] [-s slaveIP]
Please provide next argumetns:
    -t broker type
    -u cluster user
    -p cluster password
    -m master IP
    -s slave IP"
options=':hi:t:u:p:m:s:'
while getopts $options option; do
  case "$option" in
    h) echo "$usage"; exit;;
    t) type=$OPTARG;;
    u) user=$OPTARG;;
    p) password=$OPTARG;;
    m) masterIP=$OPTARG;;
    s) slaveIP=$OPTARG;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2; echo "$usage" >&2; exit 1;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2; echo "$usage" >&2; exit 1;;
  esac
done

function replace(){
  xml_file="/home/opc/$3/etc/broker.xml"
  key=$1
  value=$2

  temporary="temp_file.temp"
  echo " ">> $xml_file
  # Replacing element value with $new_value

  echo $value
  sed -e "s/@$key@/$value/g" $xml_file > $temporary
  echo "Changing $key to $value..."
  chmod 666 $xml_file
  mv $temporary $xml_file

}

replace "user" "$user" "$type"
replace "password" "$password" "$type"
replace "masterIP" "$masterIP" "$type"
replace "slaveIP" "$slaveIP" "$type"
