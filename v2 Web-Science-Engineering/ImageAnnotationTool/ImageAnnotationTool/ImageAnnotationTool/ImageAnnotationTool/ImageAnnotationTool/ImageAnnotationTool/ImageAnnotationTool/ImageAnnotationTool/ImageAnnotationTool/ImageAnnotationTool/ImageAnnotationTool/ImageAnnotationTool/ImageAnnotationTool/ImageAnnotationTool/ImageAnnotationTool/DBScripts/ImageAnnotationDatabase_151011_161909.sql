-- Skill [ent5]
create table "public"."skill" (
   "oid"  int4  not null,
   "skill_name"  int4,
  primary key ("oid")
);


-- Worker_Skills [rel3]
alter table "public"."worker"  add column  "skill_oid"  int4;
alter table "public"."worker"   add constraint fk_worker_skill foreign key ("skill_oid") references "public"."skill" ("oid");


-- Skill_Task [rel4]
alter table "public"."task"  add column  "skill_oid"  int4;
alter table "public"."task"   add constraint fk_task_skill foreign key ("skill_oid") references "public"."skill" ("oid");


