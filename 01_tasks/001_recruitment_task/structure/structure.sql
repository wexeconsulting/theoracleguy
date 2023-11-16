-- one script prepares structures (rebuilds it if it exists)
declare 
  procedure drop_table_no_exc(p_tablename varchar2) is
  begin
    execute immediate 'drop table '||p_tablename||' purge';
  exception when others then null;
  end;
begin
  drop_table_no_exc('students');
  drop_table_no_exc('teachers');
  execute immediate 'create table teachers 
                     (id   number(3), 
                      name varchar2(127), 
                      constraint teachers_pk primary key (id))';
  execute immediate 'create table students 
                     (id          number(5), 
                      teachers_id number(3) not null, 
                      name        varchar2(127), 
                      constraint students_pk primary key (id), 
                      constraint students_fk foreign key (teachers_id) references teachers(id))';
end;
/