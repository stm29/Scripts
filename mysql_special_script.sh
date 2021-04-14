
 echo Script for MYSQLi
 touch dblist.txt
 > dblist.txt
 > query_output  
 # mysql credential. Replace the user name and password with your credentials and remove it after execution due to security reasons
 user="" #user your credentials here
 pssd=""

 for values in #use your values here
 do
 echo "Hosts are $values ";
 mysql -u $user -p$pssd -h $values -Bse 'SHOW DATABASES LIKE "qualifier_%"' >> dblist.txt ;
 #echo "Success";
 done
 qual=$(cat dblist.txt)
 
 ## To execute query. Replace the query with required query
 
 for values in #use your values here
 do
 for db in $qual
      do
     mysql -u $user -p$pssd -h $values $db -sN -e ' select distinct u.email from ic_info_user u where u.active_flag AND u.email NOT LIKE "%control-tec%"' >> query_output
 done
 
 
 done
