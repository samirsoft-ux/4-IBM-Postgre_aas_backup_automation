echo is-COPIA BASE DE DATOS
color a
SET PG_BIN="C:\Program Files\PostgreSQL\15\bin\pg_dump.exe"
SET PG_HOST=77b812af-8807-488f-8366-c11c6e9b17ef.c9v3nahd0oekcvsra2t0.private.databases.appdomain.cloud
SET PG_PORT=30405
SET PG_DATABASE=ibmclouddb
SET PG_USER=ibm_cloud_1e29545b_8941_49a9_9d3a_1786cb7e3d1b
SET PGPASSWORD=7ae87986286a8a764ebdbff9594c4ef9af84b825286512a3c301216c2f6ffdda
SET FECHAYHORA=%date:/=-%-%time:~0,8%
SET FECHAYHORA=%FECHAYHORA::=-%
SET FECHAYHORA=%FECHAYHORA: =0%
SET PG_FILENAME="C:\Users\Administrator.VSI-PLAYBOOK-WA\Desktop\backups\backup_%PG_DATABASE%_%FECHAYHORA%.backup"
%PG_BIN% -h %PG_HOST% -p %PG_PORT% -U %PG_USER% --format custom -b -f %PG_FILENAME% %PG_DATABASE%
SET APIKEY=4e3e05dvd_CapFjc1WaE1XlQCOZU3MFqs3ZJ9ihMa9iN
SET REGION=us-south
ibmcloud login --apikey %APIKEY% -r %REGION%
SET ACTION=object-put
SET NAME=hopefully-works
SET NAMEASOBJECT=backup_%PG_DATABASE%_%FECHAYHORA%.backup
ibmcloud cos %ACTION% --bucket %NAME% --key %NAMEASOBJECT% --body %PG_FILENAME%