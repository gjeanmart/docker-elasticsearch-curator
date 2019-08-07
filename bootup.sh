#!/bin/sh
 
echo "Starting bootup process..."
 
echo " "
echo "Copying config file..."
cp /curator/config/curator.yml.sample /curator/curator.yml
 
echo " "
echo "Replacing vars..."
sed -i "s/{{ELASTIC_URL}}/$ELASTIC_URL/g" /curator/curator.yml
sed -i "s/{{ELASTIC_PASSWORD}}/$ELASTIC_PASSWORD/g" /curator/curator.yml
sed -i "s/{{ELASTIC_USER}}/$ELASTIC_USER/g" /curator/curator.yml
 
echo " "
echo "Calling curator..."
/usr/local/bin/curator --config /curator/curator.yml $@ /curator/config/curator-actions.yml

