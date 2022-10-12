/*
	1. Library Table
*/

create table Library(
	libraryName varchar(100) NOT NULL,
	libraryLocation varchar(100) NOT NULL,
	numberOfBooks int,
	numberOfBooksIssued int,
	numberOfBooksReturned int,
	numberOfStaffs int
)

insert into Library values('National Library System','UET Lahore',1000,10,8,25)
Select * from Library

/*
	2. LibraryStaff Table
*/

create table LibraryStaff(
	lsId varchar(10) primary key not null,
	lsName varchar(20) not null,
	lsAddress varchar(50) not null,
	lsType varchar(20) not null,
	lsPhone varchar(20) unique not null
)

insert into LibraryStaff values('LS1','Ali','Lahore','Librarian','0310-0330303')
insert into LibraryStaff values('L1','Ahmad','GRW','Librarian','0310-0330301')
insert into LibraryStaff values('L2','Ahmad','GRW','Librarian','0310-0330302')
Select * from LibraryStaff
delete from LibraryStaff where LibraryStaff.lsId = 'L1'

/*
	3. Librarian Table
*/


create table Librarian(
	libraryStaffId varchar(10) foreign key references LibraryStaff(lsId),
	librarianName varchar(20) unique not null,
	librarianPassword varchar(20) not null
)

insert into Librarian values('LS1','Ali@email.com','12345')
insert into Librarian values('L1','Ali@gmail.com','12345')
insert into Librarian values('LS2','Ahmad','12345')
Select * from Librarian
delete from Librarian where Librarian.libraryStaffId='L1'
/*
	4. Book Table
*/

create table Book(
	bookId varchar(15) Primary key Not null,
	bookAuthor varchar(15) not null,
	bookName varchar(25) not null,
	bookPrice int not null,
	bookStatus varchar(20) not null,
	bookEditor varchar(20) not null,
	bookDateOfPurchase Date not null
)

insert into Book values('Book1','Napolean Hill','Think and Grow Rich',200,'Motivational','Chief Buttler','2020-12-13')
insert into Book values('Book2','Napolean Hill','Think and Grow Rich',200,'Motivational','Chief Buttler','2020-12-13')
insert into Book values('Book3','Napolean Hill','Think and Grow Rich',200,'Motivational','Chief Buttler','2020/12/13')

delete from book where Book.bookId = 'Book1'
select * from Book

/*
	5. Member Table
*/


create table Member(
	memberId varchar(15) primary key not null,
	memberType varchar(15) not null,
	dateOfMembership date not null,
	noOfBooksIssued int not null,
	memberAddress varchar(25) not null,
	memberPhone varchar(13) unique not null 
)

insert into Member values('student1','student','2020-01-01',0,'Turkey','04722342342')
insert into Member values('teacher2','student','2020-01-01',0,'Turkey','04423423427')

delete from Member where memberId = 't2'
update Member set memberPhone = '32' where memberId = 's1'
select * from Member

/*
	3. Bill Table
*/


Create table Bill(
	billNumber varchar(10) unique not null,
	billId varchar(10) primary key not null,
	memberId varchar(15) foreign key references Member(memberId),
	billAmount int not null
)

insert into Bill values('b1','b1','s1',100)
insert into Bill values('b2','b2','s2',100)
insert into Bill values('b2','b2','t2',100)
delete from Bill where Bill.memberId = 't2'
select * from Bill

/*
	7. Transaction Table
*/


create table Transction(
	transactionId varchar(10) primary key not null,
	memberId varchar(15) foreign key references Member(memberId) not null,
	bookId varchar(15) foreign key references Book(bookId),
	dateOfIssue Date not null,
	dueDate Date not null
)

insert into Transction values('trans1','student1','book1','2020-01-01','2020-01-05')
insert into Transction values('trans2','teacher1','book1','2020-01-01','2020-01-05')

select * from Transction


Select * from Librarian where Librarian.librarianName = 'Ali@email.com' and Librarian.librarianPassword = '12345'


/*
	8. Rrturned Books Table
*/

create table returnedBooks(
	transactionId varchar(10) not null foreign key references Transction(transactionId),
	returnDate date not null
)

select Transction.dueDate from Transction where Transction.transactionId = 't1'

select t.transactionId,t.bookId,t.memberId,t.dueDate,r.returnDate from returnedBooks r inner join Transction t on r.transactionId = t.transactionId where r.transactionId = 't1'

insert into returnedBooks values('t1','2020-01-07')
delete from returnedBooks where returnedBooks.transactionId = 't1'
select * from returnedBooks


/*
delete Book

delete Librarian

delete Library

delete LibraryStaff

delete Member

drop table Member

drop table Book

drop table Librarian

drop table Library

drop table LibraryStaff
*/
