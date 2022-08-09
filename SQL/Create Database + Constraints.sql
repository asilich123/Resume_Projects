CREATE DATABASE DataAnalysis
CREATE TABLE LAOutliers(
    PropertyID INT NOT NULL IDENTITY(001, 1) PRIMARY KEY,
    PAddress VARCHAR(255),
    City VARCHAR(255) CHECK(City='Los Angeles'),
    ZipCode INT CHECK(ZipCode>=90000),
    Profit INT NOT NULL,
    AROI DECIMAL(4,2) NOT NULL,
    PossibleReason VARCHAR(255))