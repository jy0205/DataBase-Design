create trigger modify_age
before insert or update on users_userinfo
referencing new row as newTuple
for each row
begin
	if(newTuple.AGE > 100) then
		newTuple.AGE = 100;
	end if;
end

create trigger deleteMsg
before delete on users_userinfo
for each row
begin
	delete from useroperate_userbuy
		where useroperate_userbuy.user_id = old.id;
	delete from useroperate_usercomments
		where useroperate_usercomments.user_id = old.id;
	delete from useroperate_userlove
		where useroperate_userlove.user_id = old.id;
	delete from useroperate_usermessage
		where useroperate_usermessage.user_id = old.id;
end

create trigger add_log
after insert on users_userinfo
for each row
begin
	insert into admin_log(user_id,op_id)
		values(new.id,1)
end

create trigger add_log_1
after delete on users_userinfo
for each row
begin
	insert into admin_log(user_id,op_id)
		values(old.id,2)
end