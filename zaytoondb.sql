-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2022 at 01:26 AM
-- Server version: 10.4.22-MariaDB-log
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zaytoondb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblbranches`
--

CREATE TABLE `tblbranches` (
  `Id` int(11) NOT NULL,
  `Code` varchar(15) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Phone1` varchar(15) DEFAULT NULL,
  `Phone2` varchar(15) DEFAULT NULL,
  `Phone3` varchar(15) DEFAULT NULL,
  `Address` varchar(550) DEFAULT NULL,
  `Notes` varchar(550) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblcategories`
--

CREATE TABLE `tblcategories` (
  `Id` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `CategoryType` varchar(50) DEFAULT NULL,
  `Notes` varchar(550) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblcities`
--

CREATE TABLE `tblcities` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `CountryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblclientdiscounts`
--

CREATE TABLE `tblclientdiscounts` (
  `Id` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `ClientId` int(11) NOT NULL,
  `Discount` decimal(9,2) NOT NULL,
  `DiscountType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblclientphones`
--

CREATE TABLE `tblclientphones` (
  `Id` int(11) NOT NULL,
  `ClientId` int(11) DEFAULT NULL,
  `Phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblclients`
--

CREATE TABLE `tblclients` (
  `Id` int(11) NOT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Address` varchar(550) DEFAULT NULL,
  `Balance` decimal(12,2) NOT NULL,
  `TransactionMethod` varchar(50) DEFAULT NULL,
  `CreditLimit` decimal(12,2) NOT NULL,
  `RegionId` int(11) NOT NULL,
  `InstantDiscount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `DeferredDiscount` decimal(12,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblcountries`
--

CREATE TABLE `tblcountries` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblemployee`
--

CREATE TABLE `tblemployee` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Address` varchar(550) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `JobId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblgroups`
--

CREATE TABLE `tblgroups` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblinventory`
--

CREATE TABLE `tblinventory` (
  `Id` int(11) NOT NULL,
  `WarehouseId` int(11) NOT NULL,
  `ItemId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblitemdetails`
--

CREATE TABLE `tblitemdetails` (
  `Id` int(11) NOT NULL,
  `ItemId` int(11) NOT NULL,
  `UnitId` int(11) NOT NULL,
  `Price` decimal(12,2) NOT NULL,
  `Barcode` varchar(20) DEFAULT NULL,
  `PiecesCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblitems`
--

CREATE TABLE `tblitems` (
  `Id` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `SizeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbljobs`
--

CREATE TABLE `tbljobs` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Notes` varchar(550) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblorderdetails`
--

CREATE TABLE `tblorderdetails` (
  `Id` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  `ItemDetailId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblorders`
--

CREATE TABLE `tblorders` (
  `Id` int(11) NOT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `OrderDate` datetime NOT NULL,
  `ClientId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblpackagedetails`
--

CREATE TABLE `tblpackagedetails` (
  `Id` int(11) NOT NULL,
  `PackageId` int(11) NOT NULL,
  `ItemDetailId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblpackages`
--

CREATE TABLE `tblpackages` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Barcode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblpayments`
--

CREATE TABLE `tblpayments` (
  `Id` int(11) NOT NULL,
  `ClientId` int(11) NOT NULL,
  `PaymentDate` datetime NOT NULL,
  `PreviousBalance` decimal(12,2) NOT NULL,
  `Amount` decimal(12,2) NOT NULL,
  `NewBalance` decimal(12,2) NOT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `CheckNumber` varchar(50) DEFAULT NULL,
  `BankName` varchar(50) DEFAULT NULL,
  `CheckHolderName` varchar(50) DEFAULT NULL,
  `CheckValue` decimal(12,2) DEFAULT NULL,
  `TransferFrom` varchar(50) DEFAULT NULL,
  `TransferTo` varchar(50) DEFAULT NULL,
  `DueDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblproducts`
--

CREATE TABLE `tblproducts` (
  `Id` int(11) NOT NULL,
  `Code` varchar(20) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `MinLimit` int(11) NOT NULL,
  `MaxLimit` int(11) NOT NULL,
  `Description` varchar(550) DEFAULT NULL,
  `CategoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblregions`
--

CREATE TABLE `tblregions` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `CityId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblsales`
--

CREATE TABLE `tblsales` (
  `Id` int(11) NOT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `SalesDate` datetime NOT NULL,
  `ClientId` int(11) NOT NULL,
  `WarehouseId` int(11) NOT NULL,
  `GrandTotal` decimal(10,2) NOT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `IsDone` tinyint(1) NOT NULL,
  `InvoiceType` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblsalesdetails`
--

CREATE TABLE `tblsalesdetails` (
  `Id` int(11) NOT NULL,
  `SalesId` int(11) NOT NULL,
  `ItemDetailId` int(11) NOT NULL,
  `Price` decimal(12,2) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Total` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblsettings`
--

CREATE TABLE `tblsettings` (
  `Id` int(11) NOT NULL,
  `CompanyName` varchar(50) DEFAULT NULL,
  `CompanyPhone` varchar(50) DEFAULT NULL,
  `CompanyAddress` varchar(50) DEFAULT NULL,
  `CompanyLogo` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblshipperpayments`
--

CREATE TABLE `tblshipperpayments` (
  `Id` int(11) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `PaymentDate` datetime NOT NULL,
  `ShipperId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblshippers`
--

CREATE TABLE `tblshippers` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblsizes`
--

CREATE TABLE `tblsizes` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Code` varchar(20) DEFAULT NULL,
  `SizeType` varchar(50) DEFAULT NULL,
  `Notes` varchar(550) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblstocks`
--

CREATE TABLE `tblstocks` (
  `Id` int(11) NOT NULL,
  `SupplyId` int(11) NOT NULL,
  `WarehouseId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblsubgroups`
--

CREATE TABLE `tblsubgroups` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `GroupId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblsupplies`
--

CREATE TABLE `tblsupplies` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Notes` varchar(550) DEFAULT NULL,
  `SubGroupId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbltransferdetails`
--

CREATE TABLE `tbltransferdetails` (
  `Id` int(11) NOT NULL,
  `WarehouseTransferId` int(11) NOT NULL,
  `ItemDetailId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbltransportdetails`
--

CREATE TABLE `tbltransportdetails` (
  `Id` int(11) NOT NULL,
  `TransportId` int(11) NOT NULL,
  `SupplyId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbltransports`
--

CREATE TABLE `tbltransports` (
  `Id` int(11) NOT NULL,
  `FromWarehouse` varchar(50) DEFAULT NULL,
  `ToWarehouse` varchar(50) DEFAULT NULL,
  `TransportDate` datetime NOT NULL,
  `Notes` varchar(550) DEFAULT NULL,
  `UserId` int(11) NOT NULL,
  `TransferType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbltrips`
--

CREATE TABLE `tbltrips` (
  `Id` int(11) NOT NULL,
  `ShipperId` int(11) NOT NULL,
  `SalesId` int(11) NOT NULL,
  `TripDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblunits`
--

CREATE TABLE `tblunits` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `UserType` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblwarehouses`
--

CREATE TABLE `tblwarehouses` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Code` varchar(20) DEFAULT NULL,
  `Address` varchar(550) DEFAULT NULL,
  `Notes` varchar(550) DEFAULT NULL,
  `BranchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblwarehousetransfers`
--

CREATE TABLE `tblwarehousetransfers` (
  `Id` int(11) NOT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `FromWarehouse` varchar(50) DEFAULT NULL,
  `ToWarehouse` varchar(50) DEFAULT NULL,
  `EmployeeId` int(11) DEFAULT NULL,
  `TransferDate` datetime NOT NULL,
  `Notes` varchar(550) DEFAULT NULL,
  `UserId` int(11) NOT NULL,
  `TransferType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblbranches`
--
ALTER TABLE `tblbranches`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblcategories`
--
ALTER TABLE `tblcategories`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblcities`
--
ALTER TABLE `tblcities`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblCities_TblCountries` (`CountryId`);

--
-- Indexes for table `tblclientdiscounts`
--
ALTER TABLE `tblclientdiscounts`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblClientDiscounts_TblCategories` (`CategoryId`),
  ADD KEY `FK_TblClientDiscounts_TblClients` (`ClientId`);

--
-- Indexes for table `tblclientphones`
--
ALTER TABLE `tblclientphones`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblClientPhones_TblClients` (`ClientId`);

--
-- Indexes for table `tblclients`
--
ALTER TABLE `tblclients`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblClients_TblRegions` (`RegionId`);

--
-- Indexes for table `tblcountries`
--
ALTER TABLE `tblcountries`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblemployee`
--
ALTER TABLE `tblemployee`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblEmployee_TblJobs` (`JobId`);

--
-- Indexes for table `tblgroups`
--
ALTER TABLE `tblgroups`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblinventory`
--
ALTER TABLE `tblinventory`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblInventory_TblItems` (`ItemId`),
  ADD KEY `FK_TblInventory_TblWarehouses` (`WarehouseId`);

--
-- Indexes for table `tblitemdetails`
--
ALTER TABLE `tblitemdetails`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblItemDetails_TblItems` (`ItemId`),
  ADD KEY `FK_TblItemDetails_TblUnits` (`UnitId`);

--
-- Indexes for table `tblitems`
--
ALTER TABLE `tblitems`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblItems_TblProducts` (`ProductId`),
  ADD KEY `FK_TblItems_TblSizes` (`SizeId`);

--
-- Indexes for table `tbljobs`
--
ALTER TABLE `tbljobs`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblorderdetails`
--
ALTER TABLE `tblorderdetails`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblOrderDetails_TblItemDetails` (`ItemDetailId`),
  ADD KEY `FK_TblOrderDetails_TblOrders` (`OrderId`);

--
-- Indexes for table `tblorders`
--
ALTER TABLE `tblorders`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblOrders_TblClients` (`ClientId`);

--
-- Indexes for table `tblpackagedetails`
--
ALTER TABLE `tblpackagedetails`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblPackageDetails_TblItemDetails` (`ItemDetailId`),
  ADD KEY `FK_TblPackageDetails_TblPackages` (`PackageId`);

--
-- Indexes for table `tblpackages`
--
ALTER TABLE `tblpackages`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblpayments`
--
ALTER TABLE `tblpayments`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblPayments_TblClients` (`ClientId`);

--
-- Indexes for table `tblproducts`
--
ALTER TABLE `tblproducts`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblProducts_TblCategories` (`CategoryId`);

--
-- Indexes for table `tblregions`
--
ALTER TABLE `tblregions`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblRegions_TblCities` (`CityId`);

--
-- Indexes for table `tblsales`
--
ALTER TABLE `tblsales`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblSales_TblClients` (`ClientId`),
  ADD KEY `FK_TblSales_TblWarehouses` (`WarehouseId`);

--
-- Indexes for table `tblsalesdetails`
--
ALTER TABLE `tblsalesdetails`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblSalesDetails_TblItemDetails` (`ItemDetailId`),
  ADD KEY `FK_TblSalesDetails_TblSales` (`SalesId`);

--
-- Indexes for table `tblsettings`
--
ALTER TABLE `tblsettings`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblshipperpayments`
--
ALTER TABLE `tblshipperpayments`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblShipperPayments_TblShippers` (`ShipperId`);

--
-- Indexes for table `tblshippers`
--
ALTER TABLE `tblshippers`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblsizes`
--
ALTER TABLE `tblsizes`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblstocks`
--
ALTER TABLE `tblstocks`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblStocks_TblSupplies` (`SupplyId`),
  ADD KEY `FK_TblStocks_TblWarehouses` (`WarehouseId`);

--
-- Indexes for table `tblsubgroups`
--
ALTER TABLE `tblsubgroups`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblSubGroups_TblGroups` (`GroupId`);

--
-- Indexes for table `tblsupplies`
--
ALTER TABLE `tblsupplies`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblSupplies_TblSubGroups` (`SubGroupId`);

--
-- Indexes for table `tbltransferdetails`
--
ALTER TABLE `tbltransferdetails`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblTransferDetails_TblItemDetails` (`ItemDetailId`),
  ADD KEY `FK_TblTransferDetails_TblWarehouseTransfers` (`WarehouseTransferId`);

--
-- Indexes for table `tbltransportdetails`
--
ALTER TABLE `tbltransportdetails`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblTrnsportDetails_TblSupplies` (`SupplyId`),
  ADD KEY `FK_TblTrnsportDetails_TblTransports` (`TransportId`);

--
-- Indexes for table `tbltransports`
--
ALTER TABLE `tbltransports`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblTransports_TblUsers` (`UserId`);

--
-- Indexes for table `tbltrips`
--
ALTER TABLE `tbltrips`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblTrips_TblSales` (`SalesId`),
  ADD KEY `FK_TblTrips_TblShippers` (`ShipperId`);

--
-- Indexes for table `tblunits`
--
ALTER TABLE `tblunits`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblwarehouses`
--
ALTER TABLE `tblwarehouses`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblWarehouses_TblBranches` (`BranchId`);

--
-- Indexes for table `tblwarehousetransfers`
--
ALTER TABLE `tblwarehousetransfers`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_TblWarehouseTransfers_TblEmployee` (`EmployeeId`),
  ADD KEY `FK_TblWarehouseTransfers_TblUsers` (`UserId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblcities`
--
ALTER TABLE `tblcities`
  ADD CONSTRAINT `FK_TblCities_TblCountries` FOREIGN KEY (`CountryId`) REFERENCES `tblcountries` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblclientdiscounts`
--
ALTER TABLE `tblclientdiscounts`
  ADD CONSTRAINT `FK_TblClientDiscounts_TblCategories` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategories` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TblClientDiscounts_TblClients` FOREIGN KEY (`ClientId`) REFERENCES `tblclients` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblclientphones`
--
ALTER TABLE `tblclientphones`
  ADD CONSTRAINT `FK_TblClientPhones_TblClients` FOREIGN KEY (`ClientId`) REFERENCES `tblclients` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblclients`
--
ALTER TABLE `tblclients`
  ADD CONSTRAINT `FK_TblClients_TblRegions` FOREIGN KEY (`RegionId`) REFERENCES `tblregions` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblemployee`
--
ALTER TABLE `tblemployee`
  ADD CONSTRAINT `FK_TblEmployee_TblJobs` FOREIGN KEY (`JobId`) REFERENCES `tbljobs` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblinventory`
--
ALTER TABLE `tblinventory`
  ADD CONSTRAINT `FK_TblInventory_TblItems` FOREIGN KEY (`ItemId`) REFERENCES `tblitems` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TblInventory_TblWarehouses` FOREIGN KEY (`WarehouseId`) REFERENCES `tblwarehouses` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblitemdetails`
--
ALTER TABLE `tblitemdetails`
  ADD CONSTRAINT `FK_TblItemDetails_TblItems` FOREIGN KEY (`ItemId`) REFERENCES `tblitems` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TblItemDetails_TblUnits` FOREIGN KEY (`UnitId`) REFERENCES `tblunits` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblitems`
--
ALTER TABLE `tblitems`
  ADD CONSTRAINT `FK_TblItems_TblProducts` FOREIGN KEY (`ProductId`) REFERENCES `tblproducts` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TblItems_TblSizes` FOREIGN KEY (`SizeId`) REFERENCES `tblsizes` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblorderdetails`
--
ALTER TABLE `tblorderdetails`
  ADD CONSTRAINT `FK_TblOrderDetails_TblItemDetails` FOREIGN KEY (`ItemDetailId`) REFERENCES `tblitemdetails` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TblOrderDetails_TblOrders` FOREIGN KEY (`OrderId`) REFERENCES `tblorders` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblorders`
--
ALTER TABLE `tblorders`
  ADD CONSTRAINT `FK_TblOrders_TblClients` FOREIGN KEY (`ClientId`) REFERENCES `tblclients` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblpackagedetails`
--
ALTER TABLE `tblpackagedetails`
  ADD CONSTRAINT `FK_TblPackageDetails_TblItemDetails` FOREIGN KEY (`ItemDetailId`) REFERENCES `tblitemdetails` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TblPackageDetails_TblPackages` FOREIGN KEY (`PackageId`) REFERENCES `tblpackages` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblpayments`
--
ALTER TABLE `tblpayments`
  ADD CONSTRAINT `FK_TblPayments_TblClients` FOREIGN KEY (`ClientId`) REFERENCES `tblclients` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblproducts`
--
ALTER TABLE `tblproducts`
  ADD CONSTRAINT `FK_TblProducts_TblCategories` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategories` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblregions`
--
ALTER TABLE `tblregions`
  ADD CONSTRAINT `FK_TblRegions_TblCities` FOREIGN KEY (`CityId`) REFERENCES `tblcities` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblsales`
--
ALTER TABLE `tblsales`
  ADD CONSTRAINT `FK_TblSales_TblClients` FOREIGN KEY (`ClientId`) REFERENCES `tblclients` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TblSales_TblWarehouses` FOREIGN KEY (`WarehouseId`) REFERENCES `tblwarehouses` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblsalesdetails`
--
ALTER TABLE `tblsalesdetails`
  ADD CONSTRAINT `FK_TblSalesDetails_TblItemDetails` FOREIGN KEY (`ItemDetailId`) REFERENCES `tblitemdetails` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TblSalesDetails_TblSales` FOREIGN KEY (`SalesId`) REFERENCES `tblsales` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblshipperpayments`
--
ALTER TABLE `tblshipperpayments`
  ADD CONSTRAINT `FK_TblShipperPayments_TblShippers` FOREIGN KEY (`ShipperId`) REFERENCES `tblshippers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblstocks`
--
ALTER TABLE `tblstocks`
  ADD CONSTRAINT `FK_TblStocks_TblSupplies` FOREIGN KEY (`SupplyId`) REFERENCES `tblsupplies` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TblStocks_TblWarehouses` FOREIGN KEY (`WarehouseId`) REFERENCES `tblwarehouses` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblsubgroups`
--
ALTER TABLE `tblsubgroups`
  ADD CONSTRAINT `FK_TblSubGroups_TblGroups` FOREIGN KEY (`GroupId`) REFERENCES `tblgroups` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblsupplies`
--
ALTER TABLE `tblsupplies`
  ADD CONSTRAINT `FK_TblSupplies_TblSubGroups` FOREIGN KEY (`SubGroupId`) REFERENCES `tblsubgroups` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbltransferdetails`
--
ALTER TABLE `tbltransferdetails`
  ADD CONSTRAINT `FK_TblTransferDetails_TblItemDetails` FOREIGN KEY (`ItemDetailId`) REFERENCES `tblitemdetails` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TblTransferDetails_TblWarehouseTransfers` FOREIGN KEY (`WarehouseTransferId`) REFERENCES `tblwarehousetransfers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbltransportdetails`
--
ALTER TABLE `tbltransportdetails`
  ADD CONSTRAINT `FK_TblTrnsportDetails_TblSupplies` FOREIGN KEY (`SupplyId`) REFERENCES `tblsupplies` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TblTrnsportDetails_TblTransports` FOREIGN KEY (`TransportId`) REFERENCES `tbltransports` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbltransports`
--
ALTER TABLE `tbltransports`
  ADD CONSTRAINT `FK_TblTransports_TblUsers` FOREIGN KEY (`UserId`) REFERENCES `tblusers` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbltrips`
--
ALTER TABLE `tbltrips`
  ADD CONSTRAINT `FK_TblTrips_TblSales` FOREIGN KEY (`SalesId`) REFERENCES `tblsales` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TblTrips_TblShippers` FOREIGN KEY (`ShipperId`) REFERENCES `tblshippers` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblwarehouses`
--
ALTER TABLE `tblwarehouses`
  ADD CONSTRAINT `FK_TblWarehouses_TblBranches` FOREIGN KEY (`BranchId`) REFERENCES `tblbranches` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblwarehousetransfers`
--
ALTER TABLE `tblwarehousetransfers`
  ADD CONSTRAINT `FK_TblWarehouseTransfers_TblEmployee` FOREIGN KEY (`EmployeeId`) REFERENCES `tblemployee` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TblWarehouseTransfers_TblUsers` FOREIGN KEY (`UserId`) REFERENCES `tblusers` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
