USE [N_Bers_aj]
GO
DELETE FROM [dbo].[nbers_role_user]
GO
DELETE FROM [dbo].[nbers_role]
GO
DELETE FROM [dbo].[nbers_node]
GO
DELETE FROM [dbo].[nbers_netmap]
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'3594d3fa-7c87-43c3-90dd-820a2e8052ae', N'天门分公司', NULL, N'', 1, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'07193c51-5530-4f3f-9208-6e59746962cc', N'潜江分公司', N'', N'', NULL, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'90b4fe32-708b-4405-abc6-fc01d98d4b7a', N'仙桃分公司', NULL, N'', 2, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'c6d8b21e-54ec-47c2-8499-b7d66e989167', N'安全第一责任人', N'', N'付新宇', NULL, 4, N'3594d3fa-7c87-43c3-90dd-820a2e8052ae', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'c8ff0a3c-7d65-4106-855b-50dd363433e9', N'农改工程部', N'兼职安全员', N'夏新平', 2, 6, N'0ac50e54-a6cb-4252-b97b-46a3f25a8f03', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'825ef13f-1cc0-45fb-92e5-9e1470916f31', N'安全第一责任人', N'', N'雷传兵', NULL, 4, N'90b4fe32-708b-4405-abc6-fc01d98d4b7a', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'6ba66771-ea03-4240-8983-d900684f8c32', N'基建工程部', N'兼职安全员', N'江波', 3, 6, N'0ac50e54-a6cb-4252-b97b-46a3f25a8f03', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'ae1b5317-bb62-4237-8736-49398b0339ac', N'基干队', N'兼职安全员', N'王兵', 4, 6, N'0ac50e54-a6cb-4252-b97b-46a3f25a8f03', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'879fe3f7-e064-4c21-b330-88157cdb78e2', N'公司网络安全第一责任人', NULL, N'万亿', NULL, NULL, N'00000000-0000-0000-0000-000000000000', N'')
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'7365672a-95fb-4023-9411-7ed7a6591f8c', N'安全第一责任人', N'', N'黄保平', NULL, 4, N'07193c51-5530-4f3f-9208-6e59746962cc', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'0ac50e54-a6cb-4252-b97b-46a3f25a8f03', N'专职安全员', N'', N'杨正军', NULL, 5, N'7365672a-95fb-4023-9411-7ed7a6591f8c', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'e6681f29-175e-400f-8636-7e1a01d63dc0', N'业扩工程部', N'兼职安全员', N'袁传静', 1, 6, N'0ac50e54-a6cb-4252-b97b-46a3f25a8f03', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'cc678e83-dcc0-4cc8-b9ff-a332eb1a618a', N'专职安全员', N'', N'李洪波', NULL, 5, N'c6d8b21e-54ec-47c2-8499-b7d66e989167', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'6089d161-b0c1-472f-9d26-438fd4554b65', N'公司安全协管人', N'', N'郑焰', 0, 1, N'879fe3f7-e064-4c21-b330-88157cdb78e2', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'6b4c13f1-4691-4688-a8a8-34f07b857b06', N'公司安全质量部', N'', N'', 0, 2, N'842f802c-fa4b-4487-a7ea-2dcd29556058', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'f881315c-6909-4c02-9154-98b310bd6e43', N'洪湖分公司', NULL, N'', 3, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'e32bbf34-6490-4820-a73b-bf28689077ba', N'松枝分公司', NULL, N'', 4, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'758252f3-bc69-438e-a634-309e8914b42b', N'公安分公司', NULL, N'', 5, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'8d26215f-d00f-4c2b-a491-73ea60b2a8b3', N'监理分公司', NULL, N'', 6, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'8dabe4e7-c18a-4f64-8b9d-e46109d191c3', N'江陵分公司', NULL, N'', 7, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'8c172f05-23a9-4dbf-a10e-7f9511217b14', N'京城分公司', NULL, N'', 8, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'0d8788e4-1414-4016-929d-24c59c66eabb', N'石首分公司', NULL, N'', 10, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'5e123f9b-397c-4513-b4fb-d25cd50a0b5b', N'运简分公司', NULL, N'', 11, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'ddda4e36-3d45-4181-b904-8e19e2a53448', N'输变电分公司', NULL, N'', 12, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'a129adee-d2e9-4274-9ce9-9ad8b428e633', N'安装分公司', NULL, N'', 13, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'78d876b0-e291-455e-9f28-c74981c9e853', N'简装分公司', NULL, N'', 14, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'060d3544-1265-4420-a57c-b28d6a14e7c4', N'城市照明分公司', NULL, N'', 14, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'41577573-aee6-4bf3-9483-8fe324b92e13', N'通讯自动化分公司', NULL, N'', 15, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'95f7fdcc-bd8e-4011-9530-54361eb36270', N'物业分公司', NULL, N'', 16, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'13c8cdfa-9296-4ad6-8efd-1d67635b08e5', N'金凤皇冠大酒店', NULL, N'', 17, 3, N'6b4c13f1-4691-4688-a8a8-34f07b857b06', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'92096a00-06db-422d-ae80-7aa60ecc78e1', N'客户服务队', N'兼职安全员', N'罗贤龙', 5, 6, N'0ac50e54-a6cb-4252-b97b-46a3f25a8f03', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'5fd1af16-e3f0-47fb-8e3c-a4bd4eccc1a3', N'安全第一责任人', N'', N'吴发清', 1, 4, N'f881315c-6909-4c02-9154-98b310bd6e43', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'0db30b0a-c3bd-416b-92f8-d56c16503b95', N'安全第一责任人', N'', N'许悦明', 1, 4, N'e32bbf34-6490-4820-a73b-bf28689077ba', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'6fa15362-c40c-4279-a498-0dab04c45780', N'安全第一责任人', N'', N'许勇', NULL, 4, N'758252f3-bc69-438e-a634-309e8914b42b', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'3c98ccd0-f028-4b91-9b55-46061f2df15e', N'安全第一责任人', N'', N'潘亚奇', NULL, 4, N'8d26215f-d00f-4c2b-a491-73ea60b2a8b3', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'cb9a5c43-562f-4943-a752-c6118fe823ac', N'安全第一责任人', N'', N'廖胜平', NULL, 4, N'8dabe4e7-c18a-4f64-8b9d-e46109d191c3', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'fc20e9cd-b363-416e-8fa2-1a6cc37aec68', N'安全第一责任人', N'', N'陈勇', NULL, 4, N'8c172f05-23a9-4dbf-a10e-7f9511217b14', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'9e466134-8b6c-45ee-8477-05040f1af5b9', N'安全第一责任人', N'', N'刘进', NULL, 4, N'0d8788e4-1414-4016-929d-24c59c66eabb', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'76df45f5-5c0f-42ff-b2f0-8f127335dc0d', N'安全第一责任人', N'', N'王纯', NULL, 4, N'5e123f9b-397c-4513-b4fb-d25cd50a0b5b', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'a3c62d14-a9e7-4c31-ab64-33ac3ff8ef01', N'安全第一责任人', N'', N'邵元瑞', NULL, 4, N'ddda4e36-3d45-4181-b904-8e19e2a53448', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'aae99511-2a10-44bb-adee-18adb2c99b14', N'安全第一责任人', N'', N'刘威', NULL, 4, N'a129adee-d2e9-4274-9ce9-9ad8b428e633', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'e1709d11-d7c9-4368-8c46-23b47cb9c349', N'安全第一责任人', N'', N'邓应军', NULL, 4, N'78d876b0-e291-455e-9f28-c74981c9e853', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'12edd5ea-9156-4db7-811b-30e5b2a632e7', N'安全第一责任人', N'', N'谢波', NULL, 4, N'41577573-aee6-4bf3-9483-8fe324b92e13', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'8d6c705a-e120-43ed-83ec-eb50ef4f1c17', N'安全第一责任人', N'', N'冯志勇', NULL, 4, N'95f7fdcc-bd8e-4011-9530-54361eb36270', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'f18e5c7e-7760-418b-8e3a-8892928fad99', N'安全第一责任人', N'', N'王璐琴', NULL, 4, N'13c8cdfa-9296-4ad6-8efd-1d67635b08e5', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'746eb1b0-60d2-4db1-a95a-4f30c3c1d953', N'专职安全员', N'', N'王金林', NULL, 5, N'825ef13f-1cc0-45fb-92e5-9e1470916f31', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'7dd18597-1d82-4dad-b64e-60f21dde3b5a', N'专职安全员', N'', N'邓平', NULL, 5, N'5fd1af16-e3f0-47fb-8e3c-a4bd4eccc1a3', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'ab2980e1-2c28-483c-95b4-d4c080270b65', N'专职安全员', N'', N'梅竹荣', NULL, 5, N'0db30b0a-c3bd-416b-92f8-d56c16503b95', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'3fee713f-bc61-4653-9236-dbcd64cd786e', N'专职安全员', N'', N'邓军桥', NULL, 5, N'6fa15362-c40c-4279-a498-0dab04c45780', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'64df6b6a-383e-42bd-81b3-31e881c0e1bc', N'专职安全员', N'', N'刘亮', NULL, 5, N'3c98ccd0-f028-4b91-9b55-46061f2df15e', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'36cd211b-95f1-4acd-a63c-8a2895d45048', N'专职安全员', N'', N'张光银', NULL, 5, N'cb9a5c43-562f-4943-a752-c6118fe823ac', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'0a25cf4a-36fd-4752-9b90-51b16a4283a1', N'专职安全员', N'', N'李强', NULL, 5, N'fc20e9cd-b363-416e-8fa2-1a6cc37aec68', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'76831e96-75e5-4782-ade7-b927e946d2e7', N'专职安全员', N'', N'李伟健', NULL, 5, N'9e466134-8b6c-45ee-8477-05040f1af5b9', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'551db14e-5f71-431c-8882-5d210eccb944', N'专职安全员', N'', N'江川学', NULL, 5, N'76df45f5-5c0f-42ff-b2f0-8f127335dc0d', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'ddb1be6f-93e9-4430-9bfd-383303c8c23b', N'专职安全员', N'', N'周斌', NULL, 5, N'a3c62d14-a9e7-4c31-ab64-33ac3ff8ef01', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'5991d115-a719-440c-9800-839e6fc3c7e5', N'专职安全员', N'', N'闻华', NULL, 5, N'aae99511-2a10-44bb-adee-18adb2c99b14', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'547684d8-6cca-4713-8a22-9fe290d3104b', N'专职安全员', N'', N'蔡俊梅', NULL, 5, N'e1709d11-d7c9-4368-8c46-23b47cb9c349', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'94372b99-6927-4f6e-9329-e4f89fe1a165', N'安全第一责任人', N'', N'黄明', NULL, 4, N'060d3544-1265-4420-a57c-b28d6a14e7c4', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'b00465ce-4c1d-4a8f-b882-25f0566a37af', N'专职安全员', N'', N'曾新', NULL, 5, N'94372b99-6927-4f6e-9329-e4f89fe1a165', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'b3a14258-a87d-4cab-b365-5aee8f5711d6', N'专职安全员', N'', N'范贤亮', NULL, 5, N'12edd5ea-9156-4db7-811b-30e5b2a632e7', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'85255b9c-eaa0-41d0-85f1-8d8aadc9819f', N'专职安全员', N'', N'朱卫东', NULL, 5, N'8d6c705a-e120-43ed-83ec-eb50ef4f1c17', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'97f845d6-f042-4f84-8fb3-84508c0f5999', N'专职安全员', N'', N'田浩', NULL, 5, N'f18e5c7e-7760-418b-8e3a-8892928fad99', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'5ffebf1d-920a-4ec2-92db-199941123e14', N'工程一部', N'兼职安全员', N'徐志斌', 1, 6, N'cc678e83-dcc0-4cc8-b9ff-a332eb1a618a', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'eb5daf34-1d4a-4f75-8f28-fcaf5c311f9d', N'工程二部', N'兼职安全员', N'李茂', 2, 6, N'cc678e83-dcc0-4cc8-b9ff-a332eb1a618a', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'eab6dca5-ecce-4eee-9ee5-622efae78f0b', N'工程三部', N'兼职安全员', N' 邓洪波', 3, 6, N'cc678e83-dcc0-4cc8-b9ff-a332eb1a618a', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'bee8b9d8-ee5b-443f-b360-5b949cb1deae', N'变电工程部', N'兼职安全员', N'杨涛', 1, 6, N'746eb1b0-60d2-4db1-a95a-4f30c3c1d953', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'9098feb3-a968-41c2-8ffb-519097139f1b', N'线路工程部', N'兼职安全员', N'曾庆烟', 2, 6, N'746eb1b0-60d2-4db1-a95a-4f30c3c1d953', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'2725950d-d41d-4b4b-bf68-5209b8fe9ee3', N'土建工程部', N'兼职安全员', N'苏峰', 3, 6, N'746eb1b0-60d2-4db1-a95a-4f30c3c1d953', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'f3eca889-f454-4754-b6b5-fdf9ffae1157', N'配电工程部', N'兼职安全员', N'刘本辉', 4, 6, N'746eb1b0-60d2-4db1-a95a-4f30c3c1d953', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'44f9925d-cc97-4c0e-a264-33d08e5f4324', N'工程一部', N'兼职安全员', N'邓平', 1, 6, N'7dd18597-1d82-4dad-b64e-60f21dde3b5a', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'11047f71-4679-40d0-9a7f-d1a31ceaa9fc', N'工程二部', N'兼职安全员', N'赵超', 1, 6, N'7dd18597-1d82-4dad-b64e-60f21dde3b5a', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'6bf1edb7-04cf-48e1-9eba-baaf696308ab', N'工程三部', N'兼职安全员', N'陈宏江', 3, 6, N'7dd18597-1d82-4dad-b64e-60f21dde3b5a', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'b639da09-44af-4c86-bb5f-0480cbe40c58', N' 客户工程部', N'兼职安全员', N'万钧', 1, 6, N'ab2980e1-2c28-483c-95b4-d4c080270b65', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'19ba4899-474b-455e-9c9d-00aa641be1bd', N'农网工程部', N'兼职安全员', N'李华', 2, 6, N'ab2980e1-2c28-483c-95b4-d4c080270b65', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'c1b11eee-e47c-4541-a8a0-3fd385b89428', N'基建工程部', N'兼职安全员', N'吴勇', 3, 6, N'ab2980e1-2c28-483c-95b4-d4c080270b65', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'9fea2bd8-8249-4b8c-bb4d-2f0f11388ace', N'客户工程部', N'兼职安全员', N'高军', 1, 6, N'3fee713f-bc61-4653-9236-dbcd64cd786e', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'61024685-13fa-4bc8-9063-9e11b54f27b0', N'工程四部', N'兼职安全员', N'张兴', 4, 6, N'5991d115-a719-440c-9800-839e6fc3c7e5', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'479968b6-1386-4a74-85c6-f639c9970214', N'高压装表一部', N'兼职安全员', N'谢松', 4, 6, N'547684d8-6cca-4713-8a22-9fe290d3104b', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'842f802c-fa4b-4487-a7ea-2dcd29556058', N'公司安全委员会', N'', N'', 1, 2, N'6089d161-b0c1-472f-9d26-438fd4554b65', N'')
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'c701b582-661d-411a-816e-65274d493989', N'客户工程部', N'兼职安全员', N'兼职安全员', 1, 6, N'3fee713f-bc61-4653-9236-dbcd64cd786e', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'dfdefdfb-771a-4d6b-8379-c1e5b4cde87f', N'配网工程部', N'兼职安全员', N'兼职安全员', 2, 6, N'3fee713f-bc61-4653-9236-dbcd64cd786e', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'9a802d2a-134c-41af-b282-22217ee8e375', N'基建工程部', N'兼职安全员', N'兼职安全员', 3, 6, N'3fee713f-bc61-4653-9236-dbcd64cd786e', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'04aa3e9c-a2c5-4067-b4d6-cc1fb366ae01', N'客户工程部', N'兼职安全员', N'兼职安全员', 1, 6, N'64df6b6a-383e-42bd-81b3-31e881c0e1bc', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'c984f79e-bd4c-4064-bfd3-2490c2851c80', N'客户工程部', N'兼职安全员', N'兼职安全员', 1, 6, N'64df6b6a-383e-42bd-81b3-31e881c0e1bc', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'040ce738-b4f4-4065-ba9b-eccd592d3edb', N'配网工程部', N'兼职安全员', N'兼职安全员', 2, 6, N'64df6b6a-383e-42bd-81b3-31e881c0e1bc', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'bfc8577c-97f6-48f9-b00b-824281ff65eb', N'基建工程部', N'兼职安全员', N'兼职安全员', 3, 6, N'64df6b6a-383e-42bd-81b3-31e881c0e1bc', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'e12cfe10-d204-41f4-95f4-2be415cabc37', N'客户工程部', N'兼职安全员', N'兼职安全员', 1, 6, N'36cd211b-95f1-4acd-a63c-8a2895d45048', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'6bd78918-537d-4b53-b2e9-317469738af6', N'配网工程部', N'兼职安全员', N'兼职安全员', 2, 6, N'36cd211b-95f1-4acd-a63c-8a2895d45048', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'a1360f77-edb9-4d45-8613-35799966d7d3', N'基建工程部', N'兼职安全员', N'兼职安全员', 3, 6, N'36cd211b-95f1-4acd-a63c-8a2895d45048', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'c746d17a-666f-444f-aab6-e25d30b55b22', N'客户工程部', N'兼职安全员', N'兼职安全员', 1, 6, N'0a25cf4a-36fd-4752-9b90-51b16a4283a1', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'5cb40a39-bb01-4f6f-8c3c-eca2e91aa290', N'配网工程部', N'兼职安全员', N'兼职安全员', 2, 6, N'0a25cf4a-36fd-4752-9b90-51b16a4283a1', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'd14e9409-99d9-4948-a1af-ea121ba19576', N'客户工程部', N'兼职安全员', N'兼职安全员', 1, 6, N'551db14e-5f71-431c-8882-5d210eccb944', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'45855ff4-edac-48a9-bc53-8f7815ac6cab', N'配网工程部', N'兼职安全员', N'兼职安全员', 2, 6, N'551db14e-5f71-431c-8882-5d210eccb944', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'f231f206-3676-48ab-ad41-c9fc1bfb608e', N'基建工程部', N'兼职安全员', N'兼职安全员', 3, 6, N'551db14e-5f71-431c-8882-5d210eccb944', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'cab199e2-f40f-4580-bc35-2e835654b4b2', N'客户工程部', N'兼职安全员', N'兼职安全员', 1, 6, N'ddb1be6f-93e9-4430-9bfd-383303c8c23b', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'53307bf6-c30a-4bde-95c0-0cf024b5b805', N'配网工程部', N'兼职安全员', N'兼职安全员', 2, 6, N'ddb1be6f-93e9-4430-9bfd-383303c8c23b', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'56fc4884-6bc6-4ed6-bc38-fd8d21641a09', N'客户工程部', N'兼职安全员', N'兼职安全员', 1, 6, N'76831e96-75e5-4782-ade7-b927e946d2e7', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'e3f69e56-1d61-4e77-8b33-b774c14834ee', N'配网工程部', N'兼职安全员', N'兼职安全员', 2, 6, N'76831e96-75e5-4782-ade7-b927e946d2e7', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'c13c931e-17e7-40eb-9683-7c747f9d684e', N'基建工程部', N'兼职安全员', N'兼职安全员', 3, 6, N'76831e96-75e5-4782-ade7-b927e946d2e7', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'acf473ca-68e9-4186-91f0-c9cd77caf37e', N'客户工程部', N'兼职安全员', N'兼职安全员', 1, 6, N'5991d115-a719-440c-9800-839e6fc3c7e5', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'795d7203-d170-498e-b20a-1a4d15228b40', N'配网工程部', N'兼职安全员', N'兼职安全员', 2, 6, N'5991d115-a719-440c-9800-839e6fc3c7e5', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'3eefd37a-3efe-45bb-bb7a-86a9b10367d0', N'基建工程部', N'兼职安全员', N'兼职安全员', 3, 6, N'5991d115-a719-440c-9800-839e6fc3c7e5', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'a3dfa8ca-020a-4f5b-b9e8-1e790f278d2b', N'客户工程部', N'兼职安全员', N'兼职安全员', 1, 6, N'547684d8-6cca-4713-8a22-9fe290d3104b', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'08ed44bd-cbd9-4114-b5be-3cd22bdb871e', N'配网工程部', N'兼职安全员', N'兼职安全员', 2, 6, N'547684d8-6cca-4713-8a22-9fe290d3104b', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'6c66fef5-e3ca-43ad-92cc-af2a67c5f64b', N'基建工程部', N'兼职安全员', N'兼职安全员', 3, 6, N'547684d8-6cca-4713-8a22-9fe290d3104b', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'6e0b4923-e6b4-4f6f-97b5-b0f7311014f0', N'客户工程部', N'兼职安全员', N'兼职安全员', 1, 6, N'b00465ce-4c1d-4a8f-b882-25f0566a37af', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'48310dcc-2a5b-4865-802a-cc43733aaf5a', N'配网工程部', N'兼职安全员', N'兼职安全员', 2, 6, N'b00465ce-4c1d-4a8f-b882-25f0566a37af', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'57f867a2-99c4-4a91-977a-8a6b945981f9', N'基建工程部', N'兼职安全员', N'兼职安全员', 3, 6, N'b00465ce-4c1d-4a8f-b882-25f0566a37af', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'a95f64a1-a253-4bfe-8da1-2d890098169c', N'基建工程部', N'兼职安全员', N'兼职安全员', 3, 6, N'b3a14258-a87d-4cab-b365-5aee8f5711d6', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'776cb297-2efc-494d-8b8d-c21b2730bec2', N'基建工程部', N'兼职安全员', N'兼职安全员', 3, 6, N'85255b9c-eaa0-41d0-85f1-8d8aadc9819f', NULL)
GO
INSERT [dbo].[nbers_netmap] ([node_guid], [node_name], [station_name], [auditor], [sort_order], [hierarchy], [parentguid], [remark]) VALUES (N'af35c3e1-d5ed-4dc9-ab33-656bc58c7ff4', N'安全保卫部', N'兼职安全员', N'田黎明', 1, 6, N'97f845d6-f042-4f84-8fb3-84508c0f5999', NULL)
GO
SET IDENTITY_INSERT [dbo].[nbers_node] ON 

GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (1, 1, 0, N'系统设置', N'', N'stsz', NULL, 1, 1, N'system', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (3, 1, 1, N'角色管理', N'/SystemManage/RoleIndex.aspx?nodeid=3', N'jsgl', NULL, 2, 2, N'system', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (4, 1, 0, N'基础信息', N'', N'jbxx', NULL, 1, 2, N'base', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (5, 1, 4, N'部门管理', N'/UserManage/UnitIndex.aspx?nodeid=5', N'bbgl_page', NULL, 2, 1, N'base', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (6, 1, 5, N'新增', N'', N'', N'add', 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (8, 1, 5, N'编辑', N'', N'', NULL, 3, 2, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (9, 1, 5, N'删除', N'', N'', NULL, 3, 2, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (13, 1, 1, N'菜单管理', N'/SystemManage/MenuIndex.aspx?nodeid=13', N'cdgl', NULL, 2, 3, N'system', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (14, 1, 13, N'新增', N'/SystemManage/MenuIndex.aspx?nodeid=13', N'', N'add', 3, 1, N'system', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (15, 1, 13, N'编辑', N'/SystemManage/MenuIndex.aspx?nodeid=13', N'', NULL, 3, 2, N'system', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (17, 1, 13, N'删除', N'/SystemManage/MenuIndex.aspx?nodeid=13', N'', NULL, 3, 3, N'system', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (18, 1, 4, N'用户管理', N'/UserManage/UserIndex.aspx?nodeid=18', N'yhgl', N'', 2, 2, N'base', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (20, 1, 4, N'岗位管理', N'/UserManage/StationIndex.aspx?nodeid=20', N'gwgl_page', NULL, 2, 1, N'base', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (22, 1, 0, N'部门管理', N'', N'bmgl', N'', 1, 4, N'unit_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (23, 1, 22, N'上级来文', N'/UnitManage/PaperOfSuperior.aspx?nodeid=23', N'sjhw', N'', 2, 5, N'unit_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (25, 1, 22, N'工作总结', N'/UnitManage/WorkSummary.aspx?nodeid=25', N'gzzj', N'', 2, 3, N'unit_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (26, 1, 0, N'部门概况', N'', N'bmgk', N'', 1, 3, N'unit_decription', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (28, 1, 22, N'绩效考核', N'/UnitManage/PerformanceExamine.aspx?nodeid=28', N'jxkh', N'', 2, 1, N'unit_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (29, 1, 22, N'工作计划', N'/UnitManage/WorkPlan.aspx?nodeid=29', N'gzjh', N'', 2, 2, N'unit_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (30, 1, 22, N'管理制度', N'/UnitManage/RuleManagement.aspx?nodeid=30', N'zdgl', N'', 2, 4, N'unit_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (31, 1, 0, N'安全管理', N'', N'aqgl', N'', 1, 5, N'safety_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (32, 1, 31, N'安全稽查', N'/Safety/SafetyCheck.aspx?nodeid=32', N'aqjc', N'', 2, 1, N'safety_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (37, NULL, 31, N'安全例会', N'/Safety/SafetyMeeting.aspx?nodeid=37', N'aqlh', N'', 2, 2, N'safety_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (38, NULL, 31, N'安规考试', N'/Safety/Examination.aspx?nodeid=38', N'agks', N'', 2, 3, N'safety_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (39, NULL, 31, N'教育培训', N'/Safety/EducationTraing.aspx?nodeid=39', N'jypx', N'', 2, 4, N'safety_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (40, NULL, 31, N'资质审核', N'/Safety/Qualification.aspx?nodeid=40', N'zgsh', N'', 2, 5, N'safety_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (41, NULL, 31, N'交通安全', N'/Safety/Traffic.aspx?nodeid=41', N'jtaq', N'', 2, 6, N'safety_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (42, NULL, 0, N'质量管理', N'', N'zlgl', N'', 1, 6, N'quality_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (43, NULL, 0, N'分公司管控', N'', N'fgsgl', N'', 1, 7, N'branch_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (44, NULL, 42, N'三体系建设', N'/QM/ThreeTix.aspx?nodeid=44', N'stxjs', N'', 2, 1, N'quality_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (45, NULL, 43, N'岗位人员信息', N'/OtherCompany/PersonalInformation.aspx?nodeid=45', N'gwryxx', N'', 2, 1, N'branch_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (46, NULL, 43, N'安全稽查通报', N'/OtherCompany/CheckReport.aspx?nodeid=46', N'aqjctb', N'', 2, 2, N'branch_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (47, NULL, 43, N'工器具配置标准', N'/OtherCompany/ToolsStandard.aspx?nodeid=47', N'gqjpzbz', N'', 2, 3, N'branch_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (48, NULL, 43, N'工器具管理评价', N'/OtherCompany/ToolsEvaluate.aspx?nodeid=48', N'gqjglpj', N'', 2, 4, N'branch_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (49, NULL, 43, N'分公司考核兑现', N'/OtherCompany/KaoHeDuiXian.aspx?nodeid=49', N'fgskhdx', N'', 2, 5, N'branch_manage', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (54, NULL, 3, N'新增', N'', NULL, N'add', 3, 1, N'system', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (55, 3, 3, N'编辑', N'', NULL, NULL, 3, 2, N'system', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (56, NULL, 3, N'删除', N'', NULL, NULL, 3, 3, N'system', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (57, 1, 20, N'新增', N'', NULL, N'add', 3, 1, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (58, 1, 20, N'编辑', N'', NULL, NULL, 3, 2, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (59, 1, 20, N'删除', N'', NULL, NULL, 3, 3, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (60, 1, 18, N'新增', N'', NULL, N'add', 3, 1, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (61, 1, 18, N'编辑', N'', NULL, NULL, 3, 2, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (62, 1, 18, N'删除', N'', NULL, NULL, 3, 3, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (63, 1, 18, N'分配角色', N'', NULL, NULL, 3, 4, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (64, 1, 28, N'上传附件', N'', NULL, NULL, 3, 2, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (68, 1, 29, N'删除', N'', NULL, NULL, 3, 4, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (71, 1, 25, N'删除', N'', NULL, NULL, 3, 4, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (72, 1, 30, N'上传附件', N'', NULL, NULL, 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (74, 1, 23, N'上传附件', N'', NULL, NULL, 3, 2, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (77, 1, 45, N'删除', N'', NULL, NULL, 3, 2, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (79, 1, 46, N'删除', N'', NULL, NULL, 3, 2, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (81, 1, 47, N'删除', N'', NULL, NULL, 3, 2, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (83, 1, 48, N'删除', N'', NULL, NULL, 3, 2, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (85, 1, 49, N'删除', N'', NULL, NULL, 3, 2, NULL, N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (87, 1, 28, N'删除', N'', NULL, NULL, 3, 4, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (88, 1, 29, N'新增文章', N'', NULL, N'add', 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (89, 1, 29, N'编辑', N'', NULL, NULL, 3, 3, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (91, 1, 25, N'新增文章', N'', NULL, N'add', 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (92, 1, 25, N'编辑', N'', NULL, NULL, 3, 3, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (95, 1, 30, N'删除', N'', NULL, NULL, 3, 4, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (97, 1, 23, N'删除', N'', NULL, NULL, 3, 4, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (98, 1, 45, N'上传附件', N'', NULL, NULL, 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (100, 1, 46, N'上传附件', N'', NULL, NULL, 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (102, 1, 47, N'上传附件', N'', NULL, NULL, 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (104, 1, 48, N'上传附件', N'', NULL, NULL, 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (106, 1, 49, N'上传附件', N'', NULL, NULL, 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (108, NULL, 26, N'公司安全网络图', N'/UnitDecription/SaveNetworkMap.aspx?nodeid=108', N'gsaqwlt', NULL, 2, 4, N'unit_decription', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (109, NULL, 1, N'公告管理', N'/SystemManage/NoticeIndex.aspx?nodeid=109', N'gggl', NULL, 2, 3, N'system', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (110, NULL, 26, N'形象及宗旨', N'/UnitDecription/UnitFigure.aspx?nodeid=110&oid=24', N'xxjzz', NULL, 2, 1, N'unit_decription', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (111, NULL, 26, N'部门职责', N'/UnitDecription/UnitFigure.aspx?nodeid=111&oid=25', N'bmzz', NULL, 2, 2, N'unit_decription', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (112, NULL, 26, N'岗位职责', N'/UnitDecription/StationDuty.aspx?nodeid=112', N'gwzz', NULL, 2, 3, N'unit_decription', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (113, NULL, 112, N'新增', N'', NULL, N'add', 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (114, NULL, 112, N'编辑', N'', NULL, NULL, 3, 2, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (115, NULL, 32, N'上传附件', N'', NULL, NULL, 3, 2, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (116, NULL, 28, N'新增文章', N'', NULL, N'add', 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (117, NULL, 28, N'编辑', N'', NULL, NULL, 3, 3, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (118, NULL, 29, N'上传附件', N'', NULL, NULL, 3, 2, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (119, NULL, 25, N'上传附件', N'', NULL, NULL, 3, 2, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (120, NULL, 30, N'新增文章', N'', NULL, N'add', 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (121, NULL, 23, N'新增文章', N'', NULL, N'add', 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (122, NULL, 32, N'新增文章', N'', NULL, N'add', 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (123, NULL, 32, N'编辑', N'', NULL, NULL, 3, 3, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (124, NULL, 32, N'删除', N'', NULL, NULL, 3, 4, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (125, NULL, 37, N'新增文章', N'', NULL, N'add', 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (126, NULL, 37, N'上传附件', N'', NULL, N'add', 3, 2, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (127, NULL, 37, N'编辑', N'', NULL, NULL, 3, 3, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (128, NULL, 37, N'删除', N'', NULL, NULL, 3, 4, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (129, NULL, 38, N'新增文章', N'', NULL, N'add', 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (130, NULL, 38, N'上传附件', N'', NULL, NULL, 3, 2, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (131, NULL, 38, N'编辑', N'', NULL, NULL, 3, 3, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (132, NULL, 38, N'删除', N'', NULL, NULL, 3, 4, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (133, NULL, 39, N'新增文章', N'', NULL, N'add', 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (134, NULL, 39, N'上传附件', N'', NULL, NULL, 3, 2, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (135, NULL, 39, N'编辑', N'', NULL, NULL, 3, 3, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (136, NULL, 39, N'删除', N'', NULL, NULL, 3, 4, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (137, NULL, 40, N'新增文章', N'', NULL, N'add', 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (138, NULL, 40, N'上传附件', N'', NULL, NULL, 3, 2, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (139, NULL, 40, N'编辑', N'', NULL, NULL, 3, 3, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (140, NULL, 40, N'删除', N'', NULL, NULL, 3, 4, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (141, NULL, 41, N'新增文章', N'', NULL, N'add', 3, 1, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (142, NULL, 41, N'上传附件', N'', NULL, NULL, 3, 2, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (143, NULL, 41, N'编辑', N'', NULL, NULL, 3, 3, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (144, NULL, 41, N'删除', N'', NULL, NULL, 3, 4, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (145, NULL, 30, N'编辑', N'', NULL, NULL, 3, 3, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (146, NULL, 23, N'编辑', N'', NULL, NULL, 3, 3, N'', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (147, NULL, 1, N'首页新闻管理', N'/SystemManage/Front_Banner.aspx?nodeid=147', N'syxwgl', NULL, 2, 4, N'system', N'1', 0)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (148, NULL, 109, N'新增', N'', NULL, NULL, 3, 1, N'system', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (149, NULL, 109, N'编辑', N'', NULL, NULL, 3, 2, N'system', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (150, NULL, 109, N'删除', N'', NULL, NULL, 3, 3, N'system', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (151, NULL, 147, N'新增', N'', NULL, NULL, 3, 1, N'system', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (152, NULL, 147, N'编辑', N'', NULL, NULL, 3, 3, N'system', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (153, NULL, 147, N'删除', N'', NULL, NULL, 3, 3, N'system', N'1', 1)
GO
INSERT [dbo].[nbers_node] ([id], [version], [parentId], [name], [url], [params], [icon], [levels], [sortCode], [moduleId], [enable], [group_id]) VALUES (154, NULL, 112, N'删除', N'', N'delete', NULL, 3, 3, N'', N'1', 1)
GO
SET IDENTITY_INSERT [dbo].[nbers_node] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_role] ON 

GO
INSERT [dbo].[nbers_role] ([id], [name], [status]) VALUES (1, N'管理员', 1)
GO
INSERT [dbo].[nbers_role] ([id], [name], [status]) VALUES (2, N'test', 1)
GO
INSERT [dbo].[nbers_role] ([id], [name], [status]) VALUES (3, N'  主任角色', NULL)
GO
SET IDENTITY_INSERT [dbo].[nbers_role] OFF
GO
SET IDENTITY_INSERT [dbo].[nbers_role_user] ON 

GO
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (9, 2, 2)
GO
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (10, 2, 3)
GO
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (11, 2, 4)
GO
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (1014, 1, 1)
GO
INSERT [dbo].[nbers_role_user] ([id], [role_id], [user_id]) VALUES (1015, 3, 6)
GO
SET IDENTITY_INSERT [dbo].[nbers_role_user] OFF
GO
