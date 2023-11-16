--this script will clean your databases of the objects created by structure.sql
declare 
  procedure drop_table_no_exc(p_tablename varchar2) is
  begin
    execute immediate 'drop table '||p_tablename||' purge';
  exception when others then null;
  end;
begin
  drop_table_no_exc('students');
  drop_table_no_exc('teachers');
end;