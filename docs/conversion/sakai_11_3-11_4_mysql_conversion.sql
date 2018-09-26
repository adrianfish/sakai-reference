--
-- SAK-31840 update defaults as its now managed in the POJO
--
alter table GB_GRADABLE_OBJECT_T alter column IS_EXTRA_CREDIT SET DEFAULT NULL;
alter table GB_GRADABLE_OBJECT_T alter column HIDE_IN_ALL_GRADES_TABLE SET DEFAULT NULL;
