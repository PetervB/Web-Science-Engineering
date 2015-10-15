-- Campaign [ent3]
create table "public"."campaign" (
   "oid"  int4  not null,
   "name"  varchar(255),
   "budget"  numeric(19, 2),
   "status"  bool,
  primary key ("oid")
);


-- Requester_Campaign [rel1]
alter table "public"."requester"  add column  "campaign_oid"  int4;
alter table "public"."requester"   add constraint fk_requester_campaign foreign key ("campaign_oid") references "public"."campaign" ("oid");


