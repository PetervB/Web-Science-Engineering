-- Campaign [ent4]
create table "public"."campaign" (
   "oid"  int4  not null,
   "name"  varchar(255),
   "budget"  numeric(19, 2),
   "status"  bool,
  primary key ("oid")
);


-- Requester_Campaign [rel2]
alter table "public"."campaign"  add column  "requester_oid"  int4;
alter table "public"."campaign"   add constraint fk_campaign_requester foreign key ("requester_oid") references "public"."requester" ("user_oid");


