-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `tbComputerInventory`;
CREATE TABLE `tbComputerInventory` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `ComputerTargetId` varchar(255) NOT NULL,
  `ClassID` int(5) NOT NULL,
  `PropertyID` int(5) NOT NULL,
  `Value` varchar(256) NOT NULL,
  `InstanceId` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ClassID` (`ClassID`),
  KEY `PropertyID` (`PropertyID`),
  KEY `ComputerTargetId` (`ComputerTargetId`),
  CONSTRAINT `tbComputerInventory_ibfk_2` FOREIGN KEY (`PropertyID`) REFERENCES `tbInventoryProperty` (`PropertyID`),
  CONSTRAINT `tbComputerInventory_ibfk_3` FOREIGN KEY (`ClassID`) REFERENCES `tbInventoryClass` (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tbComputerSoftInventory`;
CREATE TABLE `tbComputerSoftInventory` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `ComputerTargetId` varchar(255) NOT NULL,
  `PropertyID` int(5) NOT NULL,
  `Value` varchar(256) NOT NULL,
  `InstanceId` int(5) NOT NULL,
  `SnapshotId` int(5) DEFAULT NULL,
  `SnapshotDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ComputerTargetId` (`ComputerTargetId`),
  KEY `PropertyID` (`PropertyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tbComputerTarget`;
CREATE TABLE `tbComputerTarget` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `ComputerTargetId` varchar(255) NOT NULL,
  `Name` varchar(256) NOT NULL,
  `LastReportedInventoryTime` datetime DEFAULT NULL,
  `LastReportedSoftInventoryTime` datetime DEFAULT NULL,
  `LastReportedUpdatesInventoryTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ComputerTargetId` (`ComputerTargetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tbComputerUpdatesInventory`;
CREATE TABLE `tbComputerUpdatesInventory` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `ComputerTargetId` varchar(255) NOT NULL,
  `PropertyID` int(5) NOT NULL,
  `Value` varchar(256) NOT NULL,
  `InstanceId` int(5) NOT NULL,
  `SnapshotId` int(5) DEFAULT NULL,
  `SnapshotDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ComputerTargetId` (`ComputerTargetId`),
  KEY `PropertyID` (`PropertyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tbInventoryClass`;
CREATE TABLE `tbInventoryClass` (
  `ClassID` int(5) NOT NULL,
  `Name` varchar(256) NOT NULL,
  `Namespace` varchar(256) NOT NULL DEFAULT 'root\\cimv2',
  `Enabled` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbInventoryClass` (`ClassID`, `Name`, `Namespace`, `Enabled`) VALUES
(1,	'Win32_BIOS',	'root\\cimv2',	1),
(2,	'Win32_ComputerSystem',	'root\\cimv2',	1),
(3,	'Win32_DesktopMonitor',	'root\\cimv2',	1),
(4,	'Win32_DiskDrive',	'root\\cimv2',	1),
(5,	'Win32_LogicalDisk',	'root\\cimv2',	1),
(6,	'Win32_NetworkAdapter',	'root\\cimv2',	1),
(7,	'Win32_NetworkAdapterConfiguration',	'root\\cimv2',	1),
(8,	'Win32_OperatingSystem',	'root\\cimv2',	1),
(10,	'Win32_Printer',	'root\\cimv2',	1),
(11,	'Win32_Processor',	'root\\cimv2',	1),
(12,	'Win32_SoundDevice',	'root\\cimv2',	1),
(13,	'Win32_VideoController',	'root\\cimv2',	1),
(15,	'Win32_PhysicalMemory',	'root\\cimv2',	1),
(16,	'Win32_BaseBoard',	'root\\cimv2',	1),
(17,	'Win32_IDEController',	'root\\cimv2',	1),
(18,	'Win32_SCSIController',	'root\\cimv2',	1),
(19,	'Win32_USBController',	'root\\cimv2',	1),
(20,	'Win32_USBHub',	'root\\cimv2',	1),
(21,	'Win32_PointingDevice',	'root\\cimv2',	1),
(22,	'Win32_Keyboard',	'root\\cimv2',	1),
(23,	'Win32_SerialPort',	'root\\cimv2',	1),
(24,	'Win32_ParallelPort',	'root\\cimv2',	1),
(25,	'Win32_ComputerSystemProduct',	'root\\cimv2',	1),
(26,	'Win32_DiskDriveToDiskPartition',	'root\\cimv2',	1),
(27,	'Win32_LogicalDiskToPartition',	'root\\cimv2',	1),
(28,	'Win32_PhysicalMemoryArray',	'root\\cimv2',	1),
(90,	'Win32_Product',	'root\\cimv2',	0),
(91,	'SoftwareLicensingProduct',	'root\\cimv2',	0),
(92,	'MSStorageDriver_FailurePredictStatus ',	'root\\wmi',	1),
(93,	'Win32_QuickFixEngineering',	'root\\cimv2',	0);

DROP TABLE IF EXISTS `tbInventoryProperty`;
CREATE TABLE `tbInventoryProperty` (
  `PropertyID` int(5) NOT NULL,
  `ClassID` int(5) NOT NULL,
  `Name` varchar(256) NOT NULL,
  `Type` varchar(10) NOT NULL,
  PRIMARY KEY (`PropertyID`),
  KEY `ClassID` (`ClassID`),
  CONSTRAINT `tbInventoryProperty_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `tbInventoryClass` (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbInventoryProperty` (`PropertyID`, `ClassID`, `Name`, `Type`) VALUES
(1,	11,	'DeviceID',	'String'),
(2,	11,	'Architecture',	'UInt16'),
(3,	11,	'MaxClockSpeed',	'UInt32'),
(4,	11,	'Name',	'String'),
(5,	1,	'Name',	'String'),
(6,	1,	'Version',	'String'),
(7,	1,	'Manufacturer',	'String'),
(8,	1,	'ReleaseDate',	'DateTime'),
(13,	8,	'Name',	'String'),
(14,	8,	'BuildNumber',	'String'),
(15,	8,	'Caption',	'String'),
(16,	8,	'OSProductSuite',	'UInt32'),
(17,	8,	'OSLanguage',	'UInt32'),
(18,	8,	'OtherTypeDescription',	'String'),
(19,	8,	'ProductType',	'UInt32'),
(20,	8,	'SerialNumber',	'String'),
(21,	8,	'ServicePackMajorVersion',	'UInt16'),
(22,	8,	'ServicePackMinorVersion',	'UInt16'),
(23,	8,	'Version',	'String'),
(24,	4,	'DeviceID',	'String'),
(25,	4,	'Name',	'String'),
(26,	4,	'Caption',	'String'),
(27,	4,	'Manufacturer',	'String'),
(28,	4,	'Model',	'String'),
(29,	4,	'InterfaceType',	'String'),
(30,	4,	'Partitions',	'UInt32'),
(31,	4,	'size',	'UInt64'),
(32,	5,	'DeviceID',	'String'),
(33,	5,	'Name',	'String'),
(34,	5,	'DriveType',	'UInt32'),
(35,	5,	'VolumeName',	'String'),
(36,	5,	'FileSystem',	'String'),
(37,	5,	'Size',	'UInt64'),
(38,	5,	'FreeSpace',	'UInt64'),
(39,	7,	'Index',	'UInt32'),
(40,	7,	'Caption',	'String'),
(41,	7,	'Description',	'String'),
(42,	7,	'DHCPEnabled',	'Boolean'),
(43,	7,	'DHCPLeaseExpires',	'DateTime'),
(44,	7,	'DHCPLeaseObtained',	'DateTime'),
(45,	7,	'DHCPServer',	'String'),
(46,	7,	'DNSDomain',	'String'),
(47,	7,	'DNSEnabledForWINSResolution',	'Boolean'),
(48,	7,	'DNSHostName',	'String'),
(49,	7,	'DomainDNSRegistrationEnabled',	'Boolean'),
(50,	7,	'IPAddress',	'String'),
(51,	7,	'IPFilterSecurityEnabled',	'Boolean'),
(52,	7,	'IPPortSecurityEnabled',	'Boolean'),
(53,	7,	'WINSEnableLMHostsLookup',	'Boolean'),
(54,	7,	'WINSHostLookupFile',	'String'),
(55,	7,	'WINSPrimaryServer',	'String'),
(56,	7,	'WINSScopeID',	'String'),
(57,	7,	'WINSSecondaryServer',	'String'),
(58,	6,	'DeviceID',	'String'),
(59,	6,	'Index',	'UInt32'),
(60,	6,	'Name',	'String'),
(61,	6,	'Caption',	'String'),
(62,	6,	'Description',	'String'),
(63,	6,	'Manufacturer',	'String'),
(64,	6,	'ProductName',	'String'),
(65,	6,	'MACAddress',	'String'),
(66,	6,	'Speed',	'UInt64'),
(67,	6,	'MaxSpeed',	'UInt64'),
(68,	6,	'NetConnectionStatus',	'UInt16'),
(69,	6,	'NetConnectionID',	'String'),
(70,	12,	'DeviceID',	'String'),
(71,	12,	'Name',	'String'),
(72,	12,	'Manufacturer',	'String'),
(73,	13,	'DeviceID',	'String'),
(74,	13,	'Description',	'String'),
(75,	13,	'AdapterRAM',	'UInt32'),
(76,	13,	'DriverDate',	'DateTime'),
(77,	13,	'VideoModeDescription',	'String'),
(78,	3,	'DeviceID',	'String'),
(79,	3,	'Name',	'String'),
(80,	3,	'MonitorManufacturer',	'String'),
(81,	3,	'PixelsPerXLogicalInch',	'UInt32'),
(82,	3,	'PixelsPerYLogicalInch',	'UInt32'),
(83,	3,	'ScreenHeight',	'UInt32'),
(84,	3,	'ScreenWidth',	'UInt32'),
(85,	2,	'Name',	'String'),
(86,	2,	'Manufacturer',	'String'),
(87,	2,	'Model',	'String'),
(88,	2,	'TotalPhysicalMemory',	'UInt64'),
(89,	10,	'DeviceID',	'String'),
(90,	10,	'Name',	'String'),
(91,	10,	'Local',	'Boolean'),
(92,	10,	'Network',	'Boolean'),
(93,	10,	'Location',	'String'),
(94,	10,	'Comment',	'String'),
(95,	10,	'DriverName',	'String'),
(96,	10,	'Shared',	'Boolean'),
(97,	10,	'ShareName',	'String'),
(103,	15,	'Caption',	'String'),
(104,	15,	'Name',	'String'),
(105,	15,	'DeviceLocator',	'String'),
(106,	15,	'Capacity',	'UInt32'),
(107,	15,	'Speed',	'UInt16'),
(108,	15,	'MemoryType',	'UInt16'),
(109,	15,	'Manufacturer',	'String'),
(110,	13,	'DriverVersion',	'String'),
(111,	11,	'NumberOfCores',	'UInt16'),
(112,	11,	'NumberOfLogicalProcessors',	'UInt16'),
(113,	16,	'Manufacturer',	'String'),
(114,	16,	'Product',	'String'),
(115,	16,	'Model',	'String'),
(116,	16,	'SerialNumber',	'String'),
(117,	8,	'OSArchitecture',	'String'),
(118,	7,	'IPEnabled',	'Boolean'),
(119,	17,	'DriverName',	'String'),
(120,	17,	'Manufacturer',	'String'),
(121,	17,	'Name',	'String'),
(122,	17,	'ProtocolSupported',	'UInt16'),
(123,	17,	'Status',	'String'),
(124,	17,	'StatusInfo',	'UInt16'),
(126,	18,	'DriverName',	'String'),
(127,	18,	'Manufacturer',	'String'),
(128,	18,	'Name',	'String'),
(129,	18,	'ProtocolSupported',	'UInt16'),
(130,	18,	'Status',	'String'),
(131,	18,	'StatusInfo',	'UInt16'),
(132,	19,	'Caption',	'String'),
(133,	19,	'Description',	'String'),
(134,	19,	'DeviceID',	'String'),
(135,	19,	'Manufacturer',	'String'),
(136,	19,	'Name',	'String'),
(137,	19,	'ProtocolSupported',	'UInt16'),
(138,	19,	'Status',	'String'),
(139,	19,	'StatusInfo',	'UInt16'),
(140,	19,	'PNPDeviceID',	'String'),
(141,	20,	'Caption',	'String'),
(142,	20,	'Description',	'String'),
(143,	20,	'DeviceID',	'String'),
(145,	20,	'Name',	'String'),
(146,	20,	'ProtocolCode',	'UInt16'),
(147,	20,	'Status',	'String'),
(148,	20,	'StatusInfo',	'UInt16'),
(149,	20,	'PNPDeviceID',	'String'),
(150,	21,	'Caption',	'String'),
(151,	21,	'Description',	'String'),
(152,	21,	'DeviceID',	'String'),
(153,	21,	'Manufacturer',	'String'),
(154,	21,	'Name',	'String'),
(155,	21,	'HardwareType',	'String'),
(156,	21,	'Status',	'String'),
(157,	21,	'StatusInfo',	'UInt16'),
(158,	21,	'PNPDeviceID',	'String'),
(159,	21,	'PointingType',	'UInt16'),
(160,	21,	'NumberOfButtons',	'UInt16'),
(161,	21,	'QuadSpeedThreshold',	'String'),
(162,	21,	'Resolution',	'String'),
(163,	21,	'SampleRate',	'String'),
(164,	22,	'Caption',	'String'),
(165,	22,	'Description',	'String'),
(166,	22,	'DeviceID',	'String'),
(168,	22,	'Name',	'String'),
(170,	22,	'Status',	'String'),
(171,	22,	'StatusInfo',	'UInt16'),
(172,	22,	'PNPDeviceID',	'String'),
(173,	23,	'Caption',	'String'),
(174,	23,	'Description',	'String'),
(175,	23,	'DeviceID',	'String'),
(177,	23,	'Name',	'String'),
(179,	23,	'Status',	'String'),
(180,	23,	'StatusInfo',	'UInt16'),
(181,	23,	'PNPDeviceID',	'String'),
(182,	24,	'Caption',	'String'),
(183,	24,	'Description',	'String'),
(184,	24,	'DeviceID',	'String'),
(186,	24,	'Name',	'String'),
(188,	24,	'Status',	'String'),
(189,	24,	'StatusInfo',	'UInt16'),
(190,	24,	'PNPDeviceID',	'String'),
(191,	8,	'InstallDate',	'DateTime'),
(192,	2,	'Description',	'String'),
(193,	8,	'Description',	'String'),
(194,	25,	'UUID',	'String'),
(195,	6,	'GUID',	'String'),
(196,	2,	'PCSystemType',	'UInt16'),
(197,	4,	'PNPDeviceID',	'String'),
(198,	26,	'Antecedent',	'String'),
(199,	26,	'Dependent',	'String'),
(200,	27,	'Antecedent',	'String'),
(201,	27,	'Dependent',	'String'),
(202,	28,	'Name',	'String'),
(203,	28,	'MaxCapacity',	'UInt32'),
(204,	28,	'MemoryDevices',	'UInt16'),
(205,	15,	'BankLabel',	'String'),
(206,	11,	'Manufacturer',	'String'),
(207,	11,	'Description',	'String'),
(901,	90,	'Name',	'String'),
(902,	90,	'Version',	'String'),
(903,	90,	'Vendor',	'String'),
(904,	90,	'InstallDate',	'DateTime'),
(905,	90,	'IdentifyingNumber',	'String'),
(910,	91,	'Name',	'String'),
(911,	91,	'ApplicationId',	'String'),
(912,	91,	'LicenseStatus',	'UInt16'),
(913,	91,	'ProductKeyChannel',	'String'),
(920,	92,	'InstanceName',	'String'),
(921,	92,	'PredictFailure',	'Boolean'),
(922,	92,	'Reason',	'UInt32'),
(930,	93,	'Description',	'String'),
(931,	93,	'HotFixID',	'String'),
(932,	93,	'InstalledOn',	'DateTime');

DROP VIEW IF EXISTS `vwComputerInventory`;
CREATE TABLE `vwComputerInventory` (`Name` varchar(256), `ClassName` varchar(256), `PropertyName` varchar(256), `Value` varchar(256), `InstanceId` int(5));


DROP VIEW IF EXISTS `vwComputerSoftInventory`;
CREATE TABLE `vwComputerSoftInventory` (`Name` varchar(256), `PropertyName` varchar(256), `Value` varchar(256), `InstanceId` int(5));


DROP VIEW IF EXISTS `vwComputerUpdatesInventory`;
CREATE TABLE `vwComputerUpdatesInventory` (`Name` varchar(256), `PropertyName` varchar(256), `Value` varchar(256), `InstanceId` int(5));


DROP TABLE IF EXISTS `vwComputerInventory`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vwComputerInventory` AS select `tbComputerTarget`.`Name` AS `Name`,`tbInventoryClass`.`Name` AS `ClassName`,`tbInventoryProperty`.`Name` AS `PropertyName`,`tbComputerInventory`.`Value` AS `Value`,`tbComputerInventory`.`InstanceId` AS `InstanceId` from (((`tbComputerInventory` join `tbInventoryClass` on((`tbComputerInventory`.`ClassID` = `tbInventoryClass`.`ClassID`))) join `tbInventoryProperty` on((`tbComputerInventory`.`PropertyID` = `tbInventoryProperty`.`PropertyID`))) join `tbComputerTarget` on((`tbComputerInventory`.`ComputerTargetId` = `tbComputerTarget`.`ComputerTargetId`))) order by `tbComputerTarget`.`Name`;

DROP TABLE IF EXISTS `vwComputerSoftInventory`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vwComputerSoftInventory` AS select `tbComputerTarget`.`Name` AS `Name`,`tbInventoryProperty`.`Name` AS `PropertyName`,`tbComputerSoftInventory`.`Value` AS `Value`,`tbComputerSoftInventory`.`InstanceId` AS `InstanceId` from ((`tbComputerSoftInventory` join `tbInventoryProperty` on((`tbComputerSoftInventory`.`PropertyID` = `tbInventoryProperty`.`PropertyID`))) join `tbComputerTarget` on((`tbComputerSoftInventory`.`ComputerTargetId` = `tbComputerTarget`.`ComputerTargetId`))) order by `tbComputerTarget`.`Name`;

DROP TABLE IF EXISTS `vwComputerUpdatesInventory`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vwComputerUpdatesInventory` AS select `tbComputerTarget`.`Name` AS `Name`,`tbInventoryProperty`.`Name` AS `PropertyName`,`tbComputerUpdatesInventory`.`Value` AS `Value`,`tbComputerUpdatesInventory`.`InstanceId` AS `InstanceId` from ((`tbComputerUpdatesInventory` join `tbInventoryProperty` on((`tbComputerUpdatesInventory`.`PropertyID` = `tbInventoryProperty`.`PropertyID`))) join `tbComputerTarget` on((`tbComputerUpdatesInventory`.`ComputerTargetId` = `tbComputerTarget`.`ComputerTargetId`))) order by `tbComputerTarget`.`Name`;

-- 2018-05-25 04:11:36
