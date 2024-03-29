CREATE DATABASE [avtotehcentr]
USE [avtotehcentr]
GO
/****** Object:  Table [dbo].[Avtoriz]    Script Date: 11.08.2019 18:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Avtoriz](
	[Login] [varchar](30) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[Id_Member] [int] NOT NULL,
 CONSTRAINT [PK_Avtoriz] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11.08.2019 18:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[Id_Customer] [int] IDENTITY(1,1) NOT NULL,
	[NameCustomer] [varchar](50) NOT NULL,
	[SurnameCustomer] [varchar](50) NOT NULL,
	[PatronymCustomer] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id_Customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Member]    Script Date: 11.08.2019 18:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[Id_Member] [int] IDENTITY(1,1) NOT NULL,
	[NameMember] [varchar](50) NOT NULL,
	[SurnameMember] [varchar](50) NOT NULL,
	[PatronymMember] [varchar](50) NOT NULL,
	[PhoneMember] [varchar](10) NOT NULL,
	[KodRole] [int] NOT NULL,
	[BadMember] [bit] NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[Id_Member] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11.08.2019 18:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[Id_Order] [int] IDENTITY(1,1) NOT NULL,
	[NumberCustomer] [varchar](10) NOT NULL,
	[VinCustomer] [varchar](20) NOT NULL,
	[DefectCustomer] [varchar](500) NOT NULL,
	[PlanOrder] [datetime] NOT NULL,
	[PriceOrder] [money] NOT NULL,
	[DateOrder] [datetime] NOT NULL,
	[KodBrigadir] [int] NOT NULL,
	[KodMaster] [int] NOT NULL,
	[KodKassir] [int] NOT NULL,
	[Id_Customer] [int] NOT NULL,
	[Id_Member] [int] NOT NULL,
	[KodWork] [int] NOT NULL,
	[ModelCustomer] [varchar](20) NOT NULL,
	[WorkOrder] [varchar](500) NOT NULL,
	[DetailOrder] [varchar](500) NOT NULL,
	[MaterOrder] [varchar](500) NOT NULL,
	[BadOrder] [bit] NOT NULL,
	[PayOrder] [bit] NOT NULL,
	[DatePayOrder] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id_Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11.08.2019 18:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id_Role] [int] IDENTITY(1,1) NOT NULL,
	[RoleAdmin] [bit] NOT NULL,
	[RoleView] [bit] NOT NULL,
	[RoleEdit] [bit] NOT NULL,
	[RolePay] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Work]    Script Date: 11.08.2019 18:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Work](
	[KodWork] [int] IDENTITY(1,1) NOT NULL,
	[NameWork] [int] NOT NULL,
 CONSTRAINT [PK_Work] PRIMARY KEY CLUSTERED 
(
	[KodWork] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Avtoriz]  WITH CHECK ADD  CONSTRAINT [FK_Avtoriz_Member] FOREIGN KEY([Id_Member])
REFERENCES [dbo].[Member] ([Id_Member])
GO
ALTER TABLE [dbo].[Avtoriz] CHECK CONSTRAINT [FK_Avtoriz_Member]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Role] FOREIGN KEY([KodRole])
REFERENCES [dbo].[Role] ([Id_Role])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Role]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([Id_Customer])
REFERENCES [dbo].[Customer] ([Id_Customer])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Member] FOREIGN KEY([KodBrigadir])
REFERENCES [dbo].[Member] ([Id_Member])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Member]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Member1] FOREIGN KEY([KodMaster])
REFERENCES [dbo].[Member] ([Id_Member])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Member1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Member2] FOREIGN KEY([KodKassir])
REFERENCES [dbo].[Member] ([Id_Member])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Member2]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Member3] FOREIGN KEY([Id_Member])
REFERENCES [dbo].[Member] ([Id_Member])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Member3]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Work] FOREIGN KEY([KodWork])
REFERENCES [dbo].[Work] ([KodWork])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Work]
GO

ALTER TABLE [avtotehcentr].[dbo].[Role] 
Add RoleMaster Bit;
insert into [avtotehcentr].[dbo].[Role] (RoleAdmin, RoleView, RoleEdit, RolePay, RoleMaster) values (1,0,0,0,0)
insert into [avtotehcentr].[dbo].[Role] (RoleAdmin, RoleView, RoleEdit, RolePay, RoleMaster) values (0,1,0,0,0)
insert into [avtotehcentr].[dbo].[Role] (RoleAdmin, RoleView, RoleEdit, RolePay, RoleMaster) values (0,0,1,0,0)
insert into [avtotehcentr].[dbo].[Role] (RoleAdmin, RoleView, RoleEdit, RolePay, RoleMaster) values (0,0,0,1,0)
insert into [avtotehcentr].[dbo].[Role] (RoleAdmin, RoleView, RoleEdit, RolePay, RoleMaster) values (0,0,0,0,1)
alter table [avtotehcentr].[dbo].[Role] add NameRole varchar(500)
update [avtotehcentr].[dbo].[Role] set NameRole = 'Кассир' where RolePay =1
update [avtotehcentr].[dbo].[Role] set NameRole = 'Бригадир' where RoleEdit =1
update [avtotehcentr].[dbo].[Role] set NameRole = 'Мастер' where RoleMaster =1
update [avtotehcentr].[dbo].[Role] set NameRole = 'Админ' where RoleAdmin =1
update [avtotehcentr].[dbo].[Role] set NameRole = 'Гость' where RoleView =1
insert into [avtotehcentr].[dbo].[Member] (SurnameMember, NameMember, PatronymMember, PhoneMember, KodRole, BadMember)
values ('Неровнов', 'Андрей', 'Алексеевич', '9175360015', 1, 0)


insert into [avtotehcentr].[dbo].[Avtoriz] (Login, Password, Id_Member) values ('andrey', '123', 1)


ALTER TABLE [avtotehcentr].[dbo].[Work] 
ALTER COLUMN NameWork NVARCHAR(100) 
alter table [avtotehcentr].[dbo].[Order] add MasterDate datetime




alter table [avtotehcentr].[dbo].[Order]
alter column KodMaster int null

alter table [avtotehcentr].[dbo].[Order]
alter column KodKassir int null

alter table [avtotehcentr].[dbo].[Order]
alter column DatePayOrder datetime null

alter table [avtotehcentr].[dbo].[Order]
alter column MasterDate datetime null

alter table [avtotehcentr].[dbo].[Order]
alter column WorkOrder varchar(500) null

alter table [avtotehcentr].[dbo].[Order]
alter column DetailOrder varchar(500) null

alter table [avtotehcentr].[dbo].[Order]
alter column MaterOrder varchar(500) null