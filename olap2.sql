
CREATE TABLE DimHotel2(
    HotelID INT PRIMARY KEY,
    HotelName VARCHAR(255),
    Region VARCHAR(255),
    Country VARCHAR(255),
    State VARCHAR(255),
    City VARCHAR(255),
    StarRating INT,
    HotelType VARCHAR(255)
);

INSERT INTO DimHotel2(HotelID, HotelName, Region, Country, State, City, StarRating, HotelType) VALUES
(1, 'Edeforsvägen 2A', 'Sweden', 'Sweden', 'Harads', 'Vid väg 97', 5, 'Hotel'),
(2, 'Edeforsvägen 2 A', 'Sweden', 'Sweden', 'Harads', 'Vid väg 97', 4, 'Hotel'),
(3, 'Edeforsvägen 2', 'Sweden', 'Sweden', 'Harads', 'Vid väg 97', 3, 'Hotel'),
(4, 'Kakslauttanen', 'Finland', 'Finland', 'Saariselkä', 'Kakslauttanen', 5, 'Hotel'),
(5, 'Kakslauttanen', 'Finland', 'Finland', 'Saariselkä', 'Kakslauttanen', 4, 'Hotel'),
(6, '77 1st Ave NW', 'Canada', 'Canada', 'Alberta', 'Edmonton', 3, 'Hotel');

create table FactHotelOccupy5(
HotelId int,
RoomID int,
CustomerId int,
Date1 date,
No_of_occupied_rooms int,
No_of_vacant_rooms int,
Revenue int,
foreign key (HotelId) references DimHotel2(HotelId)
);

insert into FactHotelOccupy5 values(1,2,6,'2012-12-21',60,240,111615674),
(2,5,4,'2015-06-01',150,50,875843568),
(3,3,1,'2016-03-08',325,175,888765327),
(4,4,3,'2019-04-04',236,214,777655532),
(5,6,2,'2018-06-27',284,416,334455522),
(6,1,5,'2015-12-06',657,43,987654329);

select *from FactHotelOccupy5;
select *from DimHotel2;


-- roll up operation
select Region, Country , State , City, sum(Revenue) from DimHotel2
inner join FactHotelOccupy5 on
DimHotel2.HotelID = FactHotelOccupy5.HotelId
group by Region,Country, State , City
with Rollup;

-- drill down operation
select Country , StarRating, sum(Revenue) from DimHotel2
inner join FactHotelOccupy5 on 
DimHotel2.HotelID = FactHotelOccupy5.HotelId
where Country in ('Canada','Sweden') and StarRating in (1,2,3,4,5)
group by Country , StarRating;

-- slice
select Country, HotelType, Sum(Revenue) from DimHotel2
inner join
FactHotelOccupy5 on
DimHotel2.HotelID = FactHotelOccupy5.HotelId
where HotelType='Hotel' 
group by Country;

-- dice
select Country, HotelType, Sum(Revenue) from DimHotel2
inner join
FactHotelOccupy5 on
DimHotel2.HotelID = FactHotelOccupy5.HotelId
where HotelType='Hotel' and Country = 'Canada' 
group by Country;

