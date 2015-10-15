-- Task [ent3]
create table "public"."task" (
   "oid"  int4  not null,
   "title"  varchar(255),
   "description"  text,
   "reward"  float8,
   "deadline"  date,
  primary key ("oid")
);


