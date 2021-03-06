CREATE SCHEMA `puntoVenta`;

USE `puntoVenta`;

CREATE TABLE `Category`(`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY, `name` VARCHAR(50) NOT NULL, `description` VARCHAR(50) NOT NULL);

CREATE TABLE `Provider`(`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY, `name` VARCHAR(50) NOT NULL, `address` VARCHAR(50) NOT NULL, `phone` VARCHAR(50) NOT NULL, `website` VARCHAR(50) NOT NULL);

CREATE TABLE `Product`(`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY, `name` VARCHAR(50) NOT NULL, `price` DECIMAL(10,2) NOT NULL, 
`providerId` INT NOT NULL, `categoryId` INT NOT NULL);

SHOW COLUMNS FROM `Product`;

ALTER TABLE `Product` ADD CONSTRAINT fk_CatPro FOREIGN KEY (`categoryId`) REFERENCES `Category`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Product` ADD CONSTRAINT fk_ProvPro FOREIGN KEY (`providerId`) REFERENCES `Provider`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `Customer`(`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY, `rfc` VARCHAR(13) NOT NULL, `name` VARCHAR(50) NOT NULL, `address` VARCHAR(50) NOT NULL, `phone` VARCHAR(50) NOT NULL);

CREATE TABLE `Sale`(`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY, `date` DATE NOT NULL, `price` DECIMAL(10,2) NOT NULL, 
`total` DECIMAL(10,2) NOT NULL, `customerId` INT NOT NULL);

ALTER TABLE `Sale` ADD CONSTRAINT fk_CusSale FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `SaleItem`(`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY, `productId` INT NOT NULL, `saleId` INT NOT NULL, `price` DECIMAL(10,2) NOT NULL, 
`quantity` INT NOT NULL, `total` DECIMAL(10,2) NOT NULL);

ALTER TABLE `SaleItem` ADD CONSTRAINT fk_ProSale FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `SaleItem` ADD CONSTRAINT fk_SaleSale FOREIGN KEY (`saleId`) REFERENCES `Sale`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;


