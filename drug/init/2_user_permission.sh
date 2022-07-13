psql -U root -d drugdb << "EOSQL"
ALTER ROLE drug_user WITH SUPERUSER;
CREATE SCHEMA drug_user;
EOSQL