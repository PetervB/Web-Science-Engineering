-- Campaign_Task [rel1]
alter table "public"."campaign"  add column  "task_oid"  int4;
alter table "public"."campaign"   add constraint fk_campaign_task foreign key ("task_oid") references "public"."task" ("oid");


-- Item_Annotation [rel15]
alter table "public"."item"  add column  "annotation_oid"  int4;
alter table "public"."item"   add constraint fk_item_annotation foreign key ("annotation_oid") references "public"."annotation" ("oid");


-- Item_Task [rel4]
alter table "public"."task"  add column  "item_oid"  int4;
alter table "public"."task"   add constraint fk_task_item foreign key ("item_oid") references "public"."item" ("oid");


