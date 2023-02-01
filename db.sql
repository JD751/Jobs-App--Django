BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "app_location" (
	"id"	integer NOT NULL,
	"street"	varchar(200) NOT NULL,
	"city"	varchar(200) NOT NULL,
	"state"	varchar(200) NOT NULL,
	"country"	varchar(200) NOT NULL,
	"zip"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "app_author" (
	"id"	integer NOT NULL,
	"name"	varchar(200) NOT NULL,
	"company"	varchar(200) NOT NULL,
	"designation"	varchar(200) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "app_skills" (
	"id"	integer NOT NULL,
	"name"	varchar(200),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "app_jobpost_skills" (
	"id"	integer NOT NULL,
	"jobpost_id"	bigint NOT NULL,
	"skills_id"	bigint NOT NULL,
	FOREIGN KEY("skills_id") REFERENCES "app_skills"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("jobpost_id") REFERENCES "app_jobpost"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "subscribe_subscribe" (
	"id"	integer NOT NULL,
	"first_name"	varchar(100) NOT NULL,
	"last_name"	varchar(100) NOT NULL,
	"email"	varchar(100) NOT NULL,
	"option"	varchar(2) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "upload_uploads" (
	"id"	integer NOT NULL,
	"image"	varchar(100) NOT NULL,
	"description"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "upload_uploadfiles" (
	"id"	integer NOT NULL,
	"file"	varchar(100) NOT NULL,
	"description"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "app_jobpost" (
	"id"	integer NOT NULL,
	"title"	varchar(200) NOT NULL,
	"date"	datetime NOT NULL,
	"description"	text NOT NULL,
	"salary"	integer NOT NULL,
	"slug"	varchar(40) UNIQUE,
	"Location_id"	bigint UNIQUE,
	"author_id"	bigint,
	"type"	varchar(200) NOT NULL,
	FOREIGN KEY("Location_id") REFERENCES "app_location"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("author_id") REFERENCES "app_author"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2022-12-07 12:16:53.110707');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2022-12-07 12:16:53.149785');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2022-12-07 12:16:53.175020');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2022-12-07 12:16:53.200578');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2022-12-07 12:16:53.253647');
INSERT INTO "django_migrations" VALUES (6,'app','0001_initial','2022-12-07 12:16:53.261109');
INSERT INTO "django_migrations" VALUES (7,'contenttypes','0002_remove_content_type_name','2022-12-07 12:16:53.310232');
INSERT INTO "django_migrations" VALUES (8,'auth','0002_alter_permission_name_max_length','2022-12-07 12:16:53.337235');
INSERT INTO "django_migrations" VALUES (9,'auth','0003_alter_user_email_max_length','2022-12-07 12:16:53.378543');
INSERT INTO "django_migrations" VALUES (10,'auth','0004_alter_user_username_opts','2022-12-07 12:16:53.396505');
INSERT INTO "django_migrations" VALUES (11,'auth','0005_alter_user_last_login_null','2022-12-07 12:16:53.434734');
INSERT INTO "django_migrations" VALUES (12,'auth','0006_require_contenttypes_0002','2022-12-07 12:16:53.440089');
INSERT INTO "django_migrations" VALUES (13,'auth','0007_alter_validators_add_error_messages','2022-12-07 12:16:53.464047');
INSERT INTO "django_migrations" VALUES (14,'auth','0008_alter_user_username_max_length','2022-12-07 12:16:53.492354');
INSERT INTO "django_migrations" VALUES (15,'auth','0009_alter_user_last_name_max_length','2022-12-07 12:16:53.514494');
INSERT INTO "django_migrations" VALUES (16,'auth','0010_alter_group_name_max_length','2022-12-07 12:16:53.544456');
INSERT INTO "django_migrations" VALUES (17,'auth','0011_update_proxy_permissions','2022-12-07 12:16:53.563767');
INSERT INTO "django_migrations" VALUES (18,'auth','0012_alter_user_first_name_max_length','2022-12-07 12:16:53.596384');
INSERT INTO "django_migrations" VALUES (19,'sessions','0001_initial','2022-12-07 12:16:53.612393');
INSERT INTO "django_migrations" VALUES (20,'app','0002_jobpost_title','2022-12-07 13:38:31.835705');
INSERT INTO "django_migrations" VALUES (21,'app','0003_jobpost_date_jobpost_description_jobpost_salary','2022-12-07 13:38:31.881136');
INSERT INTO "django_migrations" VALUES (22,'app','0004_jobpost_slug','2022-12-09 10:53:13.768777');
INSERT INTO "django_migrations" VALUES (23,'app','0005_alter_jobpost_slug','2022-12-09 16:02:16.454114');
INSERT INTO "django_migrations" VALUES (24,'app','0006_location_jobpost_location','2022-12-13 14:26:36.635862');
INSERT INTO "django_migrations" VALUES (25,'app','0007_author_jobpost_author','2022-12-14 09:30:52.771665');
INSERT INTO "django_migrations" VALUES (26,'app','0008_skills_jobpost_skills','2022-12-15 12:26:49.292403');
INSERT INTO "django_migrations" VALUES (27,'subscribe','0001_initial','2022-12-20 12:36:39.186484');
INSERT INTO "django_migrations" VALUES (28,'subscribe','0002_subscribe_user_name','2022-12-21 13:51:46.596398');
INSERT INTO "django_migrations" VALUES (29,'subscribe','0003_remove_subscribe_user_name','2022-12-21 13:53:12.750898');
INSERT INTO "django_migrations" VALUES (30,'subscribe','0004_subscribe_option_alter_subscribe_email','2022-12-28 12:57:57.829298');
INSERT INTO "django_migrations" VALUES (31,'subscribe','0005_alter_subscribe_option','2022-12-29 13:52:25.595911');
INSERT INTO "django_migrations" VALUES (32,'upload','0001_initial','2022-12-29 13:52:25.622105');
INSERT INTO "django_migrations" VALUES (33,'upload','0002_uploadfiles','2022-12-30 12:13:19.641594');
INSERT INTO "django_migrations" VALUES (34,'app','0009_jobpost_type_alter_jobpost_description','2023-01-03 11:29:29.564883');
INSERT INTO "django_migrations" VALUES (35,'app','0010_alter_jobpost_type','2023-01-03 11:32:02.472859');
INSERT INTO "django_migrations" VALUES (36,'app','0011_alter_jobpost_type','2023-01-03 11:40:32.181935');
INSERT INTO "django_migrations" VALUES (37,'app','0012_alter_jobpost_type','2023-01-03 11:44:09.244855');
INSERT INTO "django_migrations" VALUES (38,'app','0013_alter_jobpost_type','2023-01-04 08:17:10.749062');
INSERT INTO "django_admin_log" VALUES (1,'10','Seventh Job Post',1,'[{"added": {}}]',7,1,'2022-12-12 12:45:56.171531');
INSERT INTO "django_admin_log" VALUES (2,'1','New York',1,'[{"added": {}}]',8,1,'2022-12-13 16:28:21.331207');
INSERT INTO "django_admin_log" VALUES (3,'2','Dewsbury',1,'[{"added": {}}]',8,1,'2022-12-13 16:30:33.504937');
INSERT INTO "django_admin_log" VALUES (4,'3','Coburg',1,'[{"added": {}}]',8,1,'2022-12-13 16:31:17.447527');
INSERT INTO "django_admin_log" VALUES (5,'5','Coburg',1,'[{"added": {}}]',8,1,'2022-12-18 10:53:58.572962');
INSERT INTO "django_admin_log" VALUES (6,'13','Tenth Job Post',2,'[{"changed": {"fields": ["Location", "Author", "Skills"]}}]',7,1,'2022-12-18 11:11:42.678765');
INSERT INTO "django_admin_log" VALUES (7,'14','Eleventh Job Post',1,'[{"added": {}}]',7,1,'2023-01-03 11:35:21.108525');
INSERT INTO "django_admin_log" VALUES (8,'6','ss',1,'[{"added": {}}]',8,1,'2023-01-03 11:42:21.329075');
INSERT INTO "django_admin_log" VALUES (9,'15','12',1,'[{"added": {}}]',7,1,'2023-01-03 11:42:25.783060');
INSERT INTO "django_admin_log" VALUES (10,'15','12',3,'',7,1,'2023-01-03 11:52:23.096289');
INSERT INTO "django_admin_log" VALUES (11,'6','ss',3,'',8,1,'2023-01-03 11:52:35.677841');
INSERT INTO "django_admin_log" VALUES (12,'14','Eleventh Job Post',3,'',7,1,'2023-01-04 12:48:50.036597');
INSERT INTO "django_admin_log" VALUES (13,'13','Tenth Job Post',3,'',7,1,'2023-01-04 12:49:33.664143');
INSERT INTO "django_admin_log" VALUES (14,'3','Author object (3)',1,'[{"added": {}}]',9,1,'2023-01-04 12:51:41.462234');
INSERT INTO "django_admin_log" VALUES (15,'15','Monika''s Software Developer',1,'[{"added": {}}]',7,1,'2023-01-04 12:52:04.281864');
INSERT INTO "django_admin_log" VALUES (16,'29','Subscribe object (29)',3,'',11,1,'2023-01-09 20:18:06.570341');
INSERT INTO "django_admin_log" VALUES (17,'28','Subscribe object (28)',3,'',11,1,'2023-01-09 20:18:06.590318');
INSERT INTO "django_admin_log" VALUES (18,'27','Subscribe object (27)',3,'',11,1,'2023-01-09 20:18:06.595087');
INSERT INTO "django_admin_log" VALUES (19,'26','Subscribe object (26)',3,'',11,1,'2023-01-09 20:18:06.599774');
INSERT INTO "django_admin_log" VALUES (20,'25','Subscribe object (25)',3,'',11,1,'2023-01-09 20:18:06.605020');
INSERT INTO "django_admin_log" VALUES (21,'24','Subscribe object (24)',3,'',11,1,'2023-01-09 20:18:06.612179');
INSERT INTO "django_admin_log" VALUES (22,'23','Subscribe object (23)',3,'',11,1,'2023-01-09 20:18:06.616114');
INSERT INTO "django_admin_log" VALUES (23,'22','Subscribe object (22)',3,'',11,1,'2023-01-09 20:18:06.620900');
INSERT INTO "django_admin_log" VALUES (24,'21','Subscribe object (21)',3,'',11,1,'2023-01-09 20:18:06.626278');
INSERT INTO "django_admin_log" VALUES (25,'20','Subscribe object (20)',3,'',11,1,'2023-01-09 20:18:06.630671');
INSERT INTO "django_admin_log" VALUES (26,'19','Subscribe object (19)',3,'',11,1,'2023-01-09 20:18:06.635058');
INSERT INTO "django_admin_log" VALUES (27,'18','Subscribe object (18)',3,'',11,1,'2023-01-09 20:18:06.638112');
INSERT INTO "django_admin_log" VALUES (28,'17','Subscribe object (17)',3,'',11,1,'2023-01-09 20:18:06.643615');
INSERT INTO "django_admin_log" VALUES (29,'16','Subscribe object (16)',3,'',11,1,'2023-01-09 20:18:06.648465');
INSERT INTO "django_admin_log" VALUES (30,'15','Subscribe object (15)',3,'',11,1,'2023-01-09 20:18:06.654263');
INSERT INTO "django_admin_log" VALUES (31,'14','Subscribe object (14)',3,'',11,1,'2023-01-09 20:18:06.659219');
INSERT INTO "django_admin_log" VALUES (32,'13','Subscribe object (13)',3,'',11,1,'2023-01-09 20:18:06.668386');
INSERT INTO "django_admin_log" VALUES (33,'12','Subscribe object (12)',3,'',11,1,'2023-01-09 20:18:06.672485');
INSERT INTO "django_admin_log" VALUES (34,'11','Subscribe object (11)',3,'',11,1,'2023-01-09 20:18:06.678105');
INSERT INTO "django_admin_log" VALUES (35,'10','Subscribe object (10)',3,'',11,1,'2023-01-09 20:18:06.683971');
INSERT INTO "django_admin_log" VALUES (36,'9','Subscribe object (9)',3,'',11,1,'2023-01-09 20:18:06.688548');
INSERT INTO "django_admin_log" VALUES (37,'8','Subscribe object (8)',3,'',11,1,'2023-01-09 20:18:06.695493');
INSERT INTO "django_admin_log" VALUES (38,'7','Subscribe object (7)',3,'',11,1,'2023-01-09 20:18:06.706345');
INSERT INTO "django_admin_log" VALUES (39,'6','Subscribe object (6)',3,'',11,1,'2023-01-09 20:18:06.711405');
INSERT INTO "django_admin_log" VALUES (40,'5','Subscribe object (5)',3,'',11,1,'2023-01-09 20:18:06.719331');
INSERT INTO "django_admin_log" VALUES (41,'4','Subscribe object (4)',3,'',11,1,'2023-01-09 20:18:06.724847');
INSERT INTO "django_admin_log" VALUES (42,'3','Subscribe object (3)',3,'',11,1,'2023-01-09 20:18:06.734865');
INSERT INTO "django_admin_log" VALUES (43,'2','Subscribe object (2)',3,'',11,1,'2023-01-09 20:18:06.741421');
INSERT INTO "django_admin_log" VALUES (44,'1','Subscribe object (1)',3,'',11,1,'2023-01-09 20:18:06.752555');
INSERT INTO "django_admin_log" VALUES (45,'15','Monika''s Software Developer',3,'',7,1,'2023-01-09 20:18:38.713644');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'app','jobpost');
INSERT INTO "django_content_type" VALUES (8,'app','location');
INSERT INTO "django_content_type" VALUES (9,'app','author');
INSERT INTO "django_content_type" VALUES (10,'app','skills');
INSERT INTO "django_content_type" VALUES (11,'subscribe','subscribe');
INSERT INTO "django_content_type" VALUES (12,'upload','uploads');
INSERT INTO "django_content_type" VALUES (13,'upload','uploadfiles');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_jobpost','Can add job post');
INSERT INTO "auth_permission" VALUES (26,7,'change_jobpost','Can change job post');
INSERT INTO "auth_permission" VALUES (27,7,'delete_jobpost','Can delete job post');
INSERT INTO "auth_permission" VALUES (28,7,'view_jobpost','Can view job post');
INSERT INTO "auth_permission" VALUES (29,8,'add_location','Can add location');
INSERT INTO "auth_permission" VALUES (30,8,'change_location','Can change location');
INSERT INTO "auth_permission" VALUES (31,8,'delete_location','Can delete location');
INSERT INTO "auth_permission" VALUES (32,8,'view_location','Can view location');
INSERT INTO "auth_permission" VALUES (33,9,'add_author','Can add author');
INSERT INTO "auth_permission" VALUES (34,9,'change_author','Can change author');
INSERT INTO "auth_permission" VALUES (35,9,'delete_author','Can delete author');
INSERT INTO "auth_permission" VALUES (36,9,'view_author','Can view author');
INSERT INTO "auth_permission" VALUES (37,10,'add_skills','Can add skills');
INSERT INTO "auth_permission" VALUES (38,10,'change_skills','Can change skills');
INSERT INTO "auth_permission" VALUES (39,10,'delete_skills','Can delete skills');
INSERT INTO "auth_permission" VALUES (40,10,'view_skills','Can view skills');
INSERT INTO "auth_permission" VALUES (41,11,'add_subscribe','Can add subscribe');
INSERT INTO "auth_permission" VALUES (42,11,'change_subscribe','Can change subscribe');
INSERT INTO "auth_permission" VALUES (43,11,'delete_subscribe','Can delete subscribe');
INSERT INTO "auth_permission" VALUES (44,11,'view_subscribe','Can view subscribe');
INSERT INTO "auth_permission" VALUES (45,12,'add_uploads','Can add uploads');
INSERT INTO "auth_permission" VALUES (46,12,'change_uploads','Can change uploads');
INSERT INTO "auth_permission" VALUES (47,12,'delete_uploads','Can delete uploads');
INSERT INTO "auth_permission" VALUES (48,12,'view_uploads','Can view uploads');
INSERT INTO "auth_permission" VALUES (49,13,'add_uploadfiles','Can add upload files');
INSERT INTO "auth_permission" VALUES (50,13,'change_uploadfiles','Can change upload files');
INSERT INTO "auth_permission" VALUES (51,13,'delete_uploadfiles','Can delete upload files');
INSERT INTO "auth_permission" VALUES (52,13,'view_uploadfiles','Can view upload files');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$390000$yFRhktOqH20AGQbua9X4mx$r2l+OVzzg2wlYcHziK/qnimL6TYm6L09d9s4D2ifk2M=','2022-12-28 12:35:56.450362',1,'chad','','',1,1,'2022-12-12 11:39:14.638241','');
INSERT INTO "django_session" VALUES ('vevigazijc0t4gicdy7l2q6qga6sg6do','.eJxVjMsOwiAURP-FtSFCCRdcuvcbyH1QqRpISrsy_rtt0oVuZjHnzLxVwnUpae15TpOoizLq9NsR8jPXHcgD671pbnWZJ9K7og_a9a1Jfl0P9--gYC_bmgkce2-DAQdhPFMYxNqcQwBPEE2MnIOwAyQWQIloR4vot_CDc4P6fAHgNDgZ:1p4hk4:LqYtRmsmXnneaevGEKqpVrd4tu_B2J73BQDR6HE7x0s','2022-12-26 12:17:08.186093');
INSERT INTO "django_session" VALUES ('7pu3q5ab2ohih66hqd20b6ufx3uaasbw','.eJxVjMsOwiAURP-FtSFCCRdcuvcbyH1QqRpISrsy_rtt0oVuZjHnzLxVwnUpae15TpOoizLq9NsR8jPXHcgD671pbnWZJ9K7og_a9a1Jfl0P9--gYC_bmgkce2-DAQdhPFMYxNqcQwBPEE2MnIOwAyQWQIloR4vot_CDc4P6fAHgNDgZ:1pAVf2:Rlf4-mPnuAdyX90IQVwW13vOFMxtL4hCvIlOXEWoSqg','2023-01-11 12:35:56.460702');
INSERT INTO "app_location" VALUES (1,'Port St','New York','NY','USA',1000);
INSERT INTO "app_location" VALUES (2,'Headfield Road','Dewsbury','West Yorks','United Kingdom',129);
INSERT INTO "app_location" VALUES (3,'Bell Street','Coburg','VIC','Australia',3056);
INSERT INTO "app_location" VALUES (4,'Wilmington Crescent','Willetton','WA','Australia',8400);
INSERT INTO "app_location" VALUES (5,'Clarendon Street','Coburg','VIC','Australia',3056);
INSERT INTO "app_author" VALUES (1,'Jawad','OpenAI','Hiring Manager');
INSERT INTO "app_author" VALUES (2,'Kate','OpenAI','Hiring Manager');
INSERT INTO "app_author" VALUES (3,'Monika','Monika LLc','Head');
INSERT INTO "app_skills" VALUES (1,'Django');
INSERT INTO "app_skills" VALUES (3,'AWS');
INSERT INTO "upload_uploads" VALUES (1,'','');
INSERT INTO "upload_uploads" VALUES (2,'','');
INSERT INTO "upload_uploads" VALUES (3,'','');
INSERT INTO "upload_uploads" VALUES (4,'','');
INSERT INTO "upload_uploads" VALUES (5,'','');
INSERT INTO "upload_uploads" VALUES (6,'','');
INSERT INTO "upload_uploads" VALUES (7,'','');
INSERT INTO "upload_uploads" VALUES (8,'images/people-4681375_1920.jpg','Superman in Gotham');
INSERT INTO "upload_uploads" VALUES (9,'images/email_icon.png','Email icon');
INSERT INTO "upload_uploads" VALUES (10,'images/people-4681375_1920_FWFRlVj.jpg','Superman');
INSERT INTO "upload_uploads" VALUES (11,'images/people-4681375_1920_y9bvSeh.jpg','Superman');
INSERT INTO "upload_uploadfiles" VALUES (1,'files/test_9ALSM8f.docx','test file');
INSERT INTO "upload_uploadfiles" VALUES (2,'files/test_FAdVxra.docx','test file');
INSERT INTO "app_jobpost" VALUES (1,'First Job','2022-12-07 15:47:40.698813','Example',100,'first-job',1,2,'Full Time');
INSERT INTO "app_jobpost" VALUES (2,'Second Job Post','2022-12-07 15:51:33.404228','Example',1000,'second-job-post',2,2,'Full Time');
INSERT INTO "app_jobpost" VALUES (3,'3rd Job','2022-12-07 16:19:35.704431','Example',100345,'3rd-job',NULL,2,'Full Time');
INSERT INTO "app_jobpost" VALUES (4,'Fourth Job Post','2022-12-08 10:55:21.706003','Example',1000,'fourth-job-post',NULL,2,'Full Time');
INSERT INTO "app_jobpost" VALUES (6,'Fifth Job Post','2022-12-09 13:04:08.023697','Example5',3000,'fifth-job-post',NULL,NULL,'Full Time');
INSERT INTO "app_jobpost" VALUES (7,'Sixth Job Post','2022-12-09 13:14:37.183778','Example=6',3000,'sixth-job-post',NULL,1,'Full Time');
INSERT INTO "app_jobpost" VALUES (10,'Seventh Job Post','2022-12-12 12:45:56.159584','Example 7',15000,'seventh-job-post',NULL,NULL,'Full Time');
INSERT INTO "app_jobpost" VALUES (11,'Eigth Job Post','2022-12-14 11:28:06.450163','Eighth Example',1500,'eigth-job-post',NULL,1,'Full Time');
INSERT INTO "app_jobpost" VALUES (12,'Ninth Job Post','2022-12-15 08:51:19.824818','Example nine',2000,'ninth-job-post',NULL,2,'Full Time');
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE UNIQUE INDEX IF NOT EXISTS "app_jobpost_skills_jobpost_id_skills_id_46859371_uniq" ON "app_jobpost_skills" (
	"jobpost_id",
	"skills_id"
);
CREATE INDEX IF NOT EXISTS "app_jobpost_skills_jobpost_id_9f7a3947" ON "app_jobpost_skills" (
	"jobpost_id"
);
CREATE INDEX IF NOT EXISTS "app_jobpost_skills_skills_id_4779e52e" ON "app_jobpost_skills" (
	"skills_id"
);
CREATE INDEX IF NOT EXISTS "app_jobpost_author_id_77f4f482" ON "app_jobpost" (
	"author_id"
);
COMMIT;
