# script purpose: checking the database first then create database and 3 schema
# warning: if you running this script all old databese drop and create as new database(may be lost old databse information)
# paramaters
  
USE MASTER
 IF EXISTS (SELECT * FROM SYS.databases where name = 'Aproject' ) 
 DROP DATABASE aproject
 go
CREATE DATABASE Aproject
GO
USE Aproject
GO
CREATE SCHEMA BRONZE
GO
CREATE SCHEMA SILVER
GO
CREATE SCHEMA GOLD 
GO
