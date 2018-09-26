#!/bin/sh

DBNAME=sakai2

CONVERSIONDIR='/Users/fisha/bin/conversion-scripts'

echo "Dropping ${DBNAME} ..."
mysql -u root -e "DROP DATABASE ${DBNAME}"
echo "Creating ${DBNAME} ..."
mysql -u root -e "create database ${DBNAME} default character set utf8"
echo "Setting up permissions on ${DBNAME} ..."
mysql -u root -e "grant all on ${DBNAME}.* to sakaiuser@localhost identified by 'secret'"
mysql -u root -e "grant all on ${DBNAME}.* to sakaiuser@'127.0.0.1' identified by 'secret'"

echo "Importing current db data ..."
mysql -u sakaiuser --password=secret ${DBNAME} < ~/sakai-db1-database.2.sql

echo "Running 10_1-10_5 ..."
mysql -u sakaiuser --password=secret ${DBNAME} < ${CONVERSIONDIR}/sakai_10_1-10_5_mysql_conversion.sql
echo "Running 10_5-10_6 ..."
mysql -u sakaiuser --password=secret ${DBNAME} < ${CONVERSIONDIR}/sakai_10_5-10_6_mysql_conversion.sql
echo "Running 10_7-10_8 ..."
mysql -u sakaiuser --password=secret ${DBNAME} < ${CONVERSIONDIR}/sakai_10_7-10_8_mysql_conversion.sql
echo "Running 11 ..."
mysql -u sakaiuser --password=secret ${DBNAME} < ${CONVERSIONDIR}/sakai_11_mysql_conversion.sql
echo "Running 11_0-11_1 ..."
mysql -u sakaiuser --password=secret ${DBNAME} < ${CONVERSIONDIR}/sakai_11_0-11_1_mysql_conversion.sql
echo "Running 11_1-11_2 ..."
mysql -u sakaiuser --password=secret ${DBNAME} < ${CONVERSIONDIR}/sakai_11_1-11_2_mysql_conversion.sql
echo "Running 11_2-11_3 ..."
mysql -u sakaiuser --password=secret ${DBNAME} < ${CONVERSIONDIR}/sakai_11_2-11_3_mysql_conversion.sql
echo "Running 11_3-11_4 ..."
mysql -u sakaiuser --password=secret ${DBNAME} < ${CONVERSIONDIR}/sakai_11_3-11_4_mysql_conversion.sql
echo "Running 11_4-11_5 ..."
mysql -u sakaiuser --password=secret ${DBNAME} < ${CONVERSIONDIR}/sakai_11_4-11_5_mysql_conversion.sql
echo "Running 12 ..."
mysql -u sakaiuser --password=secret ${DBNAME} < ${CONVERSIONDIR}/sakai_12_mysql_conversion.sql
