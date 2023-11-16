-- one script prepares structures and populates tables

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

  insert into teachers values (1, 'Emily Anderson');
  insert into teachers values (2, 'John Richards');
  insert into teachers values (3, 'Rosalinde Whitehouse');
  insert into teachers values (4, 'Richard Gere');
  
  insert into students values (1, 1, 'Johnny');
  insert into students values (2, 1, 'Amy');
  insert into students values (3, 1, 'Riki');
  insert into students values (4, 1, 'Isabelle');
  insert into students values (5, 2, 'Richmond');
  insert into students values (6, 2, 'Walter');
  insert into students values (7, 3, 'Susan');
  insert into students values (8, 3, 'Veronica');
  insert into students values (9, 3, 'Monica');
  insert into students values (10, 3, 'Adam');
  insert into students values (11, 3, 'Eric');

end;
/