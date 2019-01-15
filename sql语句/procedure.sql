create procedure find_all_product()
begin
	select * from commodity_product;
end

create procedure find_product_detail(in newid int)
begin
	select tag from commodity_product 
	where id = newid;
	update commodity_product set ClickNum = ClickNum + 1 
	where id = newid;
end

create procedure find_comments(in newid int)
begin
	select comments from useroperate_usercomments 
	where product_id = newid;
end

create procedure add_comments(in userid int, in p_id int, 
	in comment varchar(250), in add_time datetime(6))
begin
	insert into useroperate_usercomments(comments,CommentTime,product_id,user_id)
	values(comment,add_time,p_id,userid);
end

create procedure find_all_shop()
begin
	select * from shop_shop;
end

create procedure find_shop_detail(in newid int)
begin
	select * from shop_shop 
	where id = newid;
	update shop_shop set ClickNum = ClickNum + 1 
	where id = newid;
end

create procedure find_shop_product(in newid int)
begin
	select * from commodity_product 
	where product_shop_id = newid;
end

create procedure add_fav(in u_id int, in l_id int, 
	in type int, in add_time datetime(6))
begin
	insert into useroperate_userlove(LoveId,LoveType,LoveTime,user_id)
	values(l_id,type,add_time,u_id);
end

create procedure buy(in u_id int, in p_id int, in add_time datetime(6))
begin
	insert into useroperate_userbuy(product_id,user_id,BuyTime)
	values(p_id,u_id,add_time);
end

create procedure select_mybuy(in u_id int)
begin
	select product_id from useroperate_userbuy
	where user_id = u_id;
end

create procedure find_all_brand()
begin
	select * from shop_brand;
end

create procedure find_brand_detail(in newid int)
begin
	select * from shop_brand 
	where id = newid;
	update shop_brand set ClickNum = ClickNum + 1 
	where id = newid;
end

create procedure login(in em varchar(254),in pwd varchar(128), out flag int)
as declare
	succeed int;
begin
	select id into succeed from users_userinfo
	where email = em and password = pwd;
	if succeed is NULL then
		set flag = 0;
		return;
	end if;
	set flag = 1;
end

create procedure register(in em varchar(254),in pwd varchar(128), out flag int)
as declare
	succeed int;
begin
	select id into succeed from users_userinfo
	where email = em;
	if succeed is NULL then
		set flag = 0;
		return;
	end if;
	if succeed is not NULL then
		insert into users_userinfo(email,password)
			values(em,pwd);
		set flag = 1;
		return
	end if;
end

create procedure modify_pwd(in u_id int,in pwd varchar(128))
begin
	update users_userinfo
	set password = pwd
	where id = u_id;
end

