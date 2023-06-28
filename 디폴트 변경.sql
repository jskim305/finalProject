alter table MEMBER modify M_CREATE default SYSDATE;
alter table MEMBER modify M_STATUS default 'Y';

alter table BOARD modify B_CREATE default SYSDATE;
alter table REPLY modify R_CREATE default SYSDATE;
alter table REVIEW modify R_CREATE default SYSDATE;
alter table ORDERS modify O_DATE default SYSDATE;
alter table SECTOR modify S_STATUS default 0;


create sequence seq_orDetail;
create sequence seq_review;
create sequence seq_item;
create sequence seq_cart;
create sequence seq_reservation;
create sequence seq_farm;
create sequence seq_sector;
create sequence seq_board;
create sequence seq_orders;
create sequence seq_reply;
