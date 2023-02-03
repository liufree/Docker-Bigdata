

/* 低版本mysql授权远程访问  
GRANT ALL on *.* to 'liufree'@'%' identified by 'liu12345' with grant option;
flush privileges;
*/

/* 高版本mysql授权远程访问 caching_sha2_password*/
use mysql;
create user 'root'@'%' identified by  'admin';
grant all privileges on *.* to 'root'@'%'  with grant option;
flush privileges;

/* 高版本授权bigdata数据库权限 
grant all on bigdata.* to "liufree"@"%" with grant option;
*/
/* 高版本授权bigdata数据库权限 caching_sha2_password */
grant all on *.* to "liufree"@"%" with grant option;

/*
prometheus-exporter专用账号
*/
/* 高版本mysql授权远程访问 caching_sha2_password*/
create user 'prom'@'%' identified by  'prometheus';
grant all privileges on *.* to 'prom'@'%'  with grant option;
flush privileges;

/* 高版本授权bigdata数据库权限 
grant all on bigdata.* to "liufree"@"%" with grant option;
*/
/* 高版本授权bigdata数据库权限 caching_sha2_password */
grant all on *.* to "prom"@"%" with grant option;