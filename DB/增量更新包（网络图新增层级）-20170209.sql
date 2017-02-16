BEGIN TRAN
INSERT  INTO dbo.nbers_netmap
        ( node_guid ,
          node_name ,
          station_name ,
          auditor ,
          sort_order ,
          hierarchy ,
          parentguid ,
          remark
        )
VALUES  ( '842F802C-FA4B-4487-A7EA-2DCD29556058' , -- node_guid - uniqueidentifier
          N'公司安全委员会' , -- node_name - nvarchar(50)
          N'' , -- station_name - nvarchar(50)
          N'' , -- auditor - nvarchar(50)
          1 , -- sort_order - int
          2 , -- hierarchy - int
          '6089D161-B0C1-472F-9D26-438FD4554B65' , -- parentguid - uniqueidentifier
          N''  -- remark - nvarchar(50)
        )
UPDATE  dbo.nbers_netmap
SET     parentguid = '842F802C-FA4B-4487-A7EA-2DCD29556058'
WHERE   node_guid = '6B4C13F1-4691-4688-A8A8-34F07B857B06'
COMMIT