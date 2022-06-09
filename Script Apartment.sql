CREATE DATABASE BFApartment
USE BFApartment
CREATE TABLE Banks (
	bankId varchar(50) PRIMARY KEY,
	bankName nvarchar(512))

CREATE TABLE BankAccounts(
	accountNum varchar(25) ,
	cardNum varchar(25) PRIMARY KEY,
	PIN varchar(6),
	cvv varchar(3),
	[name] nvarchar(512),
	accountBlance FLOAT,
	bankId varchar(50) FOREIGN KEY REFERENCES Banks(bankId))

CREATE TABLE ApartmentTypes(
	apartmentTypeId varchar(25) PRIMARY KEY,
	typeName nvarchar(512),
	rentPrice float,
	salePrice float)

CREATE TABLE Buildings(
	buildingId varchar(25) PRIMARY KEY,
	buildingName nvarchar(512),
	numberOfApartment int)

CREATE TABLE Apartments(
	apartmentId	varchar(25) PRIMARY KEY,
	size int,
	[image] varchar(1024),
	[status] bit,
	apartmentTypeId varchar(25) FOREIGN KEY REFERENCES ApartmentTypes(apartmentTypeId),
	buildingId varchar(25) FOREIGN KEY REFERENCES Buildings(buildingId))

CREATE TABLE Roles(
	roleId varchar(25) PRIMARY KEY,
	roleName nvarchar(128),
	[status] bit)

CREATE TABLE Accounts(
	userId varchar(128) PRIMARY KEY,
	password varchar(512),
	[status] bit,
	roleId varchar(25) FOREIGN KEY REFERENCES Roles(roleId))

CREATE TABLE Owners(
	ownerId varchar(25) PRIMARY KEY,
	fullName nvarchar(512),
	dob date,
	sex nvarchar(32),
	job nvarchar(128),
	phone varchar(16),
	email varchar(128),
	[status] bit,
	userId varchar(128) UNIQUE FOREIGN KEY REFERENCES Accounts(userId))

CREATE TABLE Requests(
	requestId varchar(25) PRIMARY KEY,
	[action] nvarchar(32),
	[status] bit,
	ownerId varchar(25) FOREIGN KEY REFERENCES Owners(ownerId))

CREATE TABLE Residents(
	residentId varchar(25) PRIMARY KEY,
	fullName nvarchar(256),
	dob date,
	sex nvarchar(32),
	job nvarchar(256),
	phone varchar(16),
	[status] bit,
	requestId varchar(25) FOREIGN KEY REFERENCES Requests(requestId),
	ownerId varchar(25) FOREIGN KEY REFERENCES Owners(ownerId))

CREATE TABLE Contracts(
	contractId varchar(25) PRIMARY KEY,
	startDate date,
	endDate date,
	[status] bit,
	ownerId varchar(25) UNIQUE FOREIGN KEY REFERENCES Owners(ownerId),
	apartmentId varchar(25) FOREIGN KEY REFERENCES Apartments(apartmentId))

CREATE TABLE Bills(
	billId varchar(25) PRIMARY KEY,
	total float,
	[status] bit,
	[date] date,
	apartmentId varchar(25) FOREIGN KEY REFERENCES Apartments(apartmentId))

CREATE TABLE Services(
	serviceId varchar(25) PRIMARY KEY,
	serviceName nvarchar(256),
	servicePrice float,
	[status] bit)

CREATE TABLE ContractServices(
	serviceId varchar(25) NOT NULL FOREIGN KEY REFERENCES Services(serviceId),
	contractId varchar(25) NOT NULL FOREIGN KEY REFERENCES Contracts(contractId),
	CONSTRAINT Ma PRIMARY KEY(serviceId, contractId))

CREATE TABLE BillDetails(
	billId varchar(25) NOT NULL FOREIGN KEY REFERENCES Bills(billId),
	serviceId varchar(25) NOT NULL FOREIGN KEY REFERENCES Services(serviceId),
	priceDetail float,
	CONSTRAINT Ma2 PRIMARY KEY(billId, serviceId))

CREATE TABLE ServiceDetails(
	serviceDetailId varchar(25),
	oldIndex int,
	newIndex int,
	usagaIndex int,
	[date] date,
	serviceId varchar(25) FOREIGN KEY REFERENCES Services(serviceId)
	)

CREATE TABLE Troubles(
	troubleId varchar(25) PRIMARY KEY,
	troubleName nvarchar(256)
	)

CREATE TABLE Apart_Troubles(
	apartmentId varchar(25) FOREIGN KEY REFERENCES Apartments(ApartmentId),
	troubleId varchar(25) FOREIGN KEY REFERENCES Troubles(troubleId),
	[date] date,
	detail nvarchar(2048),
	[status] bit,
	tranId varchar(25) PRIMARY KEY)

INSERT [dbo].[Roles] ([roleId], [roleName], [status]) VALUES (N'AD', N'Admin', 1)
INSERT [dbo].[Roles] ([roleId], [roleName], [status]) VALUES (N'EM', N'Employee', 1)
INSERT [dbo].[Roles] ([roleId], [roleName], [status]) VALUES (N'US', N'User', 1)


INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'admin', N'202cb962ac59075b964b07152d234b70', 1, N'AD')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'employee', N'202cb962ac59075b964b07152d234b70', 1, N'EM')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'employee_2', N'202cb962ac59075b964b07152d234b70', 1, N'EM')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'user', N'202cb962ac59075b964b07152d234b70', 1, N'US')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'linhnpn', N'202cb962ac59075b964b07152d234b70', 1, N'US')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'trieudh', N'202cb962ac59075b964b07152d234b70', 1, N'US')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'thinhdnp', N'202cb962ac59075b964b07152d234b70', 1, N'US')
INSERT [dbo].[Accounts] ([userId], [password], [status], [roleId]) VALUES (N'hoanghdm', N'202cb962ac59075b964b07152d234b70', 1, N'US')

INSERT [dbo].[Owners] ([ownerId], [fullName], [dob], sex, [job], [phone], [email], [status], [userId]) VALUES (N'OWN1', N'Nguyễn Thanh Tùng', CAST(N'2001-03-09' AS Date), N'male', N'Ca sĩ', N'01234567', N'tungnt@gmail.com', 1, N'user')
INSERT [dbo].[Owners] ([ownerId], fullName, [dob], sex, [job], [phone], [email], [status], [userId]) VALUES (N'OWN2', N'Nguyễn Phương Nhật Linh', CAST(N'2001-03-10' AS Date), N'male', N'Cầu thủ', N'01234568', N'linhnpn@gmail.com', 1, N'linhnpn')
INSERT [dbo].[Owners] ([ownerId], fullName, [dob], sex, [job], [phone], [email], [status], [userId]) VALUES (N'OWN3', N'Đỗ Hải Triều', CAST(N'2001-03-11' AS Date), N'male', N'Kỹ sư', N'01234569', N'trieudh@gmail.com', 1, N'trieudh')
INSERT [dbo].[Owners] ([ownerId], fullName, [dob], sex, [job], [phone], [email], [status], [userId]) VALUES (N'OWN4', N'Đặng Nguyễn Phú Thịnh', CAST(N'2001-03-12' AS Date), N'male', N'Cầu thủ', N'01234561', N'thinhdnp@gmail.com', 1, N'thinhdnp')
INSERT [dbo].[Owners] ([ownerId], fullName, [dob], sex, [job], [phone], [email], [status], [userId]) VALUES (N'OWN5', N'Huỳnh Đỗ Minh Hoàng', CAST(N'2001-01-13' AS Date), N'male', N'Nha sĩ', N'01234562', N'hoanghdm@gmail.com', 1, N'hoanghdm')

INSERT INTO Requests VALUES ('REQ001', 'add', 1, 'OWN1')
INSERT INTO Requests VALUES ('REQ002', 'add', 0, 'OWN2')
INSERT INTO Requests VALUES ('REQ003', 'delete', 1, 'OWN3')
INSERT INTO Requests VALUES ('REQ004', 'delete', 0, 'OWN4')
INSERT INTO Requests VALUES ('REQ005', 'add', 1, 'OWN5')
INSERT INTO Requests VALUES ('REQ006', 'add', 0, 'OWN1')
INSERT INTO Requests VALUES ('REQ007', 'delete', 1, 'OWN2')
INSERT INTO Requests VALUES ('REQ008', 'delete', 0, 'OWN3')
INSERT INTO Requests VALUES ('REQ009', 'add', 1, 'OWN4')
INSERT INTO Requests VALUES ('REQ010', 'add', 0, 'OWN5')
INSERT INTO Requests VALUES ('REQ011', 'add', 1, 'OWN1')
INSERT INTO Requests VALUES ('REQ012', 'add', 0, 'OWN3')
INSERT INTO Requests VALUES ('REQ013', 'delete', 1, 'OWN4')
INSERT INTO Requests VALUES ('REQ014', 'add', 0, 'OWN5')
/*add REQ2 0, OWN2*/
INSERT INTO Residents VALUES ('RES1', N'Huỳnh Ngọc Hải Em', '06-09-2001', 'male', N'Công nhân', '0857442278', 0, 'REQ002', 'OWN2')
INSERT INTO Residents VALUES ('RES2', N'Nguyễn Đào Anh Lâm', '06-09-2001', 'male', N'Sinh viên', '0857442279', 0, 'REQ002', 'OWN2')
INSERT INTO Residents VALUES ('RES3', N'Thành Danh', '06-10-2001', 'female', N'Sinh viên', '0857442280', 0, 'REQ002', 'OWN2')
/*add REQ1 1, OWN1*/
INSERT INTO Residents VALUES ('RES4', N'Nguyễn Thế Hiển', '07-09-2001', 'male', N'Sinh viên', '0857442281', 1, 'REQ001', 'OWN1')
INSERT INTO Residents VALUES ('RES5', N'Lê Chí Hùng', '11-09-2001', 'male', N'Sinh viên', '0857442282', 1, 'REQ001', 'OWN1')
INSERT INTO Residents VALUES ('RES6', N'Đỗ Tấn Phát', '10-10-2001', 'male', N'Sinh viên', '0857442283', 1, 'REQ001', 'OWN1')
/*add REQ5, 1, OWN5*/
INSERT INTO Residents VALUES ('RES7', N'Minh Thơ', '07-09-2001', 'female', N'Học sinh', '0857442254', 1, 'REQ005', 'OWN5')
INSERT INTO Residents VALUES ('RES8', N'Trúc Quỳnh', '08-09-2001', 'female', N'Sinh viên', '0857442265', 1, 'REQ005', 'OWN5')
INSERT INTO Residents VALUES ('RES9', N'Trang Trứng', '09-10-2001', 'female', N'Sinh viên', '0857442286', 1, 'REQ005', 'OWN5')
/*add REQ6, 0, OWN1*/
INSERT INTO Residents VALUES ('RES10', N'Nguyễn Văn Chí', '07-09-2001', 'male', 'Sinh viên', '0857442281', 0, 'REQ006', 'OWN1')
INSERT INTO Residents VALUES ('RES11', N'Chí Thị Na', '01-09-2001', 'female', 'Bác sĩ', '0857442282', 0, 'REQ006', 'OWN1')
INSERT INTO Residents VALUES ('RES12', N'Đỗ Tấn Trung', '02-10-2001', 'male', 'Sinh viên', '0857442283', 0, 'REQ006', 'OWN1')

/*INSERT INTO Requests VALUES ('REQ009', 'add', 1, 'OWN4')
INSERT INTO Requests VALUES ('REQ010', 'add', 0, 'OWN5')
INSERT INTO Requests VALUES ('REQ011', 'add', 1, 'OWN1')
INSERT INTO Requests VALUES ('REQ012', 'add', 0, 'OWN3')*/

INSERT INTO Residents VALUES ('RES13', N'Nguyễn Văn Phong', '01-09-2001', 'male', 'Y tá', '0857442284', 1, 'REQ009', 'OWN4')
INSERT INTO Residents VALUES ('RES14', N'Khánh Ly', '02-09-2001', 'female', 'Bác sĩ', '0857442285', 1, 'REQ009', 'OWN4')

INSERT INTO Residents VALUES ('RES15', N'Trần Trung Hiếu', '03-09-2001', 'male', 'Ca sĩ', '0857442286', 0, 'REQ010', 'OWN5')
INSERT INTO Residents VALUES ('RES16', N'Khánh Vy', '04-09-2001', 'female', 'Bác sĩ', '0857442287', 0, 'REQ010', 'OWN5')

INSERT INTO Residents VALUES ('RES17', N'Hữu Chí', '05-09-2001', 'male', 'Sinh viên', '0857442288', 1, 'REQ011', 'OWN1')
INSERT INTO Residents VALUES ('RES18', N'Thúy Ngân', '06-09-2001', 'female', 'FPT Boi', '0857442289', 1, 'REQ011', 'OWN1')

INSERT INTO Residents VALUES ('RES19', N'Hữu Vĩnh', '07-09-2001', 'male', 'HUTECH Boi', '0857442290', 0, 'REQ012', 'OWN3')
INSERT INTO Residents VALUES ('RES20', N'Kim Ngân', '08-09-2001', 'female', 'Bác sĩ', '0857442291', 0, 'REQ012', 'OWN3')

/*INSERT INTO Requests VALUES ('REQ014', 'add', 0, 'OWN5')*/
INSERT INTO Residents VALUES ('RES21', N'Bùi Hữu Đông', '09-09-1999', 'male', 'Giảng viên', '0857442292', 0, 'REQ014', 'OWN5')

/*INSERT INTO Requests VALUES ('REQ003', 'delete', 1, 'OWN3')
INSERT INTO Requests VALUES ('REQ004', 'delete', 0, 'OWN4')
INSERT INTO Requests VALUES ('REQ007', 'delete', 1, 'OWN2')
INSERT INTO Requests VALUES ('REQ008', 'delete', 0, 'OWN3')
INSERT INTO Requests VALUES ('REQ013', 'delete', 1, 'OWN4')*/
INSERT INTO Residents VALUES ('RES22', N'Hữu Trà', '07-10-2001', 'male', 'HUTECH Boi', '0857442293', 0, 'REQ003', 'OWN3')
INSERT INTO Residents VALUES ('RES23', N'Hà Tiên', '08-11-2001', 'female', 'Bác sĩ', '0857442294', 0, 'REQ003', 'OWN3')
INSERT INTO Residents VALUES ('RES24', N'Xi Măng', '07-12-2001', 'male', 'HUTECH Boi', '0857442295', 1, 'REQ004', 'OWN4')
INSERT INTO Residents VALUES ('RES25', N'Công Thanh', '08-13-2001', 'female', 'Bác sĩ', '0857442296', 1, 'REQ004', 'OWN4')
INSERT INTO Residents VALUES ('RES26', N'Thanh Nhàn', '07-14-2001', 'male', 'HUTECH Boi', '0857442297', 0, 'REQ007', 'OWN2')
INSERT INTO Residents VALUES ('RES27', N'Nhàn Hạ', '08-15-2001', 'female', 'Bác sĩ', '0857442298', 0, 'REQ007', 'OWN2')
INSERT INTO Residents VALUES ('RES28', N'Hạ Thu', '07-16-2001', 'male', 'HUTECH Boi', '0857442299', 1, 'REQ008', 'OWN3')
INSERT INTO Residents VALUES ('RES29', N'Thu Tiền', '08-17-2001', 'female', 'Bác sĩ', '0857442100', 1, 'REQ008', 'OWN3')
INSERT INTO Residents VALUES ('RES30', N'Tiền Của', '07-18-2001', 'male', 'HUTECH Boi', '0857442101', 0, 'REQ013', 'OWN4')
INSERT INTO Residents VALUES ('RES31', N'Của Cải', '08-19-2001', 'female', 'Bác sĩ', '0857442102', 0, 'REQ013', 'OWN4')

INSERT INTO ApartmentTypes VALUES('AP01',N'Căn hộ cao cấp', 3000000, 1500000000)
INSERT INTO ApartmentTypes VALUES('AP02',N'Căn hộ trung cấp', 2500000, 1200000000)
INSERT INTO ApartmentTypes VALUES('AP03',N'Căn hộ thông minh', 4000000, 2000000000)
INSERT INTO ApartmentTypes VALUES('AP04',N'Căn hộ cao ốc', 4500000, 2500000000)

INSERT INTO Buildings VALUES('BU01', N'Tòa nhà 01', 3)
INSERT INTO Buildings VALUES('BU02', N'Tòa nhà 02', 3)
INSERT INTO Buildings VALUES('BU03', N'Tòa nhà 03', 3)
INSERT INTO Buildings VALUES('BU04', N'Tòa nhà 04', 3)
INSERT INTO Buildings VALUES('BU05', N'Tòa nhà 05', 3)

INSERT INTO Apartments VALUES('APM1', 100, '*', 1, 'AP01', 'BU01')
INSERT INTO Apartments VALUES('APM2', 100, '*', 1, 'AP01', 'BU01')
INSERT INTO Apartments VALUES('APM3', 100, '*', 1, 'AP01', 'BU01')
INSERT INTO Apartments VALUES('APM4', 100, '*', 1, 'AP01', 'BU01')
INSERT INTO Apartments VALUES('APM5', 100, '*', 1, 'AP01', 'BU01')

INSERT INTO Apartments VALUES('APM6', 100, '*', 1, 'AP01', 'BU02')
INSERT INTO Apartments VALUES('APM7', 100, '*', 1, 'AP01', 'BU02')
INSERT INTO Apartments VALUES('APM8', 100, '*', 1, 'AP01', 'BU02')
INSERT INTO Apartments VALUES('APM9', 100, '*', 1, 'AP01', 'BU02')
INSERT INTO Apartments VALUES('APM10', 100, '*', 1, 'AP01', 'BU02')

INSERT INTO Apartments VALUES('APM11', 100, '*', 1, 'AP01', 'BU03')
INSERT INTO Apartments VALUES('APM12', 100, '*', 1, 'AP01', 'BU03')
INSERT INTO Apartments VALUES('APM13', 100, '*', 1, 'AP01', 'BU03')
INSERT INTO Apartments VALUES('APM14', 100, '*', 1, 'AP01', 'BU03')
INSERT INTO Apartments VALUES('APM15', 100, '*', 1, 'AP01', 'BU03')

INSERT INTO Apartments VALUES('APM16', 100, '*', 1, 'AP01', 'BU04')
INSERT INTO Apartments VALUES('APM17', 100, '*', 1, 'AP01', 'BU04')
INSERT INTO Apartments VALUES('APM18', 100, '*', 1, 'AP01', 'BU04')
INSERT INTO Apartments VALUES('APM19', 100, '*', 1, 'AP01', 'BU04')
INSERT INTO Apartments VALUES('APM20', 100, '*', 1, 'AP01', 'BU04')

INSERT INTO Apartments VALUES('APM21', 100, '*', 1, 'AP01', 'BU05')
INSERT INTO Apartments VALUES('APM22', 100, '*', 1, 'AP01', 'BU05')
INSERT INTO Apartments VALUES('APM23', 100, '*', 1, 'AP01', 'BU05')
INSERT INTO Apartments VALUES('APM24', 100, '*', 1, 'AP01', 'BU05')
INSERT INTO Apartments VALUES('APM25', 100, '*', 1, 'AP01', 'BU05')
/*AP02*/
INSERT INTO Apartments VALUES('APM26', 100, '*', 1, 'AP02', 'BU01')
INSERT INTO Apartments VALUES('APM27', 100, '*', 1, 'AP02', 'BU01')
INSERT INTO Apartments VALUES('APM28', 100, '*', 1, 'AP02', 'BU01')
INSERT INTO Apartments VALUES('APM29', 100, '*', 1, 'AP02', 'BU01')
INSERT INTO Apartments VALUES('APM30', 100, '*', 1, 'AP02', 'BU01')

INSERT INTO Apartments VALUES('APM31', 100, '*', 1, 'AP02', 'BU02')
INSERT INTO Apartments VALUES('APM32', 100, '*', 1, 'AP02', 'BU02')
INSERT INTO Apartments VALUES('APM33', 100, '*', 1, 'AP02', 'BU02')
INSERT INTO Apartments VALUES('APM34', 100, '*', 1, 'AP02', 'BU02')
INSERT INTO Apartments VALUES('APM35', 100, '*', 1, 'AP02', 'BU02')

INSERT INTO Apartments VALUES('APM36', 100, '*', 1, 'AP02', 'BU03')
INSERT INTO Apartments VALUES('APM37', 100, '*', 1, 'AP02', 'BU03')
INSERT INTO Apartments VALUES('APM38', 100, '*', 1, 'AP02', 'BU03')
INSERT INTO Apartments VALUES('APM39', 100, '*', 1, 'AP02', 'BU03')
INSERT INTO Apartments VALUES('APM40', 100, '*', 1, 'AP02', 'BU03')

INSERT INTO Apartments VALUES('APM41', 100, '*', 1, 'AP02', 'BU04')
INSERT INTO Apartments VALUES('APM42', 100, '*', 1, 'AP02', 'BU04')
INSERT INTO Apartments VALUES('APM43', 100, '*', 1, 'AP02', 'BU04')
INSERT INTO Apartments VALUES('APM44', 100, '*', 1, 'AP02', 'BU04')
INSERT INTO Apartments VALUES('APM45', 100, '*', 1, 'AP02', 'BU04')

INSERT INTO Apartments VALUES('APM46', 100, '*', 1, 'AP01', 'BU05')
INSERT INTO Apartments VALUES('APM47', 100, '*', 1, 'AP01', 'BU05')
INSERT INTO Apartments VALUES('APM48', 100, '*', 1, 'AP01', 'BU05')
INSERT INTO Apartments VALUES('APM49', 100, '*', 1, 'AP01', 'BU05')
INSERT INTO Apartments VALUES('APM50', 100, '*', 1, 'AP01', 'BU05')

/*AP03*/
INSERT INTO Apartments VALUES('APM51', 120, '*', 1, 'AP03', 'BU01')
INSERT INTO Apartments VALUES('APM52', 120, '*', 1, 'AP03', 'BU01')
INSERT INTO Apartments VALUES('APM53', 120, '*', 1, 'AP03', 'BU01')
INSERT INTO Apartments VALUES('APM54', 120, '*', 1, 'AP03', 'BU01')
INSERT INTO Apartments VALUES('APM55', 120, '*', 1, 'AP03', 'BU01')

INSERT INTO Apartments VALUES('APM56', 120, '*', 1, 'AP03', 'BU02')
INSERT INTO Apartments VALUES('APM57', 120, '*', 1, 'AP03', 'BU02')
INSERT INTO Apartments VALUES('APM58', 120, '*', 1, 'AP03', 'BU02')
INSERT INTO Apartments VALUES('APM59', 120, '*', 1, 'AP03', 'BU02')
INSERT INTO Apartments VALUES('APM60', 120, '*', 1, 'AP03', 'BU02')

INSERT INTO Apartments VALUES('APM61', 120, '*', 1, 'AP03', 'BU03')
INSERT INTO Apartments VALUES('APM62', 120, '*', 1, 'AP03', 'BU03')
INSERT INTO Apartments VALUES('APM63', 120, '*', 1, 'AP03', 'BU03')
INSERT INTO Apartments VALUES('APM64', 120, '*', 1, 'AP03', 'BU03')
INSERT INTO Apartments VALUES('APM65', 120, '*', 1, 'AP03', 'BU03')

INSERT INTO Apartments VALUES('APM66', 120, '*', 1, 'AP03', 'BU04')
INSERT INTO Apartments VALUES('APM67', 120, '*', 1, 'AP03', 'BU04')
INSERT INTO Apartments VALUES('APM68', 120, '*', 1, 'AP03', 'BU04')
INSERT INTO Apartments VALUES('APM69', 120, '*', 1, 'AP03', 'BU04')
INSERT INTO Apartments VALUES('APM70', 120, '*', 1, 'AP03', 'BU04')

INSERT INTO Apartments VALUES('APM71', 120, '*', 1, 'AP03', 'BU05')
INSERT INTO Apartments VALUES('APM72', 120, '*', 1, 'AP03', 'BU05')
INSERT INTO Apartments VALUES('APM73', 120, '*', 1, 'AP03', 'BU05')
INSERT INTO Apartments VALUES('APM74', 120, '*', 1, 'AP03', 'BU05')
INSERT INTO Apartments VALUES('APM75', 120, '*', 1, 'AP03', 'BU05')


INSERT INTO Apartments VALUES('APM46', 120, '*', 1, 'AP04', 'BU05')
INSERT INTO Apartments VALUES('APM47', 120, '*', 1, 'AP04', 'BU05')
INSERT INTO Apartments VALUES('APM48', 120, '*', 1, 'AP04', 'BU05')
INSERT INTO Apartments VALUES('APM49', 120, '*', 1, 'AP04', 'BU05')
INSERT INTO Apartments VALUES('APM50', 120, '*', 1, 'AP04', 'BU05')

INSERT INTO Troubles VALUES('TB01', N'Sự cố điện')
INSERT INTO Troubles VALUES('TB02', N'Sự cố nước')
INSERT INTO Troubles VALUES('TB03', N'Sự cố internet')
INSERT INTO Troubles VALUES('TB04', N'Sự cố an ninh')
INSERT INTO Troubles VALUES('TB05', N'Sự cố cơ sở vật chất')
INSERT INTO Troubles VALUES('TB06', N'Sự cố khác')

INSERT INTO Apart_Troubles VALUES( 'APM3', 'TB01', '11-11-2022', N'Mất điện', 0, 'TRAN50' )
INSERT INTO Apart_Troubles VALUES( 'APM69', 'TB01', '11-11-2022', N'Mất điện', 0, 'TRAN1' )
INSERT INTO Apart_Troubles VALUES( 'APM45', 'TB05', '11-11-2022', N'Tróc sơn tường', 1, 'TRAN2' )
INSERT INTO Apart_Troubles VALUES( 'APM8', 'TB06', '11-11-2022', N'Lỗi sai thông tin', 1, 'TRAN3' )
INSERT INTO Apart_Troubles VALUES( 'APM22', 'TB04', '11-11-2022', N'Mất TV', 0, 'TRAN4' )
INSERT INTO Apart_Troubles VALUES( 'APM28', 'TB02', '11-11-2022', N'Bễ ống nước', 1, 'TRAN5' )
INSERT INTO Apart_Troubles VALUES( 'APM53', 'TB02', '11-11-2022', N'Bễ ống nước', 0, 'TRAN6' )
INSERT INTO Apart_Troubles VALUES( 'APM17', 'TB06', '11-11-2022', N'Lỗi sai thông tin', 0, 'TRAN7' )
INSERT INTO Apart_Troubles VALUES( 'APM48', 'TB02', '11-11-2022', N'Bễ ống nước', 1, 'TRAN8' )
INSERT INTO Apart_Troubles VALUES( 'APM16', 'TB01', '11-11-2022', N'Mất điện', 1, 'TRAN9' )
INSERT INTO Apart_Troubles VALUES( 'APM27', 'TB01', '11-11-2022', N'Mất điện', 1, 'TRAN10' )
INSERT INTO Apart_Troubles VALUES( 'APM47', 'TB03', '11-11-2022', N'Mạng yếu', 1, 'TRAN11' )
INSERT INTO Apart_Troubles VALUES( 'APM67', 'TB02', '11-11-2022', N'Bễ ống nước', 0, 'TRAN12' )
INSERT INTO Apart_Troubles VALUES( 'APM39', 'TB04', '11-11-2022', N'Mất TV', 1, 'TRAN13' )
INSERT INTO Apart_Troubles VALUES( 'APM35', 'TB05', '11-11-2022', N'Tróc sơn tường', 1, 'TRAN14' )
INSERT INTO Apart_Troubles VALUES( 'APM47', 'TB02', '11-11-2022', N'Bễ ống nước', 0, 'TRAN15' )
INSERT INTO Apart_Troubles VALUES( 'APM73', 'TB05', '11-11-2022', N'Tróc sơn tường', 0, 'TRAN16' )
INSERT INTO Apart_Troubles VALUES( 'APM27', 'TB06', '11-11-2022', N'Lỗi sai thông tin', 0, 'TRAN17' )
INSERT INTO Apart_Troubles VALUES( 'APM15', 'TB06', '11-11-2022', N'Lỗi sai thông tin', 0, 'TRAN18' )
INSERT INTO Apart_Troubles VALUES( 'APM26', 'TB05', '11-11-2022', N'Tróc sơn tường', 0, 'TRAN19' )
INSERT INTO Apart_Troubles VALUES( 'APM62', 'TB06', '11-11-2022', N'Lỗi sai thông tin', 1, 'TRAN20' )
INSERT INTO Apart_Troubles VALUES( 'APM33', 'TB05', '11-11-2022', N'Tróc sơn tường', 1, 'TRAN21' )
INSERT INTO Apart_Troubles VALUES( 'APM37', 'TB04', '11-11-2022', N'Mất TV', 0, 'TRAN22' )
INSERT INTO Apart_Troubles VALUES( 'APM5', 'TB01', '11-11-2022', N'Mất điện', 0, 'TRAN23' )
INSERT INTO Apart_Troubles VALUES( 'APM62', 'TB06', '11-11-2022', N'Lỗi sai thông tin', 0, 'TRAN24' )
INSERT INTO Apart_Troubles VALUES( 'APM57', 'TB01', '11-11-2022', N'Mất điện', 1, 'TRAN25' )
INSERT INTO Apart_Troubles VALUES( 'APM10', 'TB04', '11-11-2022', N'Mất TV', 1, 'TRAN26' )
INSERT INTO Apart_Troubles VALUES( 'APM37', 'TB06', '11-11-2022', N'Lỗi sai thông tin', 1, 'TRAN27' )
INSERT INTO Apart_Troubles VALUES( 'APM19', 'TB05', '11-11-2022', N'Tróc sơn tường', 1, 'TRAN28' )
INSERT INTO Apart_Troubles VALUES( 'APM29', 'TB04', '11-11-2022', N'Mất TV', 0, 'TRAN29' )
INSERT INTO Apart_Troubles VALUES( 'APM14', 'TB03', '11-11-2022', N'Mạng yếu', 1, 'TRAN30' )
INSERT INTO Apart_Troubles VALUES( 'APM71', 'TB02', '11-11-2022', N'Bễ ống nước', 0, 'TRAN31' )
INSERT INTO Apart_Troubles VALUES( 'APM68', 'TB03', '11-11-2022', N'Mạng yếu', 1, 'TRAN32' )
INSERT INTO Apart_Troubles VALUES( 'APM71', 'TB01', '11-11-2022', N'Mất điện', 0, 'TRAN33' )
INSERT INTO Apart_Troubles VALUES( 'APM45', 'TB05', '11-11-2022', N'Tróc sơn tường', 0, 'TRAN34' )
INSERT INTO Apart_Troubles VALUES( 'APM28', 'TB06', '11-11-2022', N'Lỗi sai thông tin', 1, 'TRAN35' )
INSERT INTO Apart_Troubles VALUES( 'APM13', 'TB04', '11-11-2022', N'Mất TV', 0, 'TRAN36' )
INSERT INTO Apart_Troubles VALUES( 'APM61', 'TB03', '11-11-2022', N'Mạng yếu', 0, 'TRAN37' )
INSERT INTO Apart_Troubles VALUES( 'APM16', 'TB04', '11-11-2022', N'Mất TV', 0, 'TRAN38' )
INSERT INTO Apart_Troubles VALUES( 'APM43', 'TB04', '11-11-2022', N'Mất TV', 0, 'TRAN39' )
INSERT INTO Apart_Troubles VALUES( 'APM64', 'TB01', '11-11-2022', N'Mất điện', 0, 'TRAN40' )
INSERT INTO Apart_Troubles VALUES( 'APM4', 'TB06', '11-11-2022', N'Lỗi sai thông tin', 1, 'TRAN41' )
INSERT INTO Apart_Troubles VALUES( 'APM56', 'TB02', '11-11-2022', N'Bễ ống nước', 1, 'TRAN42' )
INSERT INTO Apart_Troubles VALUES( 'APM75', 'TB05', '11-11-2022', N'Tróc sơn tường', 1, 'TRAN43' )
INSERT INTO Apart_Troubles VALUES( 'APM43', 'TB04', '11-11-2022', N'Mất TV', 0, 'TRAN44' )
INSERT INTO Apart_Troubles VALUES( 'APM14', 'TB04', '11-11-2022', N'Mất TV', 0, 'TRAN45' )
INSERT INTO Apart_Troubles VALUES( 'APM15', 'TB05', '11-11-2022', N'Tróc sơn tường', 1, 'TRAN46' )
INSERT INTO Apart_Troubles VALUES( 'APM73', 'TB02', '11-11-2022', N'Bễ ống nước', 1, 'TRAN47' )
INSERT INTO Apart_Troubles VALUES( 'APM62', 'TB02', '11-11-2022', N'Bễ ống nước', 0, 'TRAN48' )
INSERT INTO Apart_Troubles VALUES( 'APM75', 'TB01', '11-11-2022', N'Mất điện', 1, 'TRAN49' )


INSERT INTO Contracts VALUES('CT01', '1-1-1999', '1-1-2049', 1, 'OWN1', 'APM35')
INSERT INTO Contracts VALUES('CT02', '1-1-1999', NULL, 1, 'OWN3', 'APM37')
INSERT INTO Contracts VALUES('CT03', '1-1-1999', NULL, 1, 'OWN4', 'APM49')
INSERT INTO Contracts VALUES('CT04', '1-1-1999', '1-1-2049', 1, 'OWN2', 'APM59')
INSERT INTO Contracts VALUES('CT05', '1-1-1999', NULL, 1, 'OWN5', 'APM64')

INSERT INTO Services VALUES('SV01', N'Điện', 2500, 1)
INSERT INTO Services VALUES('SV02', N'Nước', 12000, 1)
INSERT INTO Services VALUES('SV03', N'Wifi', 200000, 1)
INSERT INTO Services VALUES('SV04', N'Quản lí', 300000, 1)
INSERT INTO Services VALUES('SV05', N'Gym', 220000, 1)

INSERT INTO ContractServices VALUES('SV01','CT01')
INSERT INTO ContractServices VALUES('SV02','CT01')
INSERT INTO ContractServices VALUES('SV03','CT01')
INSERT INTO ContractServices VALUES('SV04','CT01')
INSERT INTO ContractServices VALUES('SV05','CT01')

INSERT INTO ContractServices VALUES('SV01','CT02')
INSERT INTO ContractServices VALUES('SV02','CT02')
INSERT INTO ContractServices VALUES('SV03','CT02')
INSERT INTO ContractServices VALUES('SV04','CT02')

INSERT INTO ContractServices VALUES('SV01','CT03')
INSERT INTO ContractServices VALUES('SV02','CT03')
INSERT INTO ContractServices VALUES('SV03','CT03')
INSERT INTO ContractServices VALUES('SV04','CT03')

INSERT INTO ContractServices VALUES('SV01','CT04')
INSERT INTO ContractServices VALUES('SV02','CT04')
INSERT INTO ContractServices VALUES('SV03','CT04')
INSERT INTO ContractServices VALUES('SV04','CT04')

INSERT INTO ContractServices VALUES('SV01','CT05')
INSERT INTO ContractServices VALUES('SV02','CT05')
INSERT INTO ContractServices VALUES('SV03','CT05')
INSERT INTO ContractServices VALUES('SV04','CT05')
INSERT INTO ContractServices VALUES('SV05','CT05')
/*35 37 49 59 64*/
INSERT INTO Bills VALUES('0101221', 3500000, 1, '01-01-2022', 'APM35')
INSERT INTO Bills VALUES('0201221', 3600000, 1, '02-01-2022', 'APM35')
INSERT INTO Bills VALUES('0301221', 3200000, 1, '03-01-2022', 'APM35')
INSERT INTO Bills VALUES('0401221', 3300000, 1, '04-01-2022', 'APM35')
INSERT INTO Bills VALUES('0501221', 3100000, 1, '05-01-2022', 'APM35')
INSERT INTO Bills VALUES('0601221', 3200000, 1, '06-01-2022', 'APM35')
INSERT INTO Bills VALUES('0701221', 3200000, 0, '07-01-2022', 'APM35')

INSERT INTO Bills VALUES('0101222', 3500000, 1, '01-01-2022', 'APM37')
INSERT INTO Bills VALUES('0201222', 3600000, 1, '02-01-2022', 'APM37')
INSERT INTO Bills VALUES('0301222', 3200000, 1, '03-01-2022', 'APM37')
INSERT INTO Bills VALUES('0401222', 3300000, 1, '04-01-2022', 'APM37')
INSERT INTO Bills VALUES('0501222', 3100000, 1, '05-01-2022', 'APM37')
INSERT INTO Bills VALUES('0601222', 3200000, 1, '06-01-2022', 'APM37')
INSERT INTO Bills VALUES('0701222', 3200000, 0, '07-01-2022', 'APM37')

INSERT INTO Bills VALUES('0101223', 3500000, 1, '01-01-2022', 'APM49')
INSERT INTO Bills VALUES('0201223', 3600000, 1, '02-01-2022', 'APM49')
INSERT INTO Bills VALUES('0301223', 3200000, 1, '03-01-2022', 'APM49')
INSERT INTO Bills VALUES('0401223', 3300000, 1, '04-01-2022', 'APM49')
INSERT INTO Bills VALUES('0501223', 3100000, 1, '05-01-2022', 'APM49')
INSERT INTO Bills VALUES('0601223', 3200000, 1, '06-01-2022', 'APM49')
INSERT INTO Bills VALUES('0701223', 3200000, 0, '07-01-2022', 'APM49')

INSERT INTO Bills VALUES('0101224', 3500000, 1, '01-01-2022', 'APM59')
INSERT INTO Bills VALUES('0201224', 3600000, 1, '02-01-2022', 'APM59')
INSERT INTO Bills VALUES('0301224', 3200000, 1, '03-01-2022', 'APM59')
INSERT INTO Bills VALUES('0401224', 3300000, 1, '04-01-2022', 'APM59')
INSERT INTO Bills VALUES('0501224', 3100000, 1, '05-01-2022', 'APM59')
INSERT INTO Bills VALUES('0601224', 3200000, 1, '06-01-2022', 'APM59')
INSERT INTO Bills VALUES('0701224', 3200000, 0, '07-01-2022', 'APM59')

INSERT INTO Bills VALUES('0101225', 3500000, 1, '01-01-2022', 'APM64')
INSERT INTO Bills VALUES('0201225', 3600000, 1, '02-01-2022', 'APM64')
INSERT INTO Bills VALUES('0301225', 3200000, 1, '03-01-2022', 'APM64')
INSERT INTO Bills VALUES('0401225', 3300000, 1, '04-01-2022', 'APM64')
INSERT INTO Bills VALUES('0501225', 3100000, 1, '05-01-2022', 'APM64')
INSERT INTO Bills VALUES('0601225', 3200000, 1, '06-01-2022', 'APM64')
INSERT INTO Bills VALUES('0701225', 3200000, 0, '07-01-2022', 'APM64')


INSERT INTO BillDetails VALUES('0101221', 'SV01', 100000)
INSERT INTO BillDetails VALUES('0101221', 'SV02', 100000)
INSERT INTO BillDetails VALUES('0101221', 'SV03', 100000)
INSERT INTO BillDetails VALUES('0101221', 'SV04', 100000)
INSERT INTO BillDetails VALUES('0101221', 'SV05', 100000)
INSERT INTO BillDetails VALUES('0201221', 'SV01', 400000)
INSERT INTO BillDetails VALUES('0201221', 'SV02', 400000)
INSERT INTO BillDetails VALUES('0201221', 'SV03', 400000)
INSERT INTO BillDetails VALUES('0201221', 'SV04', 400000)
INSERT INTO BillDetails VALUES('0201221', 'SV05', 400000)
INSERT INTO BillDetails VALUES('0301221', 'SV01', 500000)
INSERT INTO BillDetails VALUES('0301221', 'SV02', 500000)
INSERT INTO BillDetails VALUES('0301221', 'SV03', 500000)
INSERT INTO BillDetails VALUES('0301221', 'SV04', 500000)
INSERT INTO BillDetails VALUES('0301221', 'SV05', 500000)
INSERT INTO BillDetails VALUES('0401221', 'SV01', 400000)
INSERT INTO BillDetails VALUES('0401221', 'SV02', 400000)
INSERT INTO BillDetails VALUES('0401221', 'SV03', 400000)
INSERT INTO BillDetails VALUES('0401221', 'SV04', 400000)
INSERT INTO BillDetails VALUES('0401221', 'SV05', 400000)
INSERT INTO BillDetails VALUES('0501221', 'SV01', 500000)
INSERT INTO BillDetails VALUES('0501221', 'SV02', 500000)
INSERT INTO BillDetails VALUES('0501221', 'SV03', 500000)
INSERT INTO BillDetails VALUES('0501221', 'SV04', 500000)
INSERT INTO BillDetails VALUES('0501221', 'SV05', 500000)
INSERT INTO BillDetails VALUES('0601221', 'SV01', 100000)
INSERT INTO BillDetails VALUES('0601221', 'SV02', 100000)
INSERT INTO BillDetails VALUES('0601221', 'SV03', 100000)
INSERT INTO BillDetails VALUES('0601221', 'SV04', 100000)
INSERT INTO BillDetails VALUES('0601221', 'SV05', 100000)
INSERT INTO BillDetails VALUES('0701221', 'SV01', 300000)
INSERT INTO BillDetails VALUES('0701221', 'SV02', 300000)
INSERT INTO BillDetails VALUES('0701221', 'SV03', 300000)
INSERT INTO BillDetails VALUES('0701221', 'SV04', 300000)
INSERT INTO BillDetails VALUES('0701221', 'SV05', 300000)
INSERT INTO BillDetails VALUES('0101222', 'SV01', 100000)
INSERT INTO BillDetails VALUES('0101222', 'SV02', 100000)
INSERT INTO BillDetails VALUES('0101222', 'SV03', 100000)
INSERT INTO BillDetails VALUES('0101222', 'SV04', 100000)
INSERT INTO BillDetails VALUES('0201222', 'SV01', 500000)
INSERT INTO BillDetails VALUES('0201222', 'SV02', 500000)
INSERT INTO BillDetails VALUES('0201222', 'SV03', 500000)
INSERT INTO BillDetails VALUES('0201222', 'SV04', 500000)
INSERT INTO BillDetails VALUES('0301222', 'SV01', 400000)
INSERT INTO BillDetails VALUES('0301222', 'SV02', 400000)
INSERT INTO BillDetails VALUES('0301222', 'SV03', 400000)
INSERT INTO BillDetails VALUES('0301222', 'SV04', 400000)
INSERT INTO BillDetails VALUES('0401222', 'SV01', 300000)
INSERT INTO BillDetails VALUES('0401222', 'SV02', 300000)
INSERT INTO BillDetails VALUES('0401222', 'SV03', 300000)
INSERT INTO BillDetails VALUES('0401222', 'SV04', 300000)
INSERT INTO BillDetails VALUES('0501222', 'SV01', 100000)
INSERT INTO BillDetails VALUES('0501222', 'SV02', 100000)
INSERT INTO BillDetails VALUES('0501222', 'SV03', 100000)
INSERT INTO BillDetails VALUES('0501222', 'SV04', 100000)
INSERT INTO BillDetails VALUES('0601222', 'SV01', 300000)
INSERT INTO BillDetails VALUES('0601222', 'SV02', 300000)
INSERT INTO BillDetails VALUES('0601222', 'SV03', 300000)
INSERT INTO BillDetails VALUES('0601222', 'SV04', 300000)
INSERT INTO BillDetails VALUES('0701222', 'SV01', 100000)
INSERT INTO BillDetails VALUES('0701222', 'SV02', 100000)
INSERT INTO BillDetails VALUES('0701222', 'SV03', 100000)
INSERT INTO BillDetails VALUES('0701222', 'SV04', 100000)
INSERT INTO BillDetails VALUES('0101223', 'SV01', 500000)
INSERT INTO BillDetails VALUES('0101223', 'SV02', 500000)
INSERT INTO BillDetails VALUES('0101223', 'SV03', 500000)
INSERT INTO BillDetails VALUES('0101223', 'SV04', 500000)
INSERT INTO BillDetails VALUES('0201223', 'SV01', 100000)
INSERT INTO BillDetails VALUES('0201223', 'SV02', 100000)
INSERT INTO BillDetails VALUES('0201223', 'SV03', 100000)
INSERT INTO BillDetails VALUES('0201223', 'SV04', 100000)
INSERT INTO BillDetails VALUES('0301223', 'SV01', 500000)
INSERT INTO BillDetails VALUES('0301223', 'SV02', 500000)
INSERT INTO BillDetails VALUES('0301223', 'SV03', 500000)
INSERT INTO BillDetails VALUES('0301223', 'SV04', 500000)
INSERT INTO BillDetails VALUES('0401223', 'SV01', 200000)
INSERT INTO BillDetails VALUES('0401223', 'SV02', 200000)
INSERT INTO BillDetails VALUES('0401223', 'SV03', 200000)
INSERT INTO BillDetails VALUES('0401223', 'SV04', 200000)
INSERT INTO BillDetails VALUES('0501223', 'SV01', 200000)
INSERT INTO BillDetails VALUES('0501223', 'SV02', 200000)
INSERT INTO BillDetails VALUES('0501223', 'SV03', 200000)
INSERT INTO BillDetails VALUES('0501223', 'SV04', 200000)
INSERT INTO BillDetails VALUES('0601223', 'SV01', 400000)
INSERT INTO BillDetails VALUES('0601223', 'SV02', 400000)
INSERT INTO BillDetails VALUES('0601223', 'SV03', 400000)
INSERT INTO BillDetails VALUES('0601223', 'SV04', 400000)
INSERT INTO BillDetails VALUES('0701223', 'SV01', 100000)
INSERT INTO BillDetails VALUES('0701223', 'SV02', 100000)
INSERT INTO BillDetails VALUES('0701223', 'SV03', 100000)
INSERT INTO BillDetails VALUES('0701223', 'SV04', 100000)
INSERT INTO BillDetails VALUES('0101224', 'SV01', 100000)
INSERT INTO BillDetails VALUES('0101224', 'SV02', 100000)
INSERT INTO BillDetails VALUES('0101224', 'SV03', 100000)
INSERT INTO BillDetails VALUES('0101224', 'SV04', 100000)
INSERT INTO BillDetails VALUES('0201224', 'SV01', 400000)
INSERT INTO BillDetails VALUES('0201224', 'SV02', 400000)
INSERT INTO BillDetails VALUES('0201224', 'SV03', 400000)
INSERT INTO BillDetails VALUES('0201224', 'SV04', 400000)
INSERT INTO BillDetails VALUES('0301224', 'SV01', 300000)
INSERT INTO BillDetails VALUES('0301224', 'SV02', 300000)
INSERT INTO BillDetails VALUES('0301224', 'SV03', 300000)
INSERT INTO BillDetails VALUES('0301224', 'SV04', 300000)
INSERT INTO BillDetails VALUES('0401224', 'SV01', 400000)
INSERT INTO BillDetails VALUES('0401224', 'SV02', 400000)
INSERT INTO BillDetails VALUES('0401224', 'SV03', 400000)
INSERT INTO BillDetails VALUES('0401224', 'SV04', 400000)
INSERT INTO BillDetails VALUES('0501224', 'SV01', 500000)
INSERT INTO BillDetails VALUES('0501224', 'SV02', 500000)
INSERT INTO BillDetails VALUES('0501224', 'SV03', 500000)
INSERT INTO BillDetails VALUES('0501224', 'SV04', 500000)
INSERT INTO BillDetails VALUES('0601224', 'SV01', 400000)
INSERT INTO BillDetails VALUES('0601224', 'SV02', 400000)
INSERT INTO BillDetails VALUES('0601224', 'SV03', 400000)
INSERT INTO BillDetails VALUES('0601224', 'SV04', 400000)
INSERT INTO BillDetails VALUES('0701224', 'SV01', 100000)
INSERT INTO BillDetails VALUES('0701224', 'SV02', 100000)
INSERT INTO BillDetails VALUES('0701224', 'SV03', 100000)
INSERT INTO BillDetails VALUES('0701224', 'SV04', 100000)
INSERT INTO BillDetails VALUES('0101225', 'SV01', 500000)
INSERT INTO BillDetails VALUES('0101225', 'SV02', 500000)
INSERT INTO BillDetails VALUES('0101225', 'SV03', 500000)
INSERT INTO BillDetails VALUES('0101225', 'SV04', 500000)
INSERT INTO BillDetails VALUES('0101225', 'SV05', 500000)
INSERT INTO BillDetails VALUES('0201225', 'SV01', 300000)
INSERT INTO BillDetails VALUES('0201225', 'SV02', 300000)
INSERT INTO BillDetails VALUES('0201225', 'SV03', 300000)
INSERT INTO BillDetails VALUES('0201225', 'SV04', 300000)
INSERT INTO BillDetails VALUES('0201225', 'SV05', 300000)
INSERT INTO BillDetails VALUES('0301225', 'SV01', 100000)
INSERT INTO BillDetails VALUES('0301225', 'SV02', 100000)
INSERT INTO BillDetails VALUES('0301225', 'SV03', 100000)
INSERT INTO BillDetails VALUES('0301225', 'SV04', 100000)
INSERT INTO BillDetails VALUES('0301225', 'SV05', 100000)
INSERT INTO BillDetails VALUES('0401225', 'SV01', 400000)
INSERT INTO BillDetails VALUES('0401225', 'SV02', 400000)
INSERT INTO BillDetails VALUES('0401225', 'SV03', 400000)
INSERT INTO BillDetails VALUES('0401225', 'SV04', 400000)
INSERT INTO BillDetails VALUES('0401225', 'SV05', 400000)
INSERT INTO BillDetails VALUES('0501225', 'SV01', 500000)
INSERT INTO BillDetails VALUES('0501225', 'SV02', 500000)
INSERT INTO BillDetails VALUES('0501225', 'SV03', 500000)
INSERT INTO BillDetails VALUES('0501225', 'SV04', 500000)
INSERT INTO BillDetails VALUES('0501225', 'SV05', 500000)
INSERT INTO BillDetails VALUES('0601225', 'SV01', 500000)
INSERT INTO BillDetails VALUES('0601225', 'SV02', 500000)
INSERT INTO BillDetails VALUES('0601225', 'SV03', 500000)
INSERT INTO BillDetails VALUES('0601225', 'SV04', 500000)
INSERT INTO BillDetails VALUES('0601225', 'SV05', 500000)
INSERT INTO BillDetails VALUES('0701225', 'SV01', 400000)
INSERT INTO BillDetails VALUES('0701225', 'SV02', 400000)
INSERT INTO BillDetails VALUES('0701225', 'SV03', 400000)
INSERT INTO BillDetails VALUES('0701225', 'SV04', 400000)
INSERT INTO BillDetails VALUES('0701225', 'SV05', 400000)

INSERT INTO Banks VALUES('BANK01', N'VietcomBank')
INSERT INTO Banks VALUES('BANK02', N'Tien Phong Bank')

INSERT INTO BankAccounts VALUES('01238454', '4238643463422', '123456', '465', N'Nguyễn Phương Nhật Linh', 3000000000, 'BANK01')
INSERT INTO BankAccounts VALUES('01238464', '4238643463423', '654321', '985', N'Đặng Nguyễn Phú Thịnh', 2000000000, 'BANK02')
INSERT INTO BankAccounts VALUES('01238474', '4238643463424', '234567', '242', N'Huỳnh Đỗ Minh Hoàng', 4000000000, 'BANK02')
INSERT INTO BankAccounts VALUES('01238484', '4238643463425', '765432', '454', N'Đỗ Hải Triều', 3000000000, 'BANK01')

INSERT INTO ServiceDetails VALUES('DE1', 300, 400, 100, '01-19-2003', 'SV01')
INSERT INTO ServiceDetails VALUES('DE2', 100, 400, 300, '01-28-2000', 'SV01')
INSERT INTO ServiceDetails VALUES('DE3', 200, 200, 0, '06-17-2017', 'SV01')
INSERT INTO ServiceDetails VALUES('DE4', 200, 200, 0, '05-10-2002', 'SV01')
INSERT INTO ServiceDetails VALUES('DE5', 300, 400, 100, '05-02-2014', 'SV02')
INSERT INTO ServiceDetails VALUES('DE6', 300, 400, 100, '06-10-2001', 'SV02')
INSERT INTO ServiceDetails VALUES('DE7', 400, 400, 0, '02-03-2015', 'SV01')
INSERT INTO ServiceDetails VALUES('DE8', 400, 400, 0, '05-05-2005', 'SV01')
INSERT INTO ServiceDetails VALUES('DE9', 100, 500, 400, '02-22-2004', 'SV02')
INSERT INTO ServiceDetails VALUES('DE10', 500, 500, 0, '03-13-2009', 'SV02')
INSERT INTO ServiceDetails VALUES('DE11', 200, 400, 200, '05-05-2014', 'SV02')
INSERT INTO ServiceDetails VALUES('DE12', 500, 500, 0, '03-20-2020', 'SV01')
INSERT INTO ServiceDetails VALUES('DE13', 200, 500, 300, '05-18-2000', 'SV01')
INSERT INTO ServiceDetails VALUES('DE14', 300, 500, 200, '03-01-2015', 'SV02')
INSERT INTO ServiceDetails VALUES('DE15', 100, 500, 400, '03-21-2020', 'SV02')
INSERT INTO ServiceDetails VALUES('DE16', 400, 400, 0, '03-13-2011', 'SV01')
INSERT INTO ServiceDetails VALUES('DE17', 300, 400, 100, '02-11-2001', 'SV01')
INSERT INTO ServiceDetails VALUES('DE18', 100, 200, 100, '05-20-2011', 'SV01')
INSERT INTO ServiceDetails VALUES('DE19', 200, 400, 200, '02-18-2015', 'SV01')
INSERT INTO ServiceDetails VALUES('DE20', 300, 400, 100, '03-21-2014', 'SV01')
INSERT INTO ServiceDetails VALUES('DE21', 400, 400, 0, '02-13-2014', 'SV02')
INSERT INTO ServiceDetails VALUES('DE22', 100, 300, 200, '04-29-2008', 'SV02')
INSERT INTO ServiceDetails VALUES('DE23', 300, 400, 100, '02-08-2012', 'SV02')
INSERT INTO ServiceDetails VALUES('DE24', 300, 400, 100, '01-07-2020', 'SV01')
INSERT INTO ServiceDetails VALUES('DE25', 200, 400, 200, '02-11-2000', 'SV02')
INSERT INTO ServiceDetails VALUES('DE26', 200, 400, 200, '06-14-2006', 'SV01')
INSERT INTO ServiceDetails VALUES('DE27', 300, 400, 100, '04-14-2014', 'SV02')
INSERT INTO ServiceDetails VALUES('DE28', 100, 400, 300, '05-20-2004', 'SV02')
INSERT INTO ServiceDetails VALUES('DE29', 100, 500, 400, '06-27-2010', 'SV02')
INSERT INTO ServiceDetails VALUES('DE30', 400, 500, 100, '06-07-2005', 'SV01')
INSERT INTO ServiceDetails VALUES('DE31', 100, 300, 200, '03-23-2000', 'SV02')
INSERT INTO ServiceDetails VALUES('DE32', 200, 300, 100, '06-20-2007', 'SV02')
INSERT INTO ServiceDetails VALUES('DE33', 100, 500, 400, '02-19-2012', 'SV01')
INSERT INTO ServiceDetails VALUES('DE34', 300, 500, 200, '04-23-2020', 'SV01')
INSERT INTO ServiceDetails VALUES('DE35', 400, 400, 0, '01-11-2001', 'SV02')
INSERT INTO ServiceDetails VALUES('DE36', 400, 500, 100, '03-09-2004', 'SV01')
INSERT INTO ServiceDetails VALUES('DE37', 100, 500, 400, '05-26-2016', 'SV02')
INSERT INTO ServiceDetails VALUES('DE38', 300, 500, 200, '03-11-2004', 'SV02')
INSERT INTO ServiceDetails VALUES('DE39', 100, 100, 0, '01-30-2013', 'SV01')
INSERT INTO ServiceDetails VALUES('DE40', 400, 500, 100, '01-20-2017', 'SV02')
INSERT INTO ServiceDetails VALUES('DE41', 400, 500, 100, '04-03-2001', 'SV02')
INSERT INTO ServiceDetails VALUES('DE42', 300, 300, 0, '06-24-2008', 'SV02')
INSERT INTO ServiceDetails VALUES('DE43', 300, 500, 200, '02-08-2018', 'SV02')
INSERT INTO ServiceDetails VALUES('DE44', 300, 400, 100, '03-08-2009', 'SV02')
INSERT INTO ServiceDetails VALUES('DE45', 100, 500, 400, '01-21-2015', 'SV02')
INSERT INTO ServiceDetails VALUES('DE46', 100, 400, 300, '01-10-2020', 'SV01')
INSERT INTO ServiceDetails VALUES('DE47', 200, 500, 300, '02-23-2005', 'SV01')
INSERT INTO ServiceDetails VALUES('DE48', 300, 400, 100, '06-16-2018', 'SV01')
INSERT INTO ServiceDetails VALUES('DE49', 400, 500, 100, '01-24-2005', 'SV02')
INSERT INTO ServiceDetails VALUES('DE50', 300, 400, 100, '02-22-2006', 'SV01')

