-- Worker [ent1]
alter table "public"."worker"  add column  "piggybank"  numeric(19, 2);


-- Task [ent3]
alter table "public"."task"  add column  "accepted"  bool;
alter table "public"."task"  add column  "reward_2"  numeric(19, 2);


-- Item_Task [rel4]
create table "public"."item_task" (
   "item_oid"  int4 not null,
   "task_oid"  int4 not null,
  primary key ("item_oid", "task_oid")
);
alter table "public"."item_task"   add constraint fk_item_task_item foreign key ("item_oid") references "public"."item" ("oid");
alter table "public"."item_task"   add constraint fk_item_task_task foreign key ("task_oid") references "public"."task" ("oid");


-- Worker_Task [rel5]
create table "public"."worker_task" (
   "worker_oid"  int4 not null,
   "task_oid"  int4 not null,
  primary key ("worker_oid", "task_oid")
);
alter table "public"."worker_task"   add constraint fk_worker_task_worker foreign key ("worker_oid") references "public"."worker" ("user_oid");
alter table "public"."worker_task"   add constraint fk_worker_task_task foreign key ("task_oid") references "public"."task" ("oid");


