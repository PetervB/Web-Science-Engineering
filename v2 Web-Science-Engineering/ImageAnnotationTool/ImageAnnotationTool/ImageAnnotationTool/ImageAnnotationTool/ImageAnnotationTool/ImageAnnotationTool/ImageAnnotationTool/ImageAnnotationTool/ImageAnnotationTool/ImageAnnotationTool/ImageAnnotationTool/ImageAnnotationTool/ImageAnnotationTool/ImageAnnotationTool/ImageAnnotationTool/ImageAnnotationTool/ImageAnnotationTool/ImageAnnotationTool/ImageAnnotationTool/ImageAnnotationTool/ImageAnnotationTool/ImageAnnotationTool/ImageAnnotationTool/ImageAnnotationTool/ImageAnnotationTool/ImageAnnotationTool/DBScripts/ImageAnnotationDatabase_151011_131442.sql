-- Campaign_Task [rel1]
alter table "public"."campaign"  add column  "task_oid"  int4;
alter table "public"."campaign"   add constraint fk_campaign_task foreign key ("task_oid") references "public"."task" ("oid");


