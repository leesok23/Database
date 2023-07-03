CREATE PROCEDURE getUserIDs(startDate DATE, endDate DATE, minAmount INT)
BEGIN
    select distinct user_id
    from purchases
    where amount >= minAmount and time_stamp between timestamp(startDate) and timestamp(endDate)
    order by 1;
END
