create user jitu identified by 'jitu123';

show grants for jitu;

-- grant statement 
grant select on newdb.* to jitu;

show grants for jitu;


-- role
create role if not exists 'hr_role';

-- no user in the role
select to_user as 'user', to_host as 'host'
from mysql.role_edges
where from_user = 'hr_role';

-- create user 
create user aman99 identified by 'aman123';

grant select on newdb.* to jitu;



