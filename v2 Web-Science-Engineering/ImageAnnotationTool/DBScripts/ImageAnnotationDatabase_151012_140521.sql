-- Group [Group]
create table "public"."group" (
   "oid"  int4  not null,
   "groupname"  varchar(255),
  primary key ("oid")
);


-- Module [Module]
create table "public"."module" (
   "oid"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("oid")
);


-- User [User]
create table "public"."user" (
   "oid"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "email"  varchar(255),
  primary key ("oid")
);


-- Worker [ent1]
create table "public"."worker" (
   "user_oid"  int4  not null,
   "name"  varchar(255),
   "birthdate"  date,
  primary key ("user_oid")
);


-- Requester [ent2]
create table "public"."requester" (
   "user_oid"  int4  not null,
   "name"  varchar(255),
   "birthdate"  date,
  primary key ("user_oid")
);


-- Task [ent3]
create table "public"."task" (
   "oid"  int4  not null,
   "title"  varchar(255),
   "description"  text,
   "reward"  float8,
   "deadline"  date,
   "campaignid"  int4,
   "status"  int4,
  primary key ("oid")
);


-- Campaign [ent4]
create table "public"."campaign" (
   "oid"  int4  not null,
   "name"  varchar(255),
   "budget"  numeric(19, 2),
   "open"  bool,
   "status"  bool,
  primary key ("oid")
);


-- Skill [ent5]
create table "public"."skill" (
   "oid"  int4  not null,
   "skill_name"  int4,
  primary key ("oid")
);


-- Excecution [ent7]
create table "public"."excecution" (
   "oid"  int4  not null,
   "taskid"  int4,
   "workerid"  int4,
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


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group"  add column  "module_oid"  int4;
alter table "public"."group"   add constraint fk_group_module foreign key ("module_oid") references "public"."module" ("oid");


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_oid"  int4 not null,
   "module_oid"  int4 not null,
  primary key ("group_oid", "module_oid")
);
alter table "public"."group_module"   add constraint fk_group_module_group foreign key ("group_oid") references "public"."group" ("oid");
alter table "public"."group_module"   add constraint fk_group_module_module foreign key ("module_oid") references "public"."module" ("oid");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"  add column  "group_oid"  int4;
alter table "public"."user"   add constraint fk_user_group foreign key ("group_oid") references "public"."group" ("oid");


-- User_Group [User2Group_Group2User]
create table "public"."user_group" (
   "user_oid"  int4 not null,
   "group_oid"  int4 not null,
  primary key ("user_oid", "group_oid")
);
alter table "public"."user_group"   add constraint fk_user_group_user foreign key ("user_oid") references "public"."user" ("oid");
alter table "public"."user_group"   add constraint fk_user_group_group foreign key ("group_oid") references "public"."group" ("oid");


-- Campaign_Task [rel1]
alter table "public"."campaign"  add column  "task_oid"  int4;
alter table "public"."campaign"   add constraint fk_campaign_task foreign key ("task_oid") references "public"."task" ("oid");


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


-- Requester_Campaign [rel2]
alter table "public"."campaign"  add column  "requester_oid"  int4;
alter table "public"."campaign"   add constraint fk_campaign_requester foreign key ("requester_oid") references "public"."requester" ("user_oid");


-- Worker_Skills [rel3]
alter table "public"."worker"  add column  "skill_oid"  int4;
alter table "public"."worker"   add constraint fk_worker_skill foreign key ("skill_oid") references "public"."skill" ("oid");


-- Task_Skill [rel9]
alter table "public"."task"  add column  "skill_oid_2"  int4;
alter table "public"."task"   add constraint fk_task_skill foreign key ("skill_oid_2") references "public"."skill" ("oid");


-- GEN FK: Worker --> User
alter table "public"."worker"   add constraint fk_worker_user foreign key ("user_oid") references "public"."user" ("oid");


-- GEN FK: Requester --> User
alter table "public"."requester"   add constraint fk_requester_user foreign key ("user_oid") references "public"."user" ("oid");


