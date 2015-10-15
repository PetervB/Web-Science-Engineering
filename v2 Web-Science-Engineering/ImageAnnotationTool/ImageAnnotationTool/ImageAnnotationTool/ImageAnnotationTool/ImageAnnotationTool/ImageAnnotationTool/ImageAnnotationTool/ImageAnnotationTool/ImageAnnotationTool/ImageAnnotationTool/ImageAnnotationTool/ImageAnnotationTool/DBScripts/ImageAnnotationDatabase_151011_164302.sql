-- Excecution [ent7]
create table "public"."excecution" (
   "oid"  int4  not null,
  primary key ("oid")
);


-- Item [ent8]
create table "public"."item" (
   "oid"  int4  not null,
   "title"  varchar(255),
   "caption"  text,
   "imageurl"  varchar(255),
  primary key ("oid")
);


-- Annotation [ent9]
create table "public"."annotation" (
   "oid"  int4  not null,
   "label"  varchar(255),
   "confidence"  int4,
  primary key ("oid")
);


-- Task_Excecution [rel10]
alter table "public"."task"  add column  "excecution_oid"  int4;
alter table "public"."task"   add constraint fk_task_excecution foreign key ("excecution_oid") references "public"."excecution" ("oid");


-- Excecution_Item [rel11]
create table "public"."excecution_item" (
   "excecution_oid"  int4 not null,
   "item_oid"  int4 not null,
  primary key ("excecution_oid", "item_oid")
);
alter table "public"."excecution_item"   add constraint fk_excecution_item_excecution foreign key ("excecution_oid") references "public"."excecution" ("oid");
alter table "public"."excecution_item"   add constraint fk_excecution_item_item foreign key ("item_oid") references "public"."item" ("oid");


-- Worker_Excecution [rel13]
alter table "public"."worker"  add column  "excecution_oid"  int4;
alter table "public"."worker"   add constraint fk_worker_excecution foreign key ("excecution_oid") references "public"."excecution" ("oid");


-- Excecution_Annotation [rel14]
alter table "public"."excecution"  add column  "annotation_oid"  int4;
alter table "public"."excecution"   add constraint fk_excecution_annotation foreign key ("annotation_oid") references "public"."annotation" ("oid");


-- Item_Annotation [rel15]
alter table "public"."item"  add column  "annotation_oid"  int4;
alter table "public"."item"   add constraint fk_item_annotation foreign key ("annotation_oid") references "public"."annotation" ("oid");


