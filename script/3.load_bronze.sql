create or alter proc load_bronze as 
begin
declare @start datetime2 , 
@end datetime2 ,
@startbatch  datetime2 ,
@endbatch datetime2 
--- DURATION TRACKING(OPTIMIZE ,DETECT ISSUES,MONITOR TRENDS)
set  @startbatch = GETDATE()
begin try -- error handle(data intigrity),debugg issues
-----------------------------------------------------------------------
print 'data from crm tables'
------------------------------------------------------------------------
--add  print (debugg issue- tracking issue , understand flow)
print 'insert into cust_info'
SET @START = GETDATE() 
truncate table BRONZE.cust_info
bulk insert BRONZE.cust_info 
from 'C:\Users\satti\Desktop\project\source_crm\cust_info.csv'
with (firstrow = 2 , fieldterminator = ',', tablock)
SET @END = GETDATE() 
PRINT 'CUST_INFO TABLE TIME:' + CAST ( DATEDIFF(MILLISECOND,@start,@end) AS NVARCHAR(20)) 


print 'insert into prot_info'


SET @START = GETDATE() 
truncate table  BRONZE.prd_info
bulk insert BRONZE.prd_info
from 'C:\Users\satti\Desktop\project\source_crm\prd_info.csv'
with (firstrow = 2 , fieldterminator = ',', tablock)
SET @END = GETDATE() 

PRINT 'PROD_INFO TABLE TIME:' + CAST ( DATEDIFF(MILLISECOND,@start,@end) AS NVARCHAR(20))

print 'insert into sales_details'
SET @START = GETDATE() 
truncate table  BRONZE.sales_details
bulk insert BRONZE.sales_details 
from 'C:\Users\satti\Desktop\project\source_crm\sales_details.csv'
with (firstrow = 2 , fieldterminator = ',', tablock)
SET @END = GETDATE() 
PRINT 'SALES_DETAILS TABLE TIME:' + CAST ( DATEDIFF(MILLISECOND,@start,@end) AS NVARCHAR(20))

-----------------------------------------------------------------------
print 'data from erp tables'
------------------------------------------------------------------------

print 'insert into cust_az12'
SET @START = GETDATE() 
truncate table BRONZE.cust_az12
bulk insert BRONZE.cust_az12 
from 'C:\Users\satti\Desktop\project\source_erp\cust_az12.csv'
with (firstrow = 2 , fieldterminator = ',', tablock)
SET @END = GETDATE() 
PRINT 'CUST_AZ12 TABLE TIME:' + CAST ( DATEDIFF(MILLISECOND,@start,@end) AS NVARCHAR(20))


print 'insert into loc_a101'
SET @START = GETDATE() 
truncate table BRONZE.loc_a101
bulk insert BRONZE.loc_a101 
from 'C:\Users\satti\Desktop\project\source_erp\loc_a101.csv'
with (firstrow = 2 , fieldterminator = ',', tablock)
SET @END = GETDATE() 
PRINT 'LOC_A101 TABLE TIME:' + CAST ( DATEDIFF(MILLISECOND,@start,@end) AS NVARCHAR(20))


print 'insert into px_cat_g1v2'
SET @START = GETDATE() 
truncate table BRONZE.px_cat_g1v2
bulk insert BRONZE.px_cat_g1v2
from 'C:\Users\satti\Desktop\project\source_erp\px_cat_g1v2.csv'
with (firstrow = 2 , fieldterminator = ',', tablock)
SET @END = GETDATE() 
PRINT 'PX_CAT_GLV2 TABLE TIME:' + CAST ( DATEDIFF(MILLISECOND,@start,@end) AS NVARCHAR(20))

    END TRY
    BEGIN CATCH
        PRINT 'Error occurred';
        PRINT 'Error message: ' + ERROR_MESSAGE();
        PRINT 'Error state: ' + CAST(ERROR_STATE() AS NVARCHAR(50));
        PRINT 'Error number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(50));
    END CATCH

set @endbatch = GETDATE()

PRINT 'LOAD BRONZE LAYER TIME:' + CAST ( DATEDIFF(MILLISECOND,@starTBATCH,@endBATCH) AS NVARCHAR(20))

END;
