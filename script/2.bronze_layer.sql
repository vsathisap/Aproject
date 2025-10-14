if OBJECT_ID('bronze.cust_info','u') is not null
drop table bronze.cust_info
go
create table bronze.cust_info(
	cst_id	int,
	cst_key	nvarchar(15),
	cst_firstname	nvarchar(15),
	cst_lastname	nvarchar(15),
	cst_marital_status	nvarchar(10),
	cst_gndr	nvarchar(10),
	cst_create_date date
)
go
if OBJECT_ID('bronze.prd_info','u') is not null
drop table bronze.prd_info
go
create table bronze.prd_info(
	
prd_id	int,
prd_key	 nvarchar(12),
prd_nm    nvarchar(52),
prd_cost	int,
prd_line	nvarchar(12),
prd_start_dt	date,
prd_end_dt date
)
go
if OBJECT_ID('bronze.sales_details','u') is not null
drop table bronze.sales_details
go
create table bronze.sales_details(
sls_ord_num	 nvarchar(12),
sls_prd_key	nvarchar(12),
sls_cust_id	int,
sls_order_dt int,
sls_ship_dt	int,
sls_due_dt	int,
sls_sales	int,
sls_quantity int,
sls_price int

)
go

if OBJECT_ID('bronze.cust_az12','u') is not null
drop table bronze.cust_az12
go
create table bronze.cust_az12(
	CID	  nvarchar(12),
	BDATE	date,
	GEN nvarchar(12)

)
go
if OBJECT_ID('bronze.loc_a101','u') is not null
drop table bronze.loc_a101
go
create table bronze.loc_a101(
CID	nvarchar(20),
CNTRY nvarchar(12)
)
go

if OBJECT_ID('bronze.px_cat_g1v2','u') is not null
drop table bronze.px_cat_g1v2
go
create table bronze.px_cat_g1v2(
ID	nvarchar(20),
CAT	nvarchar(20),
SUBCAT	nvarchar(20),
MAINTENANCE nvarchar(20),

)




