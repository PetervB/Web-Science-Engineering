-- Item [ent8]
alter table "public"."item"  add column  "taskid"  int4;


-- Item_Task [rel4]
alter table "public"."task"  add column  "item_oid"  int4;
alter table "public"."task"   add constraint fk_task_item_2 foreign key ("item_oid") references "public"."item" ("oid");


