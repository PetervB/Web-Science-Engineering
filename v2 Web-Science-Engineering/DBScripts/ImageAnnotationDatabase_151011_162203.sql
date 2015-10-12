-- Skill Set [ent6]
create table "public"."skill_set" (
   "oid"  int4  not null,
  primary key ("oid")
);


-- Skill Set_Skill [rel5]
alter table "public"."skill_set"  add column  "skill_oid"  int4;
alter table "public"."skill_set"   add constraint fk_skill_set_skill foreign key ("skill_oid") references "public"."skill" ("oid");


-- Task_Skill Set [rel7]
alter table "public"."skill_set"  add column  "task_oid"  int4;
alter table "public"."skill_set"   add constraint fk_skill_set_task foreign key ("task_oid") references "public"."task" ("oid");


