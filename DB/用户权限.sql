CREATE TABLE nbers_access
    (
      role_id SMALLINT NOT NULL ,
      node_id SMALLINT NOT NULL ,
      level SMALLINT NOT NULL ,
      pid SMALLINT NOT NULL ,
      module NVARCHAR(50) DEFAULT NULL
    )

--
-- 转存表中的数据 nbers_access
--

INSERT  INTO nbers_access
        ( role_id, node_id, level, pid, module )
VALUES  ( 2, 1, 1, 0, NULL ),
        ( 2, 40, 2, 1, NULL ),
        ( 2, 30, 2, 1, NULL ),
        ( 3, 1, 1, 0, NULL ),
        ( 2, 69, 2, 1, NULL ),
        ( 2, 50, 3, 40, NULL ),
        ( 3, 50, 3, 40, NULL ),
        ( 1, 50, 3, 40, NULL ),
        ( 3, 7, 2, 1, NULL ),
        ( 3, 39, 3, 30, NULL ),
        ( 2, 39, 3, 30, NULL ),
        ( 2, 49, 3, 30, NULL ),
        ( 4, 1, 1, 0, NULL ),
        ( 4, 2, 2, 1, NULL ),
        ( 4, 3, 2, 1, NULL ),
        ( 4, 4, 2, 1, NULL ),
        ( 4, 5, 2, 1, NULL ),
        ( 4, 6, 2, 1, NULL ),
        ( 4, 7, 2, 1, NULL ),
        ( 4, 11, 2, 1, NULL ),
        ( 5, 25, 1, 0, NULL ),
        ( 5, 51, 2, 25, NULL ),
        ( 1, 1, 1, 0, NULL ),
        ( 1, 39, 3, 30, NULL ),
        ( 1, 69, 2, 1, NULL ),
        ( 1, 30, 2, 1, NULL ),
        ( 1, 40, 2, 1, NULL ),
        ( 1, 49, 3, 30, NULL ),
        ( 3, 69, 2, 1, NULL ),
        ( 3, 30, 2, 1, NULL ),
        ( 3, 40, 2, 1, NULL ),
        ( 1, 37, 3, 30, NULL ),
        ( 1, 36, 3, 30, NULL ),
        ( 1, 35, 3, 30, NULL ),
        ( 1, 34, 3, 30, NULL ),
        ( 1, 33, 3, 30, NULL ),
        ( 1, 32, 3, 30, NULL ),
        ( 1, 31, 3, 30, NULL ),
        ( 2, 32, 3, 30, NULL ),
        ( 2, 31, 3, 30, NULL ),
        ( 7, 1, 1, 0, NULL ),
        ( 7, 30, 2, 1, NULL ),
        ( 7, 40, 2, 1, NULL ),
        ( 7, 69, 2, 1, NULL ),
        ( 7, 50, 3, 40, NULL ),
        ( 7, 39, 3, 30, NULL ),
        ( 7, 49, 3, 30, NULL );

CREATE TABLE nbers_form
    (
      id SMALLINT NOT NULL
                  IDENTITY(0, 1) ,
      title NVARCHAR(255) NOT NULL ,
      content NVARCHAR(255) NOT NULL ,
      create_time TIMESTAMP NOT NULL ,
      status TINYINT NOT NULL ,
      PRIMARY KEY ( id )
    ) 


CREATE TABLE nbers_group
    (
      id SMALLINT NOT NULL
                  IDENTITY(0, 1) ,
      name NVARCHAR(25) NOT NULL ,
      title NVARCHAR(50) NOT NULL ,
      create_time INT NOT NULL ,
      update_time INT NOT NULL
                      DEFAULT '0' ,
      status TINYINT NOT NULL
                     DEFAULT '0' ,
      sort TINYINT NOT NULL
                   DEFAULT '0' ,
      show TINYINT NOT NULL
                   DEFAULT '0' ,
      PRIMARY KEY ( id )
    ) 

--
-- 转存表中的数据 nbers_group
--
SET IDENTITY_INSERT  nbers_group ON
INSERT  INTO nbers_group
        ( id ,
          name ,
          title ,
          create_time ,
          update_time ,
          status ,
          sort ,
          show
        )
VALUES  ( 2 ,
          'App' ,
          '应用中心' ,
          1222841259 ,
          0 ,
          1 ,
          0 ,
          0
        );
SET IDENTITY_INSERT  nbers_group OFF
CREATE TABLE nbers_node
    (
      id TINYINT NOT NULL
                 IDENTITY(0, 1) ,
      name NVARCHAR(20) NOT NULL ,
      title NVARCHAR(50) DEFAULT NULL ,
      status TINYINT DEFAULT '0' ,
      remark NVARCHAR(255) DEFAULT NULL ,
      sort TINYINT DEFAULT NULL ,
      pid TINYINT NOT NULL ,
      level TINYINT NOT NULL ,
      type TINYINT NOT NULL
                   DEFAULT '0' ,
      group_id TINYINT DEFAULT '0'
    ) 
--
-- 转存表中的数据 nbers_node
--
SET  IDENTITY_INSERT nbers_node ON 
INSERT  INTO nbers_node
        ( id, name, title, status, remark, sort, pid, level, type, group_id )
VALUES  ( 49, 'read', '查看', 1, '', NULL, 30, 3, 0, 0 ),
        ( 40, 'Index', '默认模块', 1, '', 1, 1, 2, 0, 0 ),
        ( 39, 'index', '列表', 1, '', NULL, 30, 3, 0, 0 ),
        ( 37, 'resume', '恢复', 1, '', NULL, 30, 3, 0, 0 ),
        ( 36, 'forbid', '禁用', 1, '', NULL, 30, 3, 0, 0 ),
        ( 35, 'foreverdelete', '删除', 1, '', NULL, 30, 3, 0, 0 ),
        ( 34, 'update', '更新', 1, '', NULL, 30, 3, 0, 0 ),
        ( 33, 'edit', '编辑', 1, '', NULL, 30, 3, 0, 0 ),
        ( 32, 'insert', '写入', 1, '', NULL, 30, 3, 0, 0 ),
        ( 31, 'add', '新增', 1, '', NULL, 30, 3, 0, 0 ),
        ( 30, 'Public', '公共模块', 1, '', 2, 1, 2, 0, 0 ),
        ( 69, 'Form', '数据管理', 1, '', 1, 1, 2, 0, 2 ),
        ( 7, 'User', '后台用户', 1, '', 4, 1, 2, 0, 2 ),
        ( 6, 'Role', '角色管理', 1, '', 3, 1, 2, 0, 2 ),
        ( 2, 'Node', '节点管理', 1, '', 2, 1, 2, 0, 2 ),
        ( 1, 'App', 'Rbac后台管理', 1, '', NULL, 0, 1, 0, 0 ),
        ( 50, 'main', '空白首页', 1, '', NULL, 40, 3, 0, 0 );
SET  IDENTITY_INSERT nbers_node OFF
CREATE TABLE nbers_role
    (
      id TINYINT NOT NULL
                 IDENTITY(0, 1) ,
      name NVARCHAR(20) NOT NULL ,
      pid TINYINT DEFAULT NULL ,
      status TINYINT DEFAULT NULL ,
      remark NVARCHAR(255) DEFAULT NULL ,
      ename NVARCHAR(5) DEFAULT NULL ,
      create_time INT NOT NULL ,
      update_time INT NOT NULL
    ) 

--
-- 转存表中的数据 nbers_role
--
SET  IDENTITY_INSERT nbers_role ON 
INSERT  INTO nbers_role
        ( id, name, pid, status, remark, ename, create_time, update_time )
VALUES  ( 1, '领导组', 0, 1, '', '', 1208784792, 1254325558 ),
        ( 2, '员工组', 0, 1, '', '', 1215496283, 1254325566 ),
        ( 7, '演示组', 0, 1, '', NULL, 1254325787, 0 );
SET  IDENTITY_INSERT nbers_role ON 

CREATE TABLE nbers_role_user
    (
      role_id INT DEFAULT NULL ,
      user_id CHAR(32) DEFAULT NULL
    ) 

--
-- 转存表中的数据 nbers_role_user
--

INSERT  INTO nbers_role_user
        ( role_id, user_id )
VALUES  ( 4, '27' ),
        ( 4, '26' ),
        ( 4, '30' ),
        ( 5, '31' ),
        ( 3, '22' ),
        ( 3, '1' ),
        ( 1, '4' ),
        ( 2, '3' ),
        ( 7, '2' );
		
CREATE TABLE nbers_user
    (
      id TINYINT NOT NULL
                 IDENTITY(0, 1) ,
      account NVARCHAR(64) NOT NULL ,
      nickname NVARCHAR(50) NOT NULL ,
      password CHAR(32) NOT NULL ,
      bind_account VARCHAR(50) NOT NULL ,
      last_login_time INT DEFAULT '0' ,
      last_login_ip VARCHAR(40) DEFAULT NULL ,
      login_count INT DEFAULT '0' ,
      verify NVARCHAR(32) DEFAULT NULL ,
      email NVARCHAR(50) NOT NULL ,
      remark NVARCHAR(255) NOT NULL ,
      create_time INT NOT NULL ,
      update_time INT NOT NULL ,
      status TINYINT DEFAULT '0' ,
      type_id TINYINT DEFAULT '0' ,
      info TEXT NOT NULL ,
      PRIMARY KEY ( id )
    ) 

--
-- 转存表中的数据 nbers_user
--
SET IDENTITY_INSERT nbers_user ON 
INSERT  INTO nbers_user
        ( id, account, nickname, password, bind_account, last_login_time,
          last_login_ip, login_count, verify, email, remark, create_time,
          update_time, status, type_id, info )
VALUES  ( 1, 'admin', '管理员', '21232f297a57a5a743894a0e4a801fc3', '',
          1326335612, '127.0.0.1', 888, '8888', 'liu21st@gmail.com', '备注信息',
          1222907803, 1326266696, 1, 0, '' ),
        ( 2, 'demo', '演示', 'fe01ce2a7fbac8fafaed7c982a04e229', '', 1254326091,
          '127.0.0.1', 90, '8888', '', '', 1239783735, 1254325770, 1, 0, '' ),
        ( 3, 'member', '员工', 'aa08769cdcb26674c6706093503ff0a3', '',
          1326266720, '127.0.0.1', 17, '', '', '', 1253514375, 1254325728, 1,
          0, '' ),
        ( 4, 'leader', '领导', 'c444858e0aaeb727da73d2eae62321ad', '',
          1254325906, '127.0.0.1', 15, '', '', '领导', 1253514575, 1254325705, 1,
          0, '' );
SET IDENTITY_INSERT nbers_user OFF 