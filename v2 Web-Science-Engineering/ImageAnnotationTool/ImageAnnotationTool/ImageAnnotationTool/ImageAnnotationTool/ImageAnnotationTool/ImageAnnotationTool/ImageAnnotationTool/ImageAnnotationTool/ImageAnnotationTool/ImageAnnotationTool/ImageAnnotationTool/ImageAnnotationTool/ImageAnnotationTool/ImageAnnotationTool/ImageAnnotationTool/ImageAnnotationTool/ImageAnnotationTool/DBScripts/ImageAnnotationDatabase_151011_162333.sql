-- Task_Skill [rel9]
alter table "public"."task"  add column  "skill_oid_2"  int4;
alter table "public"."task"   add constraint fk_task_skill_2 foreign key ("skill_oid_2") references "public"."skill" ("oid");


