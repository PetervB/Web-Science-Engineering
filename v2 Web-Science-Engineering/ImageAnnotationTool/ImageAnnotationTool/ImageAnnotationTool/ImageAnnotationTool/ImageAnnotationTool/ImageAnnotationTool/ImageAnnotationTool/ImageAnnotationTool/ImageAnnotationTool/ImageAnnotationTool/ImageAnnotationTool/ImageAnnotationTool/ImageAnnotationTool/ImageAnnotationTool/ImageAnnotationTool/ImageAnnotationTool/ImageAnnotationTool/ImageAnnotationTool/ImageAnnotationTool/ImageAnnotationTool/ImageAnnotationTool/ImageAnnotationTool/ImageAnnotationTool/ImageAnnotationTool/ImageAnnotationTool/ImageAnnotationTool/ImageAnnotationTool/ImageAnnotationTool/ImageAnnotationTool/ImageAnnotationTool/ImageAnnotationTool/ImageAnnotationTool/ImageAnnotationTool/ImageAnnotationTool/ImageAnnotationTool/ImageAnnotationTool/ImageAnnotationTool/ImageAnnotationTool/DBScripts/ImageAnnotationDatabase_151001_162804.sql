-- Worker [ent1]
create table "public"."worker" (
   "user_oid"  int4  not null,
   "oid"  int4  not null,
   "name"  varchar(255),
   "birthdate"  date,
  primary key ("user_oid")
);


-- GEN FK: Worker --> User
alter table "public"."worker"   add constraint fk_worker_user foreign key ("user_oid") references "public"."user" ("oid");


