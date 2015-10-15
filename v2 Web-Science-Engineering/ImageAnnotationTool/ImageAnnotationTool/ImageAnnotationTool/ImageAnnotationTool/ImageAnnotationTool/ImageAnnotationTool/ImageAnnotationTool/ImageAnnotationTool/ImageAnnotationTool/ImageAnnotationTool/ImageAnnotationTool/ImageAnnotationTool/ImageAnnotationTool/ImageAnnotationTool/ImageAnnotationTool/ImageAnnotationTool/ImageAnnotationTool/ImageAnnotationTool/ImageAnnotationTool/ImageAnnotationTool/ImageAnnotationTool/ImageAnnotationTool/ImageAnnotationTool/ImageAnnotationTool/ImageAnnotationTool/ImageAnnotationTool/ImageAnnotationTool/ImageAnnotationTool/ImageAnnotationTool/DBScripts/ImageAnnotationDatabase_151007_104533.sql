-- Requester [ent2]
create table "public"."requester" (
   "user_oid"  int4  not null,
   "name"  varchar(255),
   "birthdate"  date,
  primary key ("user_oid")
);


-- GEN FK: Requester --> User
alter table "public"."requester"   add constraint fk_requester_user foreign key ("user_oid") references "public"."user" ("oid");


