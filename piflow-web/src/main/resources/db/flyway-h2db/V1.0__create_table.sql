CREATE TABLE IF NOT EXISTS "FLOW"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) NOT NULL COMMENT 'Create user',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "LAST_UPDATE_DTTM" DATETIME NOT NULL COMMENT 'Last update date time',
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL COMMENT 'Last update user',
    "VERSION" BIGINT COMMENT 'Version',
    "DESCRIPTION" TEXT COMMENT 'Eescription',
    "DRIVER_MEMORY" VARCHAR(255) COMMENT 'DriverMemory',
    "EXECUTOR_CORES" VARCHAR(255) COMMENT 'ExecutorCores',
    "EXECUTOR_MEMORY" VARCHAR(255) COMMENT 'ExecutorMemory',
    "EXECUTOR_NUMBER" VARCHAR(255) COMMENT 'ExecutorNumber',
    "IS_EXAMPLE" BIT COMMENT 'Is example',
    "NAME" VARCHAR(255) COMMENT 'Flow name',
    "UUID" VARCHAR(255) COMMENT 'Flow uuid'
);

CREATE TABLE IF NOT EXISTS "FLOW_PATH"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) NOT NULL COMMENT 'Create user',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "LAST_UPDATE_DTTM" DATETIME NOT NULL COMMENT 'Last update date time',
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL COMMENT 'Last update user',
    "VERSION" BIGINT COMMENT 'Version',
    "LINE_FROM" VARCHAR(255) COMMENT 'Line from',
    "LINE_INPORT" VARCHAR(255) COMMENT 'Line in port',
    "LINE_OUTPORT" VARCHAR(255) COMMENT 'Line out port',
    "PAGE_ID" VARCHAR(255) COMMENT 'Page id',
    "LINE_TO" VARCHAR(255) COMMENT 'Line to',
    "FK_FLOW_ID" VARCHAR(40) COMMENT 'Foreign key flow id'
);
ALTER TABLE `FLOW_PATH` ADD CONSTRAINT `FK33rp96r4290eonsirbwrp8h0f` FOREIGN KEY (`FK_FLOW_ID`) REFERENCES `FLOW` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "FLOW_PROCESS"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) NOT NULL COMMENT 'Create user',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "LAST_UPDATE_DTTM" DATETIME NOT NULL COMMENT 'Last update date time',
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL COMMENT 'Last update user',
    "VERSION" BIGINT COMMENT 'Version',
    "APP_ID" VARCHAR(255) COMMENT 'The id returned when calling runProcess',
    "DESCRIPTION" TEXT COMMENT 'Description',
    "DRIVER_MEMORY" VARCHAR(255) COMMENT 'Driver memory',
    "END_TIME" DATETIME COMMENT 'End time of the process',
    "EXECUTOR_CORES" VARCHAR(255) COMMENT 'Executor_cores',
    "EXECUTOR_MEMORY" VARCHAR(255) COMMENT 'Executor memory',
    "EXECUTOR_NUMBER" VARCHAR(255) COMMENT 'Executor number',
    "FLOW_ID" VARCHAR(255) COMMENT 'Flow id',
    "NAME" VARCHAR(255) COMMENT 'Process name',
    "PARENT_PROCESS_ID" VARCHAR(255) COMMENT 'Third parentProcessId',
    "PROCESS_ID" VARCHAR(255) COMMENT 'Third processId',
    "PROGRESS" VARCHAR(255) COMMENT 'Process progress',
    "START_TIME" DATETIME COMMENT 'Process startup time',
    "STATE" VARCHAR(255) COMMENT 'Process status',
    "VIEW_XML" TEXT COMMENT 'Process view xml string'
);

CREATE TABLE IF NOT EXISTS "FLOW_PROCESS_PATH"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) NOT NULL COMMENT 'Create user',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "LAST_UPDATE_DTTM" DATETIME NOT NULL COMMENT 'Last update date time',
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL COMMENT 'Last update user',
    "VERSION" BIGINT COMMENT 'Version',
    "LINE_FROM" VARCHAR(255) COMMENT 'Line from',
    "LINE_INPORT" VARCHAR(255) COMMENT 'Line in port',
    "LINE_OUTPORT" VARCHAR(255) COMMENT 'Line out port',
    "PAGE_ID" VARCHAR(255) COMMENT 'Page id',
    "LINE_TO" VARCHAR(255) COMMENT 'Line to',
    "FK_FLOW_PROCESS_ID" VARCHAR(40) COMMENT 'Foreign key flow process id'
);
ALTER TABLE `FLOW_PROCESS_PATH` ADD CONSTRAINT `FKad4n0sl8j977awtec5beyrphy` FOREIGN KEY (`FK_FLOW_PROCESS_ID`) REFERENCES `FLOW_PROCESS` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "FLOW_PROCESS_STOP"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) NOT NULL COMMENT 'Create user',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "LAST_UPDATE_DTTM" DATETIME NOT NULL COMMENT 'Last update date time',
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL COMMENT 'Last update user',
    "VERSION" BIGINT COMMENT 'Version',
    "BUNDLE" VARCHAR(255) COMMENT 'Bundle',
    "DESCRIPTION" TEXT COMMENT 'Description',
    "END_TIME" DATETIME COMMENT 'End time',
    "GROUPS" VARCHAR(255) COMMENT 'Groups',
    "IN_PORT_TYPE" VARCHAR(255) COMMENT 'In port type',
    "INPORTS" VARCHAR(255) COMMENT 'In ports',
    "NAME" VARCHAR(255) COMMENT 'Name',
    "OUT_PORT_TYPE" VARCHAR(255) COMMENT 'Out port type',
    "OUTPORTS" VARCHAR(255) COMMENT 'Out ports',
    "OWNER" VARCHAR(255) COMMENT 'Owner',
    "PAGE_ID" VARCHAR(255) COMMENT 'Page id',
    "START_TIME" DATETIME COMMENT 'Start time',
    "STATE" VARCHAR(255) COMMENT 'ProcessStop status',
    "FK_FLOW_PROCESS_ID" VARCHAR(40) COMMENT 'Foreign key flow process id'
);
ALTER TABLE `FLOW_PROCESS_STOP` ADD CONSTRAINT `FK6rvjgxm3smnh3jjjnxnqiwl1p` FOREIGN KEY (`FK_FLOW_PROCESS_ID`) REFERENCES `FLOW_PROCESS` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "FLOW_PROCESS_STOP_PROPERTY"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) NOT NULL COMMENT 'Create user',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "LAST_UPDATE_DTTM" DATETIME NOT NULL COMMENT 'Last update date time',
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL COMMENT 'Last update user',
    "VERSION" BIGINT COMMENT 'Version',
    "ALLOWABLE_VALUES" VARCHAR(255) COMMENT 'Allowable values',
    "CUSTOM_VALUE" TEXT COMMENT 'Custom value',
    "DESCRIPTION" TEXT COMMENT 'Description',
    "DISPLAY_NAME" TEXT COMMENT 'Display name',
    "NAME" TEXT COMMENT 'Description',
    "PROPERTY_REQUIRED" BIT COMMENT 'Property required',
    "PROPERTY_SENSITIVE" BIT COMMENT 'Property sensitive',
    "FK_FLOW_PROCESS_STOP_ID" VARCHAR(40) COMMENT 'Foreign key flowProcessStop id'
);
ALTER TABLE `FLOW_PROCESS_STOP_PROPERTY` ADD CONSTRAINT `FK6pqbouerl5dg97la1yqygj5rp` FOREIGN KEY (`FK_FLOW_PROCESS_STOP_ID`) REFERENCES `FLOW_PROCESS_STOP` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "FLOW_SOTPS_GROUPS"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) NOT NULL COMMENT 'Create user',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "LAST_UPDATE_DTTM" DATETIME NOT NULL COMMENT 'Last update date time',
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL COMMENT 'Last update user',
    "VERSION" BIGINT COMMENT 'Version',
    "GROUP_NAME" VARCHAR(255) COMMENT 'Group name'
);

CREATE TABLE IF NOT EXISTS "FLOW_STOPS"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) NOT NULL COMMENT 'Create user',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "LAST_UPDATE_DTTM" DATETIME NOT NULL COMMENT 'Last update date time',
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL COMMENT 'Last update user',
    "VERSION" BIGINT COMMENT 'Version',
    "BUNDLE" VARCHAR(255) COMMENT 'Bundle',
    "DESCRIPTION" TEXT COMMENT 'Description',
    "GROUPS" VARCHAR(255) COMMENT 'Groups',
    "IN_PORT_TYPE" VARCHAR(255) COMMENT 'In port type',
    "INPORTS" VARCHAR(255) COMMENT 'In ports',
    "IS_CHECKPOINT" BIT COMMENT 'Is checkpoint',
    "NAME" VARCHAR(255) COMMENT 'name',
    "OUT_PORT_TYPE" VARCHAR(255) COMMENT 'Out port type',
    "OUTPORTS" VARCHAR(255) COMMENT 'Out ports',
    "OWNER" VARCHAR(255) COMMENT 'Owner',
    "PAGE_ID" VARCHAR(255) COMMENT 'Page id',
    "START_TIME" DATETIME COMMENT 'Start time',
    "STATE" VARCHAR(255) COMMENT 'FlowStop state',
    "STOP_TIME" DATETIME COMMENT 'Stop time',
    "FK_FLOW_ID" VARCHAR(40) COMMENT 'Foreign key flow id'
);
ALTER TABLE `FLOW_STOPS` ADD CONSTRAINT `FK11mku3yphyjswbtwj9df79k44` FOREIGN KEY (`FK_FLOW_ID`) REFERENCES `FLOW` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "FLOW_STOPS_PROPERTY"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) NOT NULL COMMENT 'Create user',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "LAST_UPDATE_DTTM" DATETIME NOT NULL COMMENT 'Last update date time',
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL COMMENT 'Last update user',
    "VERSION" BIGINT COMMENT 'Version',
    "ALLOWABLE_VALUES" TEXT COMMENT 'Allowable values',
    "CUSTOM_VALUE" TEXT COMMENT 'Custom value',
    "DESCRIPTION" TEXT COMMENT 'Description',
    "DISPLAY_NAME" TEXT COMMENT 'Display name',
    "IS_SELECT" BIT COMMENT 'Is select',
    "NAME" VARCHAR(255) COMMENT 'name',
    "PROPERTY_REQUIRED" BIT COMMENT 'Property required',
    "PROPERTY_SENSITIVE" BIT COMMENT 'Property sensitive',
    "FK_STOPS_ID" VARCHAR(40) COMMENT 'Foreign key stops id'
);
ALTER TABLE `FLOW_STOPS_PROPERTY` ADD CONSTRAINT `FKsjcg9klyumklhkpl8408v6uuq` FOREIGN KEY (`FK_STOPS_ID`) REFERENCES `FLOW_STOPS` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "FLOW_STOPS_TEMPLATE"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) NOT NULL COMMENT 'Create user',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "LAST_UPDATE_DTTM" DATETIME NOT NULL COMMENT 'Last update date time',
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL COMMENT 'Last update user',
    "VERSION" BIGINT COMMENT 'Version',
    "BUNDLE" VARCHAR(255) COMMENT 'Bundle',
    "DESCRIPTION" TEXT COMMENT 'description',
    "GROUPS" VARCHAR(255) COMMENT 'Groups',
    "IN_PORT_TYPE" VARCHAR(255) COMMENT 'In port type',
    "INPORTS" VARCHAR(255) COMMENT 'In ports',
    "NAME" VARCHAR(255) COMMENT 'name',
    "OUT_PORT_TYPE" VARCHAR(255) COMMENT 'Out port type',
    "OUTPORTS" VARCHAR(255) COMMENT 'Out ports',
    "OWNER" VARCHAR(255) COMMENT 'Owner',
    "STOP_GROUP" VARCHAR(255) COMMENT 'stopGroup'
);

CREATE TABLE IF NOT EXISTS "FLOW_STOPS_PROPERTY_TEMPLATE"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) NOT NULL COMMENT 'Create user',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "LAST_UPDATE_DTTM" DATETIME NOT NULL COMMENT 'Last update date time',
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL COMMENT 'Last update user',
    "VERSION" BIGINT COMMENT 'Version',
    "ALLOWABLE_VALUES" TEXT COMMENT 'Default value',
    "DEFAULT_VALUE" TEXT COMMENT 'Default value',
    "DESCRIPTION" TEXT COMMENT 'Description',
    "DISPLAY_NAME" TEXT COMMENT 'Display name',
    "NAME" VARCHAR(255) COMMENT 'Name',
    "PROPERTY_REQUIRED" BIT COMMENT 'Property required',
    "PROPERTY_SENSITIVE" BIT COMMENT 'Property sensitive',
    "FK_STOPS_ID" VARCHAR(255) COMMENT 'Foreign key stops id'
);
ALTER TABLE `FLOW_STOPS_PROPERTY_TEMPLATE` ADD CONSTRAINT `FKhtnjkpgjkx21r2qf4r3q3mjr9` FOREIGN KEY (`FK_STOPS_ID`) REFERENCES `FLOW_STOPS_TEMPLATE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "FLOW_TEMPLATE"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) NOT NULL COMMENT 'Create user',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "LAST_UPDATE_DTTM" DATETIME NOT NULL COMMENT 'Last update date time',
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL COMMENT 'Last update user',
    "VERSION" BIGINT COMMENT 'Version',
    "DESCRIPTION" VARCHAR(1024) COMMENT 'description',
    "NAME" VARCHAR(255) COMMENT 'Name',
    "PATH" VARCHAR(255) COMMENT 'Path',
    "VALUE" LONGTEXT COMMENT 'Value',
    "FK_FLOW_ID" VARCHAR(40) COMMENT 'Foreign key flow id'
);
ALTER TABLE `FLOW_TEMPLATE` ADD CONSTRAINT `FKkcg573sjiknyhppuc0q62a0kj` FOREIGN KEY (`FK_FLOW_ID`) REFERENCES `FLOW` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "ASSOCIATION_GROUPS_STOPS_TEMPLATE"(
    "GROUPS_ID" VARCHAR(40) NOT NULL COMMENT 'Group primary key id',
    "STOPS_TEMPLATE_ID" VARCHAR(40) NOT NULL COMMENT 'stops_template primary key id'
);
ALTER TABLE `ASSOCIATION_GROUPS_STOPS_TEMPLATE` ADD CONSTRAINT `FK5ceurc1karlogl9ppecmkcp7e` FOREIGN KEY (`GROUPS_ID`) REFERENCES `FLOW_SOTPS_GROUPS` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `ASSOCIATION_GROUPS_STOPS_TEMPLATE` ADD CONSTRAINT `FKqwv1iytgkhhgnjdvhqbskncf4` FOREIGN KEY (`STOPS_TEMPLATE_ID`) REFERENCES `FLOW_STOPS_TEMPLATE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "MX_GRAPH_MODEL"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) NOT NULL COMMENT 'Create user',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "LAST_UPDATE_DTTM" DATETIME NOT NULL COMMENT 'Last update date time',
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL COMMENT 'Last update user',
    "VERSION" BIGINT COMMENT 'Version',
    "MX_ARROWS" VARCHAR(255) COMMENT 'mx_arrows',
    "MX_BACKGROUND" VARCHAR(255) COMMENT 'mx_background',
    "MX_CONNECT" VARCHAR(255) COMMENT 'mx_connect',
    "MX_DX" VARCHAR(255) COMMENT 'mx_dx',
    "MX_DY" VARCHAR(255) COMMENT 'mx_dy',
    "MX_FOLD" VARCHAR(255) COMMENT 'mx_fold',
    "MX_GRID" VARCHAR(255) COMMENT 'mx_grid',
    "MX_GRIDSIZE" VARCHAR(255) COMMENT 'mx_gridsize',
    "MX_GUIDES" VARCHAR(255) COMMENT 'mx_guides',
    "MX_PAGE" VARCHAR(255) COMMENT 'mx_page',
    "MX_PAGEHEIGHT" VARCHAR(255) COMMENT 'mx_pageheight',
    "MX_PAGESCALE" VARCHAR(255) COMMENT 'mx_pagescale',
    "MX_PAGEWIDTH" VARCHAR(255) COMMENT 'mx_pagewidth',
    "MX_TOOLTIPS" VARCHAR(255) COMMENT 'mx_tooltips',
    "FK_FLOW_ID" VARCHAR(40) COMMENT 'Foreign key flow id'
);
ALTER TABLE `MX_GRAPH_MODEL` ADD CONSTRAINT `FKktpy5kv5fgya1gn012g7395l9` FOREIGN KEY (`FK_FLOW_ID`) REFERENCES `FLOW` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "MX_CELL"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) NOT NULL COMMENT 'Create user',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "LAST_UPDATE_DTTM" DATETIME NOT NULL COMMENT 'Last update date time',
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL COMMENT 'Last update user',
    "VERSION" BIGINT COMMENT 'Version',
    "MX_EDGE" VARCHAR(255) COMMENT 'mx_edge',
    "MX_PAGEID" VARCHAR(255) COMMENT 'mx_pageid',
    "MX_PARENT" VARCHAR(255) COMMENT 'mx_parent',
    "MX_SOURCE" VARCHAR(255) COMMENT 'mx_source',
    "MX_STYLE" VARCHAR(255) COMMENT 'mx_style',
    "MX_TARGET" VARCHAR(255) COMMENT 'mx_target',
    "MX_VALUE" TEXT COMMENT 'mx_value',
    "MX_VERTEX" VARCHAR(255) COMMENT 'mx_vertex',
    "FK_MX_GRAPH_ID" VARCHAR(40) COMMENT 'Foreign key fk_mx_graph_id'
);
ALTER TABLE `MX_CELL` ADD CONSTRAINT `FK4s2gnt8t7e5ok1v7r3v99pji5` FOREIGN KEY (`FK_MX_GRAPH_ID`) REFERENCES `MX_GRAPH_MODEL` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "MX_GEOMETRY"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) NOT NULL COMMENT 'Create user',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "LAST_UPDATE_DTTM" DATETIME NOT NULL COMMENT 'Last update date time',
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL COMMENT 'Last update user',
    "VERSION" BIGINT COMMENT 'Version',
    "MX_AS" VARCHAR(255) COMMENT 'mx_as',
    "MX_HEIGHT" VARCHAR(255) COMMENT 'mx_height',
    "MX_RELATIVE" VARCHAR(255) COMMENT 'mx_relative',
    "MX_WIDTH" VARCHAR(255) COMMENT 'mx_width',
    "MX_X" VARCHAR(255) COMMENT 'mx_x',
    "MX_Y" VARCHAR(255) COMMENT 'mx_y',
    "FK_MX_CELL_ID" VARCHAR(40) COMMENT 'Foreign key fk_mx_cell_id'
);
ALTER TABLE `MX_GEOMETRY` ADD CONSTRAINT `FK6elkg2vbxxjrun0qaqaajwgfu` FOREIGN KEY (`FK_MX_CELL_ID`) REFERENCES `MX_CELL` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "STOPS_TEMPLATE"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "BUNDLE" VARCHAR(255) COMMENT 'Bundle',
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) COMMENT 'Create user',
    "DESCRIPTION" VARCHAR(255) COMMENT 'Description',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "GROUPS" VARCHAR(255) COMMENT 'Groups',
    "IN_PORT_TYPE" VARCHAR(255) COMMENT 'In port type',
    "INPORTS" VARCHAR(255) COMMENT 'In ports',
    "IS_CHECKPOINT" BIT COMMENT 'Is checkpoint',
    "NAME" VARCHAR(255) COMMENT 'Name',
    "OUT_PORT_TYPE" VARCHAR(255) COMMENT 'Out port type',
    "OUTPORTS" VARCHAR(255) COMMENT 'Out ports',
    "OWNER" VARCHAR(255) COMMENT 'Owner',
    "PAGE_ID" VARCHAR(255) COMMENT 'Page id',
    "VERSION" BIGINT COMMENT 'Version',
    "FK_TEMPLATE_ID" VARCHAR(40) COMMENT 'Foreign key fk_template_id'
);
ALTER TABLE `STOPS_TEMPLATE` ADD CONSTRAINT `FKn0wu7i6frf0xp2iypda50vlmh` FOREIGN KEY (`FK_TEMPLATE_ID`) REFERENCES `FLOW_TEMPLATE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "PROPERTY_TEMPLATE"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "ALLOWABLE_VALUES" VARCHAR(255) COMMENT 'Allowable values',
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) COMMENT 'Create user',
    "CUSTOM_VALUE" VARCHAR(255) COMMENT 'Custom value',
    "DESCRIPTION" VARCHAR(1024) COMMENT 'Description',
    "DISPLAY_NAME" VARCHAR(255) COMMENT 'Display name',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "IS_SELECT" BIT COMMENT 'Is select',
    "NAME" VARCHAR(255) COMMENT 'Name',
    "PROPERTY_REQUIRED" BIT COMMENT 'Property required',
    "PROPERTY_SENSITIVE" BIT COMMENT 'Property sensitive',
    "VERSION" BIGINT COMMENT 'Version',
    "FK_STOPS_ID" VARCHAR(40) COMMENT 'Foreign key stops id'
);
ALTER TABLE `PROPERTY_TEMPLATE` ADD CONSTRAINT `FK35p1h6w0dsmjc33eavnbuiys3` FOREIGN KEY (`FK_STOPS_ID`) REFERENCES `STOPS_TEMPLATE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "SYS_USER"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL COMMENT 'Create date time',
    "CRT_USER" VARCHAR(255) NOT NULL COMMENT 'Create user',
    "ENABLE_FLAG" BIT NOT NULL COMMENT 'Enable flag',
    "LAST_UPDATE_DTTM" DATETIME NOT NULL COMMENT 'Last update date time',
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL COMMENT 'Last update user',
    "VERSION" BIGINT COMMENT 'Version',
    "AGE" INTEGER COMMENT 'Age',
    "NAME" VARCHAR(255) COMMENT 'Name',
    "PASSWORD" VARCHAR(255) COMMENT 'Password',
    "SEX" VARCHAR(255) COMMENT 'Sex',
    "USERNAME" VARCHAR(255) COMMENT 'Username'
);
CREATE TABLE IF NOT EXISTS "SYS_ROLE"(
    "ID" INTEGER PRIMARY KEY NOT NULL,
    "ROLE" VARCHAR(255) COMMENT 'role',
    "FK_SYS_USER_ID" VARCHAR(40) COMMENT 'Foreign key fk_sys_user_id'
);
ALTER TABLE `SYS_ROLE` ADD CONSTRAINT `FK48hlg5qgnejc4xropo99whsyt` FOREIGN KEY (`FK_SYS_USER_ID`) REFERENCES `SYS_USER` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "STATISTICS" (
    "ID" VARCHAR(40) NOT NULL,
    "LOGIN_IP" VARCHAR(255) COMMENT 'login_ip',
    "LOGIN_TIME" DATETIME COMMENT 'login_time',
    "LOGIN_USER" VARCHAR(255) COMMENT 'login_user'
);