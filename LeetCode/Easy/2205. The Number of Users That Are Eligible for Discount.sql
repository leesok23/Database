CREATE FUNCTION getUserIDs(startDate DATE, endDate DATE, minAmount INT) RETURNS INT
BEGIN
  RETURN (
      select count(distinct user_id) as user_cnt
      from purchases
      where date(time_stamp) >= startdate and date(time_stamp) < enddate and amount >= minamount
  );
END
