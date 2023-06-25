alter session set "_oracle_script"=true;

create user finalProject identified by 1234;

grant connect, resource to finalProject;

alter user finalProject default tablespace users quota unlimited on users;