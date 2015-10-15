-- Campaign_Task [rel1]
alter table "public"."campaign"  add column  "task_oid"  int4;
alter table "public"."campaign"   add constraint fk_campaign_task foreign key ("task_oid") references "public"."task" ("oid");


-- Item_Annotation [rel15]
alter table "public"."annotation"  add column  "oid"  int4;
alter table "public"."annotation"   add constraint fk_annotation_item foreign key ("oid") references "public"."item" ("oid");


-- Item_Task [rel4]
alter table "public"."item"  add column  "task_oid"  int4;
alter table "public"."item"   add constraint fk_item_task foreign key ("task_oid") references "public"."task" ("oid");


